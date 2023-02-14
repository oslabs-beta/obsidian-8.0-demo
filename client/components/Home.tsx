import { reset } from "https://deno.land/std@0.152.0/fmt/colors";
import { useEffect } from "https://esm.sh/v106/@types/react@18.0.27/X-ZC9yZWFjdEAxOC4yLjA/index";
import { React, useObsidian, BrowserCache, LFUCache } from "../../deps/deps.client.ts";
import InputField from "./InputField.tsx";
import  CharacterCards  from "./CharacterCards.tsx"
/*
deno install -qAf --unstable https://deno.land/x/denon/denon.ts
export PATH="/Users/mattweisker/.deno/bin:$PATH"

*/

const Home = () => {
  const { query, cache, setCache, mutate } = useObsidian();
  const [people, setPeople] = React.useState([]);
  // const [person, setPerson] = React.useState({name: '', mass: ''});
  const [search, setSearch] = React.useState('');
  // const [addForm, setAddForm] = React.useState(false)
  const [getAllDisplay, setGetAllDisplay] = React.useState(false);
  const [searchInputDisplay, setsearchInputDisplay] = React.useState(false);
  const [addForm, setAddForm] = React.useState(false)


  // const [addContent, setAddContent] = React.useState({name: '', mass: '', hair: '', skin: '', eye: '', gender: '', height: ''})
  const [addContent, setAddContent] = React.useState({name: 'Mike Landswimmer', mass: '420', hair: 'Obsidian', skin: 'Obsidian', eye: 'Obsidian', gender: 'Flexible', height: 10})

  // const [addName, setAddName] = React.useState('');
  // const [mass, setMass] = React.useState('');
  // const [hair, setHair] = React.useState('');
  // const [skin, setSkin] = React.useState('')
  // const [eye, setEye] = React.useState('');
  // const [gender, setGender] = React.useState('');
  // const [height, setHeight] = React.useState(''); 


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
    onePerson (name: "${search}") {
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

  // const [addContent, setAddContent] = React.useState({name: '', mass: '', hair: '', skin: '', eye: '', gender: '', height: ''})

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

  // const queryStrMass = `query {
  //   onePerson (mass: "45") {
  //     _id
  //     name
  //     mass
  //   }
  // }`


  /*
  mass
        hair_color
        skin_color
        eye_color
        birth_year
        gender
        species_id
        homeworld_id
        height
  */
 const handleChange = (event: any, stateChange: any) => {
  stateChange(event.target.value);
 }
 const handleNewChar = (event: any, key: any) => {
  event.preventDefault()
  const newContent: object = {...addContent}
  newContent[key] = event.target.value
  if (key === 'height') newContent[key] = Number(event.target.value)
  setAddContent(newContent)
  // console.log(addContent)
  // console.log(typeof addContent.height)
 }


  const getAllButton = () => {
    if (!getAllDisplay) {
      setGetAllDisplay(true);
      setAddForm(false);
      setsearchInputDisplay(false);
    }
  }

  const searchOneCharButton = () => {
  if (!searchInputDisplay) {
    setsearchInputDisplay(true);
    setAddForm(false);
    setGetAllDisplay(false);
  } 
  else {
    if (search !== "") {
      query(queryStrName)
      .then(resp => {
        let data = resp.data.onePerson;
        if (!Array.isArray(data)) {
          data = [data]
        }
        setPeople(data)
      })
    }
  }
}

const addCharacterButton = () => {
  if (!addForm) {
    setAddForm(true);
    setsearchInputDisplay(false);
    setGetAllDisplay(false);
  } 
  else {
    mutate(queryStrAddCharacter)
    .then(resp => {
      const data = [resp.data.addPerson]
      setPeople(data)
    })
  }
}

const getAllCharacters = (
  <div>
    <p>Get a list of all characters in the database</p>
    <button
      onClick={() => {
        query(queryStr)
        .then(resp => {
          setPeople(resp.data.allPeople)
        })
      }}
      >Get All Characters</button>
  </div>
)

const searchOneCharacter = (
  <div>
    <p>Get information about a single character in the database</p>
    <input type="text" onChange={(e) => handleChange(e, setSearch)}></input>
    <button 
        onClick={() => {
            searchOneCharButton();
        }}
        placeholder="Search by character name"
    >Search One Character</button>
  </div>
)

const addCharacter = (
  <div>
    <p>Add a character to the database</p>
    <form className="add-character-form">
        <div className="add-character-input">
          <label>Name - </label>
          <input onChange={(e) => handleNewChar (e, "name")}></input>
        </div>

        <div className="add-character-input">
          <label>Mass - </label>
          <input onChange={(e) => handleNewChar (e, "mass")}></input>
        </div>
        
        <div className="add-character-input">
          <label>Hair-Color - </label>
          <input onChange={(e) => handleNewChar (e, "hair")}></input>
        </div>

        <div className="add-character-input">
          <label>Skin-Color - </label>
          <input onChange={(e) => handleNewChar (e, "skin")}></input>
        </div>

        <div className="add-character-input">
          <label>Eye-Color - </label>
          <input onChange={(e) => handleNewChar (e, "eye")}></input>
        </div>

        <div className="add-character-input">
          <label>Gender - </label>
          <input onChange={(e) => handleNewChar (e, "gender")}></input>
        </div>

        <div className="add-character-input">
          <label>Height - </label>
          <input onChange={(e) => handleNewChar (e, "height")}></input>
        </div>
    </form>
    <button
      onClick={() => {
        addCharacterButton()
      }}
    >Add Character</button>
  </div>

)

  return (
    <div className="home-container">
      <div className="opening-crawl">
        <h1>Who has the high ground?</h1>
      </div>
      
      <div className="get-all-characters">
        <button
        onClick={() => {
          query(queryStr)
          .then(resp => {
            // console.log('regular response ', resp)
            setPeople(resp.data.allPeople)
           
            // console.log(people.length)
          })
          // .then(resp => setCache(new LFUCache(cache.storage)))
        }}
        >Get All Characters</button>
      </div>

      <div className="mid-container">
        <div className="button-container">
          <div className="get-all-characters">
            <button
            onMouseEnter={() => {
              getAllButton();
            }}
            >Get All Characters</button>
          </div>

          <div className="search-characters">
            <button 
              onMouseEnter={() => {
                if (!searchInputDisplay) {
                  searchOneCharButton();
                }
              }}
          >Search One Character</button>   
          </div>

          <div className="add-character">
            <button
              onMouseEnter={() => {
                if (!addForm) {
                  addCharacterButton()
                }
              }}
            >Add Character</button>
          </div>
        </div>  
        
        <InputField 
          addForm={addForm} 
          addCharacter={addCharacter} 
          searchInputDisplay={searchInputDisplay} 
          searchOneCharacter={searchOneCharacter} 
          getAllCharacters={getAllCharacters}
          getAllDisplay={getAllDisplay}/>
      </div>

      <div>
      {/* <div>   */}
      <div className="character-title">
        Characters

      </div>
        {/* { for (let i: number = 0; i < people.length; i++) {
          <p>{people[i]</p>
        }} */}

{/* {"display": "flex", "width": "100%", "justifyContent": "space-around"} */}
        <div className="character-container">
          {people && people.map((char) => (
            <>
            <CharacterCards char={char}/>
            </>
          
            // console.log(people)  
            // <div className="search-chart">
            //   {/* //  <div style={{"backgroundColor": "pink", "display": "flex", "justifyContent": "space-evenly", "height": "100%", "border": "1px solid black"}}> */}
            //   <p className="ten">Name - {char.name}</p>
            //   <p className="ten">Weight - {char.mass}</p>
            //   <p className="ten">Hair-color - {char.hair_color}</p>
            //   <p className="ten">Skin-color - {char.skin_color}</p>
            //   <p className="ten">Eye-color - {char.eye_color}</p>
            //   <p className="ten">Gender - {char.gender}</p>
            //   <p className="last-row">Height - {char.height}</p>

            // </div>

          ))}
        </div>

      </div>
      
      
    </div>
  );
}

export default Home;
