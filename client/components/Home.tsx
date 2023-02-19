import { reset } from "https://deno.land/std@0.152.0/fmt/colors";
import { useEffect } from "https://esm.sh/v106/@types/react@18.0.27/X-ZC9yZWFjdEAxOC4yLjA/index";
import { React, useObsidian, BrowserCache, LFUCache } from "../../deps/deps.client.ts";
import Bar from "./Bar.tsx";
import imageURL from "../target.json"



import InputField from "./InputField.tsx";
import  CharacterCards  from "./CharacterCards.tsx"
import { templateStringToQuery } from "https://deno.land/x/postgres@v0.14.2/query/query";
/*
deno install -qAf --unstable https://deno.land/x/denon/denon.ts
export PATH="/Users/mattweisker/.deno/bin:$PATH"

*/

const Home = () => {
  // From Obsidian Wrapper, takes our query and sends it to either database or cache
  const { query, mutate } = useObsidian();
  // People holds array of objects returned from GraphQL/Cache
  const [people, setPeople] = React.useState([]);
  
  // Determines if we are displaying search all characters, search one character, or add character
  const [display, setDisplay] = React.useState({getAll: false, getOne: false, addOne: false})

  // Object holding all inputed add character data, uncomment second line for a default option
  // const [addContent, setAddContent] = React.useState({name: '', mass: '', hair: '', skin: '', eye: '', gender: '', height: ''})
  const [addContent, setAddContent] = React.useState({name: 'Mike Landswimmer', mass: '10', hair: 'Obsidian', skin: 'Obsidian', eye: 'Obsidian', gender: 'Flexible', height: 10, url: ''})

  // Holds data on response time to check if cache is working
  const [callData, setCallData] = React.useState({});
  // Holds title of query which will be held in callData
  const [currentQuery, setCurrentQuery] = React.useState('')



  const queryStr = `query {
      allPeople {
        _id
        name
        mass
        hair_color
        skin_color
        eye_color
        gender
        height
      }
    }
  `;

  const queryStrName = `query {
    onePerson (name: "${addContent.name}") {
      _id
      name
      mass
      hair_color
      skin_color
      eye_color
      gender
      height
    }
  }`

  const queryStrAddCharacter = `mutation {
    addPerson (name: "${addContent.name}",
                mass: "${addContent.mass}",
                hair_color: "${addContent.hair}",
                skin_color: "${addContent.skin}",
                eye_color: "${addContent.eye}",
                gender: "${addContent.gender}",
                height: ${addContent.height}
              ) {
      _id
      name
      mass
      hair_color
      skin_color
      eye_color
      gender
      height
    }
  }`

  // function which takes in the event and the name of the state we're changing, 
  // used to save input data into a state
  const handleChange = (event: any, stateChange: any) => {
    stateChange(event.target.value);
  }

  // function which takes in the event and the key for adding content and updates state
  // checks for height key because height input must be a number
  const handleNewChar = (event: any, key: any) => {
    event.preventDefault()
    const newContent: object = {...addContent}
    newContent[key] = event.target.value
    if (key === 'height') newContent[key] = Number(event.target.value)
    setAddContent(newContent)
  }

  // allows for the get all screen to only appear if the cursor is over the get all button
  // and will keep it open as long as get all display is true
  const getAllButton = () => {
    // If getAllDisplay is true, handles a get all button click
    query(queryStr)
    .then(resp => {
      // Stores the query result data
      setPeople(resp.data.allPeople)
      // Stores the query name and result times into an object that is used for bar graph data
      const query = "Search All Characters"
      setCurrentQuery(query)
      const dataCopy = {...callData};
      if (!dataCopy[query]) dataCopy[query] = [];
      dataCopy[query].push(resp.time)
      setCallData(dataCopy)
      // Set all displays back to false
      const displayCopy: any = {...display};
      Object.keys(displayCopy).forEach(k => displayCopy[k] = false);
      setDisplay(displayCopy);
    })
  }

  // allows for the get one screen to only appear if the cursor is over the get one button
  // and will keep it open as long as search input is true
  const searchOneCharButton = () => {
    // If get one screen is open and an input name has been written it sends the query
  if (addContent.name !== "") {
    query(queryStrName)
    .then(resp => {
      // Gets the data we need and puts it into an array, then adds data to state
      let data = resp.data.onePerson;
      if (!Array.isArray(data)) {
        data = [data]
      }
      setPeople(data)

      // Saves query name and response time and then adds an array of response times to the search key
      // This is used for the bar graph data
      const query = `Search For ${addContent.name}`
      setCurrentQuery(query)
      const dataCopy = {...callData};
      if (!dataCopy[query]) dataCopy[query] = [];
      dataCopy[query].push(resp.time)
      setCallData(dataCopy)
      // Set all displays back to false
      const displayCopy: any = {...display};
      Object.keys(displayCopy).forEach(k => displayCopy[k] = false);
      setDisplay(displayCopy);
      // Set all inputs back to an empty string
      const addContentCopy: any = {...addContent};
      Object.keys(addContentCopy).forEach(string => addContentCopy[string] = '');
      setAddContent(addContentCopy)
    })
  }
}

// Opens add character screen if hover over button, and then holds logic for mutation
const addCharacterButton = () => {
  if (addContent.name !== "") {
    mutate(queryStrAddCharacter)
    .then(resp => {
      const data = [resp.data.addPerson]
      setPeople(data);
      // Setting current querry to an empty string closes any existing graphs, because 
      // the graph info is not relevant to a mutation
      setCurrentQuery('');
      // Set all display options back to false
      const displayCopy: any = {...display};
      Object.keys(displayCopy).forEach(k => displayCopy[k] = false);
      setDisplay(displayCopy);
  
    });
    // Checks if the new character was given an image url, if so it will send the character
    // name and url to the server.ts where they will add that info to target.json
    if (addContent.url !== '') {
      fetch('/imageURL', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: addContent.name, url: addContent.url, json: imageURL })
      })
    }
  }
}

