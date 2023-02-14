/** @format */

// Normalizes responses using the query object from destructure and the response object from
// the graphql request
export default function normalizeResult(queryObj, resultObj, deleteFlag) {
  // Object to hold normalized obj
  const result = {};
  // console.log('inside normalize result')

  // checks if there is a delete mutation
  if (deleteFlag) {
    //creates the ROOT_MUTATION hash that is being deleted
    result["ROOT_MUTATION"] = createRootQuery(
      queryObj.mutations,
      resultObj,
      deleteFlag
    );

    //iterate thru the different response objects that were mutated
4
    const obj = resultObj.data;
    //checks if the current element is an array
    if (Array.isArray(obj)) {
      //iterates thru the array of objects and stores the hash in the result object with 'DELETE' as value
      obj.forEach((ele) => {
        const mutationKeys = Object.keys(ele);
        const hash = labelId(ele[mutationKeys[0]]);
        result[hash] = "DELETED";
      });
    } else {
      //else stores the hash in the result object with the value 'DELETE'
      const mutationKeys = Object.keys(obj);
      const hash = labelId(obj[mutationKeys[0]]);
      result[hash] = "DELETED";
    }
  }

  // creates a stringified version of query request and stores it in ROOT_QUERY key
  else if (queryObj.queries || queryObj.mutations) {
    if (queryObj.queries) {
      // console.log('result before ', result)
      // console.log('queryObj ', queryObj)
      result["ROOT_QUERY"] = createRootQuery(queryObj.queries, resultObj);
      // console.log('result ', result)
      // console.log('result after ', result)
    } else {
      // console.log('mutation')
      result["ROOT_MUTATION"] = createRootQuery(queryObj.mutations, resultObj);
    }
    // console.log('resultObj ', resultObj)
    console.log('test2');
    console.log(result["ROOT_QUERY"]);
    for (const curr in resultObj.data) {
      // console.log('curr ',curr)
      if (!Array.isArray(resultObj.data[curr])) {
        // console.log('not an array')
        const hashObj = createHash(resultObj.data[curr]);
        for (const hash in hashObj) {
          if (result[hash]) {
            Object.assign(result[hash], hashObj[hash]);
          } else {
            result[hash] = hashObj[hash];
          }
        }
      } else {
        // console.log('is an array', resultObj.data[curr])
        // console.log('result before ', result)
        // return
        // Object.assign(result['Person'], {name: 'Matthew Weisker'})
        // console.log('result after ', result)
        for (let i = 0; i < resultObj.data[curr].length; i++) {
          // pass current obj to createHash function to create  obj of hashes
          // console.log(resultObj.data[curr][i])
          // console.log(resultObj.data[curr][i])
          const hashObj = createHash(resultObj.data[curr][i]);
          // console.log('hashObj ', hashObj);
          // check if the hash object pair exists, if not create new key value pair
          // if it does exist merge the hash pair with the existing key value pair
          for (const hash in hashObj) {
            // console.log('result while updating ', result)
            // console.log('hash object while destructuring ', hashObj)
            if (result[hash]) {
              Object.assign(result[hash], hashObj[hash]);
              // console.log('result of hash ', result[hash])
              // console.log('hashObj of hash ', hashObj[hash])
              // console.log('hash ', hash)
            } else {
              result[hash] = hashObj[hash];
            }
          }
        }
        // console.log('test')
        // console.log('result hash ', result)
      }
    }
  }
  console.log('result');
  console.log(result);
  return result;
}

// creates the hashes for query requests and stores the reference hash that will be stored in result
function createRootQuery(queryObjArr, resultObj) {
  console.log('queryObjArr + resultObj from createRootQuery')
  console.log(queryObjArr);
  console.log(resultObj);
  const output = {};
  queryObjArr.forEach((query) => {
    // if query has an alias declare it
    // console.log('something new ', query)
    const alias = query.alias ?? null;
    const name = query.name;
    const args = query.arguments;
    const queryHash = name + args;
    const result = resultObj.data[alias] ?? resultObj.data[name];
    console.log('result from createRootQuery')
    console.log(result);
    // iterate thru the array of current query response
    // and store the hash of that response in an array
    // console.log(result)

    if (Array.isArray(result)) {
      const arrOfHashes = [];
      result.forEach((obj) => {
        console.log(obj)
        console.log(labelId(obj));
        arrOfHashes.push(labelId(obj));
      });

      //store the array of hashes associated with the queryHash
      output[queryHash] = arrOfHashes;
    } else {
      output[queryHash] = [labelId(result)];
    }
  });
  console.log('output');
  console.log(output);
  return output;
}

//returns a hash value pair of each response obj passed in
function createHash(obj, output = {}) {
  // console.log('before ', obj)
  const hash = labelId(obj);
  // console.log('after ', hash)

  //if output doesnt have a key of hash create a new obj with that hash key
  if (!output[hash]) output[hash] = {};
  // iterate thru the fields in the current obj and check whether the current field
  // is __typename, if so continue to the next iteration
  for (const field in obj) {
    if (field === "__typename") continue;
    //check whether current field is not an array
    if (!Array.isArray(obj[field])) {
      //check whether current field is an object
      if (typeof obj[field] === "object" && obj[field] !== null) {
        output[hash][field] = labelId(obj[field]);
        output = createHash(obj[field], output);
      } else {
        output[hash][field] = obj[field];
      }
    } // if it's an array of objects, iterate thru the array
    // create a hash for each obj in the array and store it in an array
    // recursive call on the current obj in the array
    // store the output of the recursive call in output
    else {
      output[hash][field] = [];
      obj[field].forEach((obj) => {
        const arrayHash = labelId(obj);
        output[hash][field].push(arrayHash);
        output = createHash(obj, output);
      });
      // store hashed values in output
    }
  }
  return output;
}

function labelId(obj) {
  // console.log('here here I am over here ', obj)
  const id = obj.id || obj.ID || obj._id || obj._ID || obj.Id || obj._Id;
  return obj.__typename + "~" + id;
}
