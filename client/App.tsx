import { Navigate, React, Route, Routes } from "../deps/deps.client.ts";
import Home from "./components/Home.tsx";

export default function App(props) {
  return (
      <Routes>
        <Route exact path="/" element={<Home />} />
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
  );
}
