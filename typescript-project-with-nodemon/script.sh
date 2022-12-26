#!/bin/bash

# Check if jq is installed
if ! [ -x "$(command -v jq)" ]; then
  # Install jq if it's not installed
  sudo apt-get install jq
fi

# Set default project name
PROJECT_NAME=my-typescript-project

# Check if a project name was provided as an argument
if [ $# -eq 1 ]
then
    PROJECT_NAME=$1
fi

# Create a new directory for the project
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize a new yarn project
yarn init -y

# Install the required dependencies
yarn add --dev ts-node typescript nodemon eslint prettier dotenv express @types/node

# Initialize a new TypeScript project
npx tsc --init

# Update the tsconfig.json file
echo '{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "rootDir": "src",
    "outDir": "build",
    "sourceMap": true,
    "resolveJsonModule": true,
    "lib": ["es6", "dom"],
    "esModuleInterop": true
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules"]
}' > tsconfig.json

# Create a configuration file for nodemon
echo '{
    "restartable": "rs",
    "ignore": [
        ".git",
        "node_modules/**/node_modules",
        "dist"
    ],
    "verbose": true,
    "execMap": {
        "ts": "ts-node"
    },
    "runOnChangeOnly": false,
    "watch": [
        "src/**/*.ts",
        "src/**/*.js"
    ],
    "ext": "js,ts,json,graphql"
}' > nodemon.json

# Create a configuration file for ESLint
npx eslint --init

# Answer the prompts as follows:
# - To check syntax, find problems, and enforce code style
# - JavaScript modules (import/export)
# - None of these
# - Yes
# - Node
# - Use a popular style guide
# - Airbnb
# - JSON
# - No

# Create a configuration file for Prettier
echo '{ "singleQuote": true, "trailingComma": "all" }' > .prettierrc

# Create the src directory and the entry point for the app
mkdir src
echo 'import dotenv from "dotenv";
import express from "express";

// Load environment variables from .env file
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello, world!");
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});' > src/index.ts

# Create an .env file with the default port
echo 'PORT=3000' > .env

# Add the scripts to package.json
jq '.scripts |= .+ { "build": "tsc", "start": "node build/index.js","dev": "nodemon src/index.ts", "lint": "eslint --ext .ts,.js src", "format": "prettier --write src/**/*.{ts,js}" }' package.json > package.json.tmp
mv package.json.tmp package.json