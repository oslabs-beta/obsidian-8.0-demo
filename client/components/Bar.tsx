import {
  React,
  useObsidian,
  BrowserCache,
  LFUCache,
} from "../../deps/deps.client.ts";

const Bar = (props: any) => {
  // const [data, setData] = React.useState({'Search all characters': [800, 400, 200, 100], 'Search for Yoda': [1000, 20, 5], 'Search for Luke': []});
  // const [currentQuery, setCurrentQuery] = React.useState('')
  // const [show, setShow] = React.useState(false)

  const { callData, currentQuery } = props;

  let graph;
  const colors = ["#2E67F8CC", "#EB212ECC", "#228B22CC"];

  // If there is a current query it will display the bar graph
  if (currentQuery !== "") {
    // Find the highest number in our return time and establish the height based off of that number
    const max: number = Math.max(...callData[currentQuery]);
    graph = (
      <div className="bar-graph">
        <div className="bar-graph-title">{currentQuery}</div>
        <div className="bar-graph-x-name">
          <div className="x-name">Time</div>
          {/* Divide the heighest amount of time into thirds and round to the nearest tens place */}
          <div className="x-label">
            <p>{Math.ceil(max / 10) * 10}</p>
            <p>{Math.ceil((max * 2) / 30) * 10}</p>
            <p>{Math.ceil(max / 30) * 10}</p>
          </div>
        </div>
        <div className="bar-graph-display">
          {/* Map through all of the time data and display a new column for each  */}
          {callData[currentQuery] &&
            callData[currentQuery].map((time: number, i: number) => (
              <div className="bar-column">
                <p style={{ color: `${colors[i % 3]}` }}>{time}</p>
                <div
                  className="bar-data"
                  style={{
                    height: `${(time / max) * 100}%`,
                    backgroundColor: `${colors[i % 3]}`,
                  }}
                ></div>
              </div>
            ))}
        </div>
        <div className="bar-graph-space"></div>
        <div className="bar-graph-y-name">Searches</div>
      </div>
    );
  }

  return <div>{graph}</div>;
};

export default Bar;
