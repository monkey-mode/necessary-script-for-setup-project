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

# Install the necessary dependencies for TypeScript, ESLint, and Prettier
npm install --save-dev typescript @types/react @types/node eslint eslint-plugin-react @typescript-eslint/parser @typescript-eslint/eslint-plugin prettier

# Create a tsconfig.json file in the root of the project
echo '{
  "compilerOptions": {
    "target": "esnext",
    "module": "commonjs",
    "jsx": "preserve",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "outDir": "./build",
    "esModuleInterop": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}' > tsconfig.json

# Create an .eslintrc.js file in the root of the project
echo "module.exports = {
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  settings: {
    react: {
      version: 'detect',
    },
  },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'plugin:@typescript-eslint/recommended',
    'prettier/@typescript-eslint',
  ],
  rules: {
    'react/prop-types': 'off',
    'react/react-in-jsx-scope': 'off',
  },
};" > .eslintrc.js

# Create a .prettierrc file in the root of the project
echo '{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "useTabs": false
}' > .prettierrc

# Update the scripts section of your package.json file to include the following scripts
jq '.scripts |= .+ {"build": "next build", "start": "next start", "lint": "eslint \'**/*.{js,jsx,ts,tsx}\' --fix", "format": "prettier --write \'**/*.{js,jsx,ts,tsx}\'"}' package.json > tmp.json && mv tmp.json package.json