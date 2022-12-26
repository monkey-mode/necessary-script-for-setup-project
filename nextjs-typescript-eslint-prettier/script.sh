#!/bin/bash

# Set default project name
PROJECT_NAME=my-project

# Check if a project name was provided as an argument
if [ $# -eq 1 ]
then
    PROJECT_NAME=$1
fi

# Create a new Next.js project with TypeScript
npx create-next-app $PROJECT_NAME --use-yarn --example with-typescript

# Navigate to the project directory
cd $PROJECT_NAME


# Add ESLint and Prettier
npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-prettier eslint-plugin-prettier prettier

# Create an .eslintrc.json file with the following contents:
echo "module.exports = {
  parser: '@typescript-eslint/parser',
  extends: [
    'plugin:@typescript-eslint/recommended',
    'prettier/@typescript-eslint',
    'plugin:prettier/recommended',
  ],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  rules: {},
};" > .eslintrc.js

# Create a .prettierrc file with the following contents:
echo '{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "useTabs": false
}' > .prettierrc

# Create a nodemon.json file with the specified configuration:
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
    ]
}' > nodemon.json


# Modify the package.json file to include the lint and format scripts
sed -i '' 's/"scripts": {/"scripts": {\n    "lint": "eslint --ext .ts,.tsx --ignore-path .gitignore .",\n    "format": "prettier --write \\"src/**/*.{ts,tsx}\\"",/' package.json