// Holds html for all character screen.  If getAllDisplay is true it will render
const getAllCharacters = (
  <div className="input-field-div search-all">
    <div className="input-no-button">
      <p>Get a list of all characters in the database</p>
    </div>
    <button
      onClick={() => {
        getAllButton();
      }}
      >All</button>
  </div>
)

// Holds html for search one character screen.  If cearchInputDisplay is true it will render
const searchOneCharacter = (
  <div className="input-field-div search-one">
    <div className="input-no-button">
      <p>Get information about a single character in the database</p>
      <input className="character-search" type="text" onChange={(e) => handleNewChar (e, "name")}></input>
    </div>
    <button 
        onClick={() => {
            searchOneCharButton();
        }}
        placeholder="Search by character name"
    >One</button>
  </div>
)

// Holds html for add character display.  If addForm is true it will render
const addCharacter = (
  <div className="input-field-div add-one">
    <div className="input-no-button">
      <p>Add a character to the database</p>
      <form className="add-character-form">
        <div className="add-input-row">

          <div className="add-character-input">
            <label>Name</label>
            <input onChange={(e) => handleNewChar (e, "name")}></input>
          </div>

          <div className="add-character-input">
            <label>Height</label>
            <input onChange={(e) => handleNewChar (e, "height")}></input>
          </div>

          <div className="add-character-input">
            <label>Mass</label>
            <input onChange={(e) => handleNewChar (e, "mass")}></input>
          </div>

          <div className="add-character-input">
            <label>Gender</label>
            <input onChange={(e) => handleNewChar (e, "gender")}></input>
          </div>

        </div>
        <div className="add-input-row">

        <div className="add-character-input">
            <label>Hair-Color</label>
            <input onChange={(e) => handleNewChar (e, "hair")}></input>
          </div>

          <div className="add-character-input">
            <label>Skin-Color</label>
            <input onChange={(e) => handleNewChar (e, "skin")}></input>
          </div>

          <div className="add-character-input">
            <label>Eye-Color</label>
            <input onChange={(e) => handleNewChar (e, "eye")}></input>
          </div>

          <div className="add-character-input">
            <label>Image URL</label>
            <input onChange={(e) => handleNewChar (e, "url")}></input>
          </div>
        </div>
      </form>
    </div>
    <button
      onClick={() => {
        addCharacterButton()
      }}
    >Add</button>
  </div>
)

  // Holds button background color to determine if a button is activated or not
  let searchAll = 'white', searchOne = 'white', add = 'white';
  if (display['getAll']) searchAll = "#2E67F8";
  if (display['getOne']) searchOne = "#EB212E";
  if (display['addOne']) add = "#2FF924";

  // Determines what display will be shown
  const changeDisplay = (key: string) => {
    const displayCopy: any = {...display};
    Object.keys(displayCopy).forEach(k => displayCopy[k] = false);
    displayCopy[key] = true;
    setDisplay(displayCopy);
  }

  return (
    <div className="home-container">

      <h1>the high ground</h1>
      
      <div className="mid-container">
        <div className="button-container">
          <div className="get-all-characters">
            <button
              style={{"backgroundImage": `url(${imageURL['Search All']})`, "boxShadow": `0 0 25px ${searchAll}`}}
              onMouseEnter={() => {
                if (!display['getAll']) changeDisplay('getAll');
              }}
            ></button>
          </div>

          <div className="search-characters">
            <button
              style={{"backgroundImage": `url(${imageURL['Search One']})`, "boxShadow": `0 0 25px ${searchOne}`}} 
              onMouseEnter={() => {
                if (!display['getOne']) changeDisplay('getOne');
              }}
            ></button>   
          </div>

          <div className="add-character">
            <button
              style={{"backgroundImage": `url(${imageURL['unknown']})`, "boxShadow": `0 0 25px ${add}`}}
              onMouseEnter={() => {
                if (!display['addOne']) changeDisplay('addOne')
              }}
            ></button>
          </div>
        </div>  
        
        <InputField 
          addCharacter={addCharacter} 
          searchOneCharacter={searchOneCharacter} 
          getAllCharacters={getAllCharacters}
          display={display}/>
      </div>

      <div>
      
      <div className="response-container">
        <div className="character-container">
            {people && people.map((char) => (
              <>
              <CharacterCards char={char}/>
              </>
            ))}

        </div>
        <div className="graph-container">
            { <Bar callData={callData} currentQuery={currentQuery} /> }
        </div>
      </div>
      </div>

      <div className="footer">
        <p>Copyright © Obsidian 2023</p>
      </div>
    </div>
  );
}

export default Home;
