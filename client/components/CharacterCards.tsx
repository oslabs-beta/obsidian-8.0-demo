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
      <img className="character-image" src={photo}/>
      <p className="character-name">{char.name}</p>
        </div>
          <div className="right-container">
            <div className="column-one">
              <p className="column-item">Height: {char.height}</p>
              <p className="column-item">Hair: {char.hair_color}</p>
              <p className="column-item">Eyes: {char.eye_color}</p>
            </div>
            <div className="column-two">
              <p className="column-item">Weight: {char.mass}</p>
              <p className="column-item">Skin: {char.skin_color}</p>
              <p className="column-item">Gender: {char.gender}</p>
            </div>
      </div>
    </div>
  )
}
export default CharacterCards;