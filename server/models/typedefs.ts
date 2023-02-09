import { gql } from '../../deps/deps.server.ts';

export const typeDefs = gql`
  type Query {
    allPeople: [Person]
    onePerson(name: String, mass: String): Person
  }

  type Person {
    _id: Int!
    name: String!
    mass: String
    hair_color: String
    skin_color: String
    eye_color: String
    birth_year: String
    gender: String
    species_id: Int
    homeworld_id: Int
    height: Int
  }

  type Mutation {
    addPerson(name: String): Person
  }
`;