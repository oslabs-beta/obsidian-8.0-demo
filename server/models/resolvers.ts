import { dotenv as _dotenv, postgres } from '../../deps/deps.server.ts';

const connect = async () => {
  // Get the connection string from the environment variable "DATABASE_URL"
  //const databaseUrl = Deno.env.get("DATABASE_URL")!;
  const databaseUrl = 'postgres://bopoqipu:Sc1CIVO-EAvQ2eVS3mFTar_7e0lgcKZC@kashin.db.elephantsql.com/bopoqipu';

  // Create a database pool with three connections that are lazily established
  const pool = new postgres.Pool(databaseUrl, 1, true);

  // Connect to the database
  const connection = await pool.connect();
  return connection;
};
const connection = await connect();

const allPeople = async () => {
  const result = await connection.queryObject`
          SELECT _id, name, mass, hair_color, skin_color, eye_color, birth_year, gender, species_id, homeworld_id, height FROM people
        `;
  return result.rows;
};

const onePerson = async (args: any) => {
  const result = await connection.queryObject`
          SELECT _id, name, mass, hair_color, skin_color, eye_color, gender, height FROM people WHERE name = ${args.name} OR mass = ${args.mass} 
        `;
  return result.rows[0];
};

const addPerson = async (args: any) => {
  const result = await connection.queryObject`
            INSERT INTO people(name, mass, hair_color, skin_color, eye_color, gender, height) VALUES (${args.name}, ${args.mass}, ${args.hair_color}, ${args.skin_color}, ${args.eye_color}, ${args.gender}, ${args.height}) RETURNING _id, name, mass, hair_color, skin_color, eye_color, gender, height
        `;
  return result.rows[0];
};

export const resolvers = {
  Query: {
    allPeople: () => allPeople(),
    onePerson: (_: any, args: any) => onePerson(args),
  },
  Mutation: {
    addPerson: (_: any, args: any) => addPerson(args),
  },
};