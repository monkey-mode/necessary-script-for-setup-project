#!/bin/bash

# Set default project name
PROJECT_NAME=my-project

# Check if a project name was provided as an argument
if [ $# -eq 1 ]
then
    PROJECT_NAME=$1
fi

# Create a new Next.js project with TypeScript
npx create-next-app $PROJECT_NAME --use-npm

# Navigate to the project directory
cd $PROJECT_NAME

# Add TypeScript support
npm install --save-dev typescript @types/react @types/node

# Create a tsconfig.json file
npx tsc --init

# Add ESLint and Prettier
npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-prettier eslint-plugin-prettier prettier

# Create an .eslintrc.json file with the following contents:
echo '{
  "parser": "@typescript-eslint/parser",
  "extends": [
      "eslint:recommended",
      "plugin:@typescript-eslint/recommended",
      "prettier"
    ],
  "plugins": ["prettier","@typescript-eslint"],
  "parserOptions": {
      "project": "./tsconfig.json"
    },
   "env": {
      "node": true
    },
  "rules": {
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

# Add scripts to package.json to run ESLint and Prettier
cat <<EOT >> package.json
  "scripts": {
    "build": "npx tsc",
    "dev": "npm run lint && npm run build && nodemon",
    "start": "node dist/index.js",
    "lint": "eslint 'src/**/*.{js,ts}' --fix",
    "format": "prettier --write 'src/**/*.{js,ts}'"
  },
EOT