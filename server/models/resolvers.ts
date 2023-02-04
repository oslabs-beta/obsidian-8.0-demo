import { dotenv as _dotenv, postgres } from '../../deps/deps.server.ts';

const connect = async () => {
  // Get the connection string from the environment variable "DATABASE_URL"
  const databaseUrl = Deno.env.get("DATABASE_URL")!;

  // Create a database pool with three connections that are lazily established
  const pool = new postgres.Pool(databaseUrl, 1, true);

  // Connect to the database
  const connection = await pool.connect();
  return connection;
};

const allPeople = async () => {
  const connection = await connect();
  const result = await connection.queryObject`
          SELECT name, mass FROM people
        `;
  return result.rows;
};

const onePerson = async (args: any) => {
  const connection = await connect();
  const result = await connection.queryObject`
          SELECT name, mass FROM people WHERE name = ${args.name}
        `;
  return result.rows[0];
};

const addPerson = async (args: any) => {
  const connection = await connect();
  const result = await connection.queryObject`
            INSERT INTO people(name) VALUES(${args.name}) RETURNING name
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