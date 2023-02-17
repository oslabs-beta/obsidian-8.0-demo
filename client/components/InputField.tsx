import { React } from "../../deps/deps.client.ts";

const InputField = (props) => {
  const {addForm, addCharacter, searchInputDisplay, searchOneCharacter, getAllCharacters, getAllDisplay} = props;
  let background;
  const deathStar = <div id="death-star"></div>

  if (getAllDisplay) background = "#2E67F8CC";
  if (searchInputDisplay) background = "#EB212ECC";
  if (addForm) background = "#2FF924CC";
  if (!getAllDisplay && !searchInputDisplay && !addForm) background = "rgba(0, 0, 0, 0)";
 
  return(
    // <div id="input-field" style={{"backgroundColor": `${background}`, "boxShadow": `0 0 25px ${background}`}} >
    <div id="input-field">
      {getAllDisplay ? getAllCharacters : null}
      {searchInputDisplay ? searchOneCharacter : null}
      {addForm ? addCharacter : null}
      {!getAllDisplay && !searchInputDisplay && !addForm ? deathStar : null}
    </div>

  )
}
export default InputField;