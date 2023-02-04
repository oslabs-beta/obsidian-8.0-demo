import { Application, denoPlugin, esbuild } from "../deps/deps.server.ts";

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

//const indexJs = new TextDecoder().decode(output.outputFiles[0].contents);