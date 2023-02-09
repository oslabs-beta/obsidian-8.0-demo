import { reset } from "https://deno.land/std@0.152.0/fmt/colors";
import { React, useObsidian, BrowserCache, LFUCache } from "../../deps/deps.client.ts";

/*
deno install -qAf --unstable https://deno.land/x/denon/denon.ts
export PATH="/Users/mattweisker/.deno/bin:$PATH"

*/

const Home = () => {
  const { query, cache, setCache } = useObsidian();
  const [people, setPeople] = React.useState([]);
  // const [person, setPerson] = React.useState({name: '', mass: ''});
  const [search, setSearch] = React.useState('');

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

  const queryStrAddCharacter = `mutation {
    addPerson (name: "${search}") {
      _id
      name
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
 const handleChange = (event: any) => {
  setSearch(event.target.value);
 }

//  let personInfo;
//  if (person.name !== '') {
//   personInfo = <p>{ person.name }: weight - { person.mass }</p>
// }

  return (
    <div>
      <div style={{"display": "flex", "justifyContent": "center", "backgroundImage": "url(https://mcdn.wallpapersafari.com/medium/1/97/co341S.jpg)", "color": "orangeRed", "borderRadius": "10px", "fontSize": "4em", "padding": "10px"}}>
        <h1>Who has the high ground?</h1>
      </div>
      
      <div style={{"display": "flex", "justifyContent": "center", "padding": "10px"}}>
        <button style={{"width": "8%", "padding": "5px", "borderRadius": "10px"}}
        onClick={() => {
          query(queryStr)
          .then(resp => {
            console.log('regular response ', resp)
            setPeople(resp.data.allPeople)
            console.log(people.length)
          })
          // .then(resp => setCache(new LFUCache(cache.storage)))
        }}
        >Get All Characters</button>
      </div>

      <div style={{"display": "flex", "justifyContent": "center", "padding": "10px", "alignItems": "space-between", "borderBottom": "1px solid black", "borderTop": "1px solid black"}}>
        <input style={{"width": "8%", "padding": "5px", "marginLeft": "15px", "borderRadius": "10px"}} type="text" onChange={handleChange}></input>
        <button style={{"width": "8%", "padding": "5px", "marginLeft": "15px", "borderRadius": "10px"}}
      onClick={() => {
        query(queryStrName)
        .then(resp => {
          console.log('front end console ', resp)
          let data = resp.data.onePerson;
          if (!Array.isArray(data)) {
            data = [data]
          }
          // const data = resp.data.onePerson
          // const cacheData = resp.data.onePerson[0]
          // console.log('cache data ', cacheData)
          // setPerson({name: data.name, mass: data.mass})
          setPeople(data)
          // if (cacheData) setPerson({name: cacheData.name, mass: cacheData.mass})
          // console.log('person state ', person)
        })
        
      }}
      >Search One Character</button>   
      </div>

      


      <div style={{"display": "flex", "justifyContent": "center", "padding": "10px"}}>
        <button style={{"padding": "5px", "width": "8%","borderRadius": "10px", "backgroundColor": "rgb(248,248,248)"}}
        onClick={() => {
          query(queryStrAddCharacter)
          .then(resp => {
            console.log('mutation ', resp.data)
            const data = [resp.data.addPerson]
            setPeople(data)
            // setPeople(...people, resp.data)
          })
        }}
        >Add Character</button>
      </div>


      {/* <button */}
      {/* // onClick={() => {
      //   // setPerson({name: 'Yoda'})
      //   setPeople([])
      //   console.log(people)
      //   console.log(typeof people)
      // }}
      // >Console.Log</button> */}
      {/* <div> */}
        {/* Single Character
        { personInfo } */}
       
      {/* </div> */}
      {/* <div style={{"backgroundColor": "aqua", "display": "flex", "width": "100%", "height": "100%", "flex": "1", "border": "1px solid black", "flexDirection": "column", "alignItems": "center", "padding": "20px"}}> */}
      <div>
      {/* <div>   */}
      <div style={{"display": "flex", "justifyContent": "center", "padding": "10px"}}>
        Characters

      </div>
        {/* { for (let i: number = 0; i < people.length; i++) {
          <p>{people[i]</p>
        }} */}

{/* {"display": "flex", "width": "100%", "justifyContent": "space-around"} */}
        <div>
          {people && people.map((char) => (
            // console.log(people)  
            <div style={{"display": "flex", "justifyContent": "space-between", "paddingLeft": "50px", "paddingRight": "50px", "borderBottom": "2px solid white", "backgroundColor": "AliceBlue"}}>
              {/* //  <div style={{"backgroundColor": "pink", "display": "flex", "justifyContent": "space-evenly", "height": "100%", "border": "1px solid black"}}> */}
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>name - {char.name}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>weight - {char.mass}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>hair-color - {char.hair_color}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>skin-color - {char.skin_color}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>eye-color - {char.eye_color}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "15%"}}>gender - {char.gender}</p>
              <p style={{"display": "flex", "justifyContent": "start", "width": "10%"}}>height - {char.height}</p>

            </div>

          ))}
        </div>

      </div>
      
    </div>
  );
}

export default Home;
