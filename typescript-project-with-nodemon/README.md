# Typescript Project Setup Script With Nodemon, ESLint, and Prettier

This script helps you set up a new Typescript project with a few key development tools:

- Nodemon: a tool that automatically restarts the server whenever you make changes to the code.
- ESLint: a tool that helps you write clean and consistent code by linting for syntax and style errors.
- Prettier: a tool that automatically formats your code according to a set of predefined rules, helping you enforce a consistent code style throughout your project.

## Usage

To use this script, run the following command:

```bash
curl -sL https://raw.githubusercontent.com/monkey-mode/necessary-script-for-setup-project/main/typescript-project-with-nodemon/script.sh | bash -s [PROJECT_NAME]
```

## Answer the prompts as follows:

- To check syntax, find problems, and enforce code style
- JavaScript modules (import/export)
- None of these
- Yes
- Node
- Use a popular style guide
- Airbnb
- JSON
- No

## Available Scripts

The following scripts are available:

- `build`: compiles the TypeScript code using the TypeScript compiler (`tsc`).
- `start`: runs the compiled code in the `build` directory.
- `dev`: runs the app in development mode with nodemon, using the `src/index.ts` file as the entry point.
- `lint`: runs ESLint on all `.ts` files in the current directory.
- `format`: runs Prettier on all `.ts` files in the `src` directory and its subdirectories.

You can run a script by using the `yarn` command followed by the name of the script, for example: `yarn build` or `yarn dev`.

## Configuration

You can customize the configuration of the development tools by modifying the following files:

- `nodemon.json`: configuration file for Nodemon
- `.eslintrc.json`: configuration file for ESLint
- `.prettierrc`: configuration file for Prettier
- `.env`: environment variables file

You can also add additional dependencies and scripts to the `package.json` file as needed.

## Additional Resources

- [TypeScript documentation](https://www.typescriptlang.org/docs)
- [Nodemon documentation](https://nodemon.io/)
- [ESLint documentation](https://eslint.org/docs/user-guide/getting-started)
- [Prettier documentation](https://prettier.io/docs/en/index.html)
