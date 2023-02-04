import { React, useObsidian, BrowserCache } from "../../deps/deps.client.ts";

const Home = () => {
  const { query, cache, setCache } = useObsidian();
  const [movies, setMovies] = React.useState('');

  const queryStr = `query {
      allPeople {
        name
        mass
      }
    }
  `;

  return (
    <div>
      Home
      <button
      onClick={() => {
        query(queryStr)
        .then(resp => setMovies(resp.data))
        .then(resp => setCache(new BrowserCache(cache.storage)))
      }}
    >Get Movies</button>
    </div>
  );
}

export default Home;
