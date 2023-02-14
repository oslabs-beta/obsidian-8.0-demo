import { React } from "../../deps/deps.client.ts";

const InputField = (props) => {
  const {addForm, addCharacter, searchInputDisplay, searchOneCharacter, getAllCharacters, getAllDisplay} = props;
  let background;
  if (getAllDisplay) background = "#2E67F8CC";
  if (searchInputDisplay) background = "#EB212ECC";
  if (addForm) background = "#2FF924CC";
  return(
    <div id="input-field" style={{"backgroundColor": `${background}`}} >
      {getAllDisplay ? getAllCharacters : null}
      {searchInputDisplay ? searchOneCharacter : null}
      {addForm ? addCharacter : null}
    </div>
  )
}
export default InputField;