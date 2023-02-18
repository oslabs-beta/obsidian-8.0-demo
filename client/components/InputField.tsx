import { React } from "../../deps/deps.client.ts";

const InputField = (props) => {
  const {addCharacter, searchOneCharacter, getAllCharacters, display} = props;
  const deathStar = <div id="death-star"></div>

  return(
    // <div id="input-field" style={{"backgroundColor": `${background}`, "boxShadow": `0 0 25px ${background}`}} >
    <div id="input-field">
      {display['getAll'] ? getAllCharacters : null}
      {display['getOne'] ? searchOneCharacter : null}
      {display['addOne'] ? addCharacter : null}
      {!display['getAll'] && !display['getOne'] && !display['addOne'] ? deathStar : null}
    </div>

  )
}
export default InputField;