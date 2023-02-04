import { Application, denoPlugin, esbuild, dotenv as _dotenv } from "../deps/deps.server.ts";

const PORT = Number(Deno.env.get("PORT"));

// Transpile jsx to js for React.
await esbuild.initialize({
  //wasmURL: "https://esm.sh/esbuild-wasm/esbuild.wasm",
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
const indexJs = new TextDecoder().decode(output.outputFiles[0].contents);

// Setup server.
const app = new Application();

// Return transpiled script as HTML string.
app.use((ctx) => {
  ctx.response.body = `
    <!doctype html>
    <html>
      <head>
        <title>Deno x React</title>
      </head>
      <body>
        <div id="root" />
        <script>${indexJs}</script>
      </body>
    </html>
  `;
});

// Start server.
console.log(`Listening on http://localhost:${PORT}`);
await app.listen({ port: PORT });
