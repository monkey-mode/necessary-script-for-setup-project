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

# Install dependencies for TypeScript, ESLint, and Prettier
npm install --save-dev typescript @types/react @types/node eslint eslint-config-prettier eslint-plugin-prettier prettier

# Create a TypeScript configuration file
npx tsc --init

# Create an ESLint configuration file
npx eslint --init

# During the ESLint configuration process, select "To check syntax, find problems, and enforce code style" as the reason for using ESLint, and select "TypeScript" as the language.
# Select "JavaScript modules (import/export)" as the type of modules you are using, and select "React" as the framework.
# Select "Yes" when asked if you want to use a style guide, and choose "Prettier" as the style guide.
# Select "Node" as the environment, and choose "jsx" as the file extensions to lint.
# Finally, select "Install and configure dependencies" when prompted to install the recommended dependencies.

