# ECMAScript _the language formerly known as JavaScript_ Tooling

<a id="contents"></a>

## Contents

- [Working with Node.js](#working-with-nodejs)
- [package.json](#package.json)
- [Working with ESLint](#working-with-eslint)
- [Setup ESLint to play nice with VS Code](#setup-eslint-to-play-nice-with-vs-code)
- [Using Node.js with Neovim](#using-nodejs-with-neovim)
- [Working with NPM](#working-with-npm)
  - [NPM Security](#npm-security)
- [Working with Yarn](#working-with-yarn)
  - [Working with Yarn on Debian](#working-with-yarn-on-debian)
- [Useful Links](#useful-links)
- [TODOs](#todos)

<a id="javascript-style-guidelines"></a>

## JavaScript Style Guidelines [🔝](#contents)

This information can be considered highly opinionated;

- I prefer to use ESLint to lint JavaScript files contained through various JavaScript files and node projects I work with.
- Looking at the source of project maintained by TC39 and hosted on GitHub it appears they are using semi colons throughout the project, as well as the guys and gals at facebook are using semi colons throughout React.js, that said, I'm going to do my best to start using semi colons throughout various node projects I work with.

<a id="working-with-nodejs"></a>

## Working with Node.js [🔝](#contents)

Node.js v10.0.0 ships with NPM v5.6.0 if downloading the `.pkg` install.

> In the past certain NPM modules / packages can create a `.v8flags.{version}.{md5-hash-of-username}.json within the users home directory.  These files can safely be deleted. see [this](https://stackoverflow.com/questions/34612415) for more information.

<a id="working-with-nvm"></a>

## Working with `nvm` for managing different versions of Node.js

To set the default version of Node.js

```shell
nvm alias default 10.15.1
```

### Troubleshooting with NVM

When working with a Node.js project and editing files with Neovim and having Coc.nvim installed a Neovim plugin I was running into the below error message when switching between files using denite.

<strong>Error Message</strong>

```shell
[coc.nvim] failed to load ESLint...
```

A possible remedy for the above error message is to install **ESLint** globally using `npm` especially if one using **nvm** to manage different versions of Node.js

<a id="package-json"></a>

## package.json [🔝](#contents)

What are the differences between **devDependencies** and **dependencies** in _package.json_<br />
**dependencies** are installed for both _production_ and _development_.
> see [🙈](https://stackoverflow.com/a/22004559/708807) for a more detailed explanation.

<a id="javascript-linting"></a>

## Linting in JavaScript [🔝](#contents)

Two popular linters for JavaScript are ESLint & JSHint.  ESLint is more commonly used for linting JavaScript source files, and module files located in Node.js projects.  That said, JSHint can lint JSON files out of the box, so when editing a **.eslintrc.json** file use **jshint**. ESLint uses a modular architecture and can lint JSON files, but requires an addtional NPM module be installed.

<a id="javascript-working-with-eslint"></a>

### Working with [ESlint](https://eslint.org) [🔝](#contents)

To setup a `$USER`, ie. a global configuration file for eslint for a particular user that will be used for pretty much every Node.js project, or `.js` / `.jsx` file, create `~/.eslintrc`, which can be formatted using JSON. 👍

> If a particular ECMAScript project does not contain a local eslint configuration file, then eslint will traverse up the file heirarchy to look for a configuration file until eslint reaches the `$USER`'s home directory.

To setup a ECMAScript project to use a local eslint configuration file, eslint provides a wizard by running the below command in the project root.

```shell
eslint --init
```

<a id="javascript-setup-eslint-to-play-nice-with-vs-code"></a>

#### Setup ESLint to play nice with VS Code [🔝](#contents)

To get VS Code and ESLint to play nice with each other

1. Install ESLint globally using yarn or npm, whichever you are using to manage global npmjs.com packages / modules.
2. A global **.eslintrc** file can be set up in `$HOME` or a local **.eslintrc.{js,json,yaml}** file can be setup in the project root.
3. Install **standard** ie. standardjs.com

```shell
yarn global add standard eslint-config-standard
```

If installing globally using yarn, a couple of settings will have to be added to VS Code's **settings.json**.

<strong>Ex</strong>

```javascript
// use global eslint installed via yarn
"eslint.packageManager": "yarn",
"eslint.enable": true
```

1. Install unmet peer dependenices globally or locally using preferred package manager.

<a id="using-nodejs-with-neovim"></a>

## Using Node.js with Neovim [🔝](#contents)

To install the Node.js provider package for Neovim make sure the **neovim** package has been installed using a Node.js package manager.

```shell
npm -g i neovim
yarn global add neovim
```

<a id="working-with-npm"></a>

## Working with NPM [🔝](#contents)

To update NPM to latest stable release

```shell
npm install npm@latest -g
```

To get a more detailed print out of the components working with **npm** ie. _uv_, _openssl_, _node_, _v8_, _etc_, _etc_

```shell
npm version
```

To print / show the latest version of a NPM package

```shell
npm show [pkg] version
```

To install a NPM package / module globally for a user on the system that should be accessible via the `$PATH`

> If the NPM prefix is not set, the homebrew version of Nodejs / NPM will put global packages with in `/usr/local/bin`

```shell
npm install -g [name-of-package]
```

ie.

```shell
npm install -g create-react-app
```

To uninstall a npm package / module from a project.

```shell
npm uninstall [module] --save
```

To list all globally installed packages for a node instance

```shell
npm -g ls --depth=0
```

<a id="npm-troubleshooting"></a>

### NPM troubleshooting [🔝](#contents)

When running into an issue such as the one below,

```conf
npm WARN bootstrap@4.1.3 requires a peer of popper.js@^1.14.3 but none is installed. You must install peer dependencies yourself.
```

The quick fix, trash the **node_modules** directory and then recreate 🧙‍♂️  it.

```shell
rm -rf ./node_modules
npm install
```

<a id="npm-security"></a>

### NPM security [🔝](#contents)

To update a vulnerable package contained within a `package.json` file

```shell
npm install mr-fancy-package@42.0 --save
```

> The above command will explicity define the package within the `package.json` file.

<a id="working-with-yarn"></a>

## Working with [Yarn](https://yarnpkg.com/en/) [🔝](#contents)

> ⚠️  Before installing a global package with yarn installed via homebrew, make sure the `global bin` and `global prefix` have been set, ie.

<a id="yarn-global-package-module-setup"></a>

### Yarn Global Package / Module setup [🔝](#contents)

> 🚨 When working with **global** sub command in yarn the **global** sub command must be the first argument after the yarn command, ie.

<strong>Ex</strong>

```shell
yarn global [add] [package]
```

```shell
yarn global bin
```

To set the **global** prefix where yarn global packages are installed

```shell
yarn config set prefix $HOME/.yarn
```

> The above configuration command will create `bin` dir within `global` dir, ie. `$HOME/.yarn/` to store the symlinks to the globally installed binaries.

The above settings can be verified / checked with

```shell
yarn config get prefix
```

To print the path where globally installed packages via yarn are located on the system.

```shell
yarn global bin
```

> Only the **prefix** needs to be set in order to set the path for global packages installed via **yarn**

For more information about working with **global** in yarn [see](https://yarnpkg.com/en/docs/cli/global)

<a id="yarn-global-package-module-installation"></a>

### Yarn Global Package / Module Installation [🔝](#contents)

To install a package / module globally using yarn

```shell
yarn global add [mr-fancy-node-module]
```

ie.

```shell
yarn global add create-react-app
```

The above installation command should place the `create-react-app` binary within `~/.config/yarn/bin/`

The dependencies, ie. `node_modules` for `create-react-app` should be within `~/.config/yarn/global/node_modules`

To list globally installed modules ie. packages within yarn

```shell
yarn global list
```

<a id="yarn-upgrade-a-global-package-module"></a>

### Yarn Upgrade a Global Package / Module [🔝](#contents)

To upgrade a global package / module installed with yarn

- First check to if there are any outdated global packages

```shell
yarn global upgrade-interactive
```

- Select which global packages you would like to update

To upgrade a specific npm module / package using yarn

```shell
yarn upgrade package@version
```

<strong>Ex</strong>

```shell
yarn upgrade marked@0.3.9
```

To add a package as a development dependency, see [🙈](https://yarnpkg.com/lang/en/docs/cli/add/)

```shell
yarn add <package> [-D/--dev]
```

<a id="troubleshooting-yarn"></a>

### Troubleshooting yarn [🔝](#contents)

**yarn** as of July 31 2018 has difficulty updating packages listed in `package.json`, but [**npm-check-updates**](https://www.npmjs.com/package/npm-check-updates) does a decent job in keeping packages updated in the **package.json**

See the above link for working with **npm-check-updates** / **ncu**

<a id="working-with-yarn-on-debian"></a>

### Working with Yarn on Debian [🔝](#contents)

If the below error message arises run the command below the error message.

> W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: [yarnpkg.com](https://dl.yarnpkg.com) stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY

```shell
wget -qO - https://raw.githubusercontent.com/yarnpkg/releases/gh-pages/debian/pubkey.gpg | sudo apt-key add -
```

<a id="working-with-project-based-package-dependencies"></a>

## Working with project based packages / dependencies [🔝](#contents)

To check for outdated packages / modules on a project basis

```shell
npm outdated
```

> The above command needs to be run within the project root, ie. the directory that contains **pacakge.json**

To upgrade the outdated packages.

```shell
npm upgrade [pkgname]
```

<a id="useful-links"></a>

## Useful Links [🔝](#contents)

- [**YouTube** JavaScript's event loop](https://www.youtube.com/watch?v=8aGhZQkoFbQ)

<a id="react"></a>

### react [🔝](#contents)

- [**facebook.com** future of react](https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freact%2Fvideos%2F1552821821462886%2F&show_text=0&width=560&mute=0)

<a id="tutorials"></a>

## Tutorials [🔝](#contents)

- [**medium.com** building a CLI app using node.js](https://tech.cars.com/developing-command-line-tools-in-node-js-14eeb1ac877e)
- [**codeburst.io** 25 Useful Node.js Tutorials _March 13, 2018_](https://codeburst.io/25-node-js-tutorials-1db3b1da0260)
- [All about Node.js](https://codeburst.io/all-about-node-js-you-wanted-to-know-25f3374e0be7)
- [Using OAuth with Express & Node](http://ranjithnair.github.io/2018/01/30/Oauth-Express.html)

<a id="web-scrapping"></a>

### Web Scrapping [🔝](#contents)

- [A Guide to Automating & Scraping the Web with JavaScript](https://codeburst.io/a-guide-to-automating-scraping-the-web-with-javascript-chrome-puppeteer-node-js-b18efb9e9921)

<a id="real-time"></a>

### real-time [🔝](#contents)

- [Going real time with Socket.IO](https://codeburst.io/going-real-time-with-socket-io-node-js-and-react-3e0f02d3d447)
- [**medium** Building a Node.js WebSocket Chat App with Socket.io and React](https://itnext.io/building-a-node-js-websocket-chat-app-with-socket-io-and-react-473a0686d1e1)

<a id="v8"></a>

### V8 [🔝](#contents)

- [Node.js V8 internals](https://codeburst.io/node-js-v8-internals-an-illustrative-primer-83766e983bf6)

<a id="graphql"></a>

### GraphQL [🔝](#contents)

- [How GraphQL Replaces Redux](https://hackernoon.com/how-graphql-replaces-redux-3fff8289221d)
- [Securing a GraphQL API from malicious queries](https://dev-blog.apollodata.com/securing-your-graphql-api-from-malicious-queries-16130a324a6b)

<a id="todos"></a>

## TODOs [🔝](#contents)

- [ ] device a a shell script to generate a file that can be piped into yarn to install all global packages listed within the file, similar to how brew installs packages listed in a file
- [ ] Review all links recently added.
- [x] ~~flesh out TOC~~
- [x] organize contents of the doc a little better _time permitting_
