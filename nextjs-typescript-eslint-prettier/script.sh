#!/bin/bash

# Set default project name
PROJECT_NAME=my-project

# Check if a project name was provided as an argument
if [ $# -eq 1 ]
then
    PROJECT_NAME=$1
fi

# Create a new Next.js project with TypeScript
npx create-next-app $PROJECT_NAME --use-yarn --typescript

# Navigate to the project directory
cd $PROJECT_NAME


# Add ESLint and Prettier
npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-prettier eslint-plugin-prettier prettier

# Create an .eslintrc.json file with the following contents:
echo '{
  "parser": "@typescript-eslint/parser",
  "extends": [
    "plugin:@typescript-eslint/recommended",
    "prettier/@typescript-eslint",
    "plugin:prettier/recommended"
  ],
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "rules": {
    // I suggest you add those two rules:
    "@typescript-eslint/no-unused-vars": "warn",
    "@typescript-eslint/no-explicit-any": "warn"
  }
}' > .eslintrc.json


# Create a .prettierrc file with the following contents:
echo '{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "useTabs": false
}' > .prettierrc


# Modify the package.json file to include the lint and format scripts
sed -i 's/"scripts": {/"scripts": {\n"format": "prettier --write src\/**\/*.{js,jsx,ts,tsx}", /' package.json

rm -rf .git