import { 
  Application,
  Router,
  denoPlugin,
  esbuild, 
  dotenv as _dotenv,
  GraphQLHTTP,
  makeExecutableSchema,
  Buffer
} from "../deps/deps.server.ts";

import { resolvers } from "./models/resolvers.ts";
import { typeDefs } from "./models/typedefs.ts";

const PORT = Number(Deno.env.get("PORT"));

const schema = makeExecutableSchema({ resolvers, typeDefs });

const resolve = GraphQLHTTP({
  schema,
  graphiql: true,
  context: (request) => ({ request }),
});

const handleGraphQL = async (ctx) => {
  // cast Oak request into a normal Request
  const req = new Request(ctx.request.url.toString(), {
    body: JSON.stringify(await ctx.request.body().value),
    headers: ctx.request.headers,
    method: ctx.request.method,
  })

  const res = await resolve(req)
  const chunks = [];

  for await (const chunk of res.body!) {
    chunks.push(chunk);
  }

  for (const [k, v] of res.headers.entries()) ctx.response.headers.append(k, v);

  ctx.response.status = res.status;
  ctx.response.body = Buffer.concat(chunks).toString();
};

// Transpile jsx to js for React.
await esbuild.initialize({
  worker: false,
});

const output = await esbuild.build({
  plugins: [denoPlugin()],
  entryPoints: ["./client/index.tsx"],
  write: false,
  bundle: true,
  format: "esm",
  absWorkingDir: Deno.cwd(),
});

// The raw transpiled output as a string.
const index = new TextDecoder().decode(output.outputFiles[0].contents);

// Setup server.
const app = new Application();

const router = new Router().all('/graphql', handleGraphQL)

app.use(router.routes(), router.allowedMethods());

// Return transpiled script as HTML string.
app.use((ctx) => {
  ctx.response.body = `
    <!doctype html>
    <html>
      <head>
        <title>Obsidian Demo</title>
      </head>
      <body>
        <div id="root" />
        <script>${index}</script>
      </body>
    </html>
  `;
});

// Start server.
console.log(`Listening on http://localhost:${PORT}`);
await app.listen({ port: PORT });
