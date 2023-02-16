import { React } from "../../deps/deps.client.ts";
// import images from "../images.c-3po.jpg"
import imageURL from "../photo.json"

const CharacterCards = (props) => {
  console.log(props)
  const {char} = props;
  let photo;
  if (imageURL[char.name]) photo = imageURL[char.name];
  else photo = imageURL["unknown"]
   return(
  <div className="character-card">
    <div className="left-container">
      {/* <img className="test-image" src="https://images.bauerhosting.com/legacy/empire-images/features/560ebc7b50e6c513721c309f/Ben%20Kenobi.jpg?q=80&w=1800&ar=16:9&fit=crop&crop=top"/> */}
      <div className="img-div">
        <img className="character-image" src={photo}/>
      </div>
      <div className="char-name-div">
        <p className="character-name">{char.name}</p>
      </div>
        </div>
          <div className="right-container">
            <div className="column-one">
              <div className="trait-box">
                <p className="description">Height:</p>
                <p className="column-item">{char.height}</p>
              </div>
              <div className="trait-box">
                <p className="description">Hair:</p>
                <p className="column-item">{char.hair_color}</p>
              </div>
              <div className="trait-box">
                <p className="description">Eyes:</p>
                <p className="column-item">{char.eye_color}</p> 
              </div>
            </div>
            <div className="column-two">
            <div className="trait-box">
              <p className="description">Weight:</p>
              <p className="column-item">{char.mass}</p>
            </div>
            <div className="trait-box">
              <p className="description">Skin:</p>
              <p className="column-item">{char.skin_color}</p>
            </div>
            <div className="trait-box">
              <p className="description">Gender:</p>
              <p className="column-item">{char.gender}</p>
            </div>
            </div>
      </div>
    </div>
  )
}
export default CharacterCards;