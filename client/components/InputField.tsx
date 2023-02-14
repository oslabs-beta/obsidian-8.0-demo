import { React } from "../../deps/deps.client.ts";

const InputField = (props) => {
  const {addForm, addCharacter, searchInputDisplay, searchOneCharacter, getAllCharacters, getAllDisplay} = props;
  return(
    <div id="input-field">
      {getAllDisplay ? getAllCharacters : null}
      {searchInputDisplay ? searchOneCharacter : null}
      {addForm ? addCharacter : null}
    </div>
  )
}

export default InputField;