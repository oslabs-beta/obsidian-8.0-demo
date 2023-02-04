import { Navigate, React, Route, Routes } from "../deps/deps.client.ts";
import Home from "./components/Home.tsx";

const App = (props) => {
  return (
      <Routes>
        <Route exact path="/" element={<Home />} />
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
  );
}

export default App;
