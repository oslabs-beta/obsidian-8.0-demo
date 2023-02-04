import { React, useObsidian, BrowserCache } from "../../deps/deps.client.ts";

const Home = () => {
  const { query, cache, setCache } = useObsidian();
  const [people, setPeople] = React.useState('');

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
        .then(resp => setPeople(resp.data))
        .then(resp => setCache(new BrowserCache(cache.storage)))
      }}
    >Get People</button>
    </div>
  );
}

export default Home;
