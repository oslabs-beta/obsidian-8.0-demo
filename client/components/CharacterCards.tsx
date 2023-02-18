import { React } from "../../deps/deps.client.ts";
import imageURL from "../target.json"

const CharacterCards = (props: any) => {
  console.log(props)
  const {char} = props;
  let photo = imageURL["unknown"];
  if (imageURL[char.name]) photo = imageURL[char.name];
   return(
  <div className="character-card">
    <div className="left-container">
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