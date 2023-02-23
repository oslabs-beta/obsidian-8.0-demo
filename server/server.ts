import { 
  Application,
  Router,
  send,
  denoPlugin,
  esbuild, 
  dotenv as _dotenv,
  GraphQLHTTP,
  makeExecutableSchema,
  Buffer
} from "../deps/deps.server.ts";

import { resolvers } from "./models/resolvers.ts";
import { typeDefs } from "./models/typedefs.ts";
import { writeJson, writeJsonSync } from 'https://deno.land/x/jsonfile/mod.ts';
import { readJson, readJsonSync } from 'https://deno.land/x/jsonfile/mod.ts';

const PORT = Number(Deno.env.get("PORT"));

const schema = makeExecutableSchema({ resolvers, typeDefs });

const resolve = GraphQLHTTP({
  schema,
  graphiql: true,
  context: (request) => ({ request }),
});

const handleGraphQL = async (ctx: any) => {
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

const router = new Router();

router.all('/graphql', handleGraphQL);

router.get('/fonts/:path+', async (ctx) => {
  /*const data = await Deno.readFile(Deno.cwd() + '/client' + ctx.request.url.pathname);
  const font = new Font(data);*/
  await send(ctx, ctx.request.url.pathname, {
    root: Deno.cwd() + '/client',
  });
});

router.get('/styles.css', async (ctx) => {
  await send(ctx, 'styles.css', {
    root: Deno.cwd() + '/client/stylesheets',
  });
});

router.post('/:path+', async (ctx, next) => {
    const data = await ctx.request.body().value;
    const charName = data.name;
    const url = data.url
    const json = data.json

    // photo.json holds standard names and better format, keep as back up
    // const json: any = readJsonSync('./client/photo.json')

    json[charName] = url;
    const newJson = writeJsonSync('./client/target.json', json);

    ctx.response.body = {};
    ctx.response.type = 'txt';
    next();
  })

app.use(router.routes(), router.allowedMethods());

// Return transpiled script as HTML string.
app.use((ctx) => {
  ctx.response.body = `
    <!doctype html>
    <html>
      <head>
        <title>Obsidian Demo</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
        <link href="https://fonts.cdnfonts.com/css/star-wars" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&family=Roboto:wght@300&display=swap" rel="stylesheet">
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
