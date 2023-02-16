import { React, useObsidian, BrowserCache, LFUCache } from "../../deps/deps.client.ts";

const Bar = (props: any) => {
  // const [data, setData] = React.useState({'Search all characters': [800, 400, 200, 100], 'Search for Yoda': [1000, 20, 5], 'Search for Luke': []});
  // const [currentQuery, setCurrentQuery] = React.useState('')
  // const [show, setShow] = React.useState(false)

  const { callData, currentQuery } = props

  console.log('props ', props)
  let graph;

  const colors = ['#2E67F8CC', '#EB212ECC', '#228B22CC']

  if (currentQuery !== '') {
    const max: number = Math.max(...callData[currentQuery])
    const search = currentQuery;
    graph = <div className="bar-graph">
    <div className="bar-graph-title">
      { search }
    </div>
    <div className="bar-graph-x-name">
      <div className="x-name">
        Time
      </div>
      <div className="x-label">
        <p>{ max }</p>
        <p>{ Math.floor((max * 2) / 3 )}</p>
        <p>{ Math.floor((max / 3))}</p>
      </div>
      
    </div>
    <div className="bar-graph-display">
      {callData[search] && callData[search].map((time: number, i: number) => (
        <div className="bar-column" >
          <p style={{"color": `${colors[i%3]}`}} >{time}</p>
          <div className="bar-data" style={{"height": `${(time / max) * 100 }%`, "backgroundColor": `${colors[i % 3]}`}}>
          </div>
        </div>
      ))}
    </div>
    <div className="bar-graph-space"></div>
    <div className="bar-graph-y-name">
      Searches
    </div>
  </div>
  }

    return (
        <div>
            {/* <button onClick={() => {
              setCurrentQuery('Search all characters')
              setShow(true)
              }}>Search all characters</button>
            <button onClick={() => {
              setCurrentQuery('Search for Yoda')
              setShow(true)
              }}>Search for Yoda</button>
            <button onClick={() => {
              setCurrentQuery('Search for Luke')
              const currentData = {...data};
              currentData['Search for Luke'].push(Math.floor(Math.random() * 1500))
              setData(currentData)
              setShow(true)
              }}>Search for Luke</button> */}
            <div>
              { graph }
            </div>

        </div>
    )
}

export default Bar;