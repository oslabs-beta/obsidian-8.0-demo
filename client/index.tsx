import { BrowserRouter, React, ReactDOM } from "../deps/deps.client.ts";
import App from "./App.tsx";

// Bind react app to <div id="app" />
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
);
