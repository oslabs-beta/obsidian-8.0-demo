# Obsidian 8.0 Demo

## Getting Started

Install the latest version of Deno [here](https://deno.land/manual@v1.32.3/getting_started/installation)

Clone this repository:

```javascript
git clone https://github.com/oslabs-beta/obsidian-8.0-demo.git
```

### Setting up a ElephantSQL database

Go to [ElephantSQL](https://www.elephantsql.com/), create an account and a new database instance. Name your database 'starwars' and select the free tier ('Tiny Turtle').

Get the URL of the newly created database. 

Make sure you have PostgresQL installed (run `psql --version` to check).

From within the root directory run `psql -d <YOUR_ELEPHANTSQL_URL_HERE> -f ObsidianDemoDatabasePlain.sql` in the terminal. Be sure to replace `<YOUR_ELEPHANTSQL_URL_HERE>` with your newly created elephantSQL url. This command will create tables in your database and populate the tables with rows of data that will be used for the demo. 


### Setting up your .env file

Create a .env file in the root folder and input the following:

```javascript
PORT= //insert port of your choice (ex. 3000)
DATABASE_URL= //insert your postgresql URL here
REDIS_HOST= //insert host address (ex. '127.0.0.1')
```

### Running the demo
Run the script below to start the demo:

```javascript
deno task start
```

## Connecting with Obsidian Developer Tool 8.0

Check out the Obsidian Developer Tool [here](https://github.com/open-source-labs/obsidian-developer-tool)!
