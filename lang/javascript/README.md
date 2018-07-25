<a href="contents"></a>

## ECMAScript _the language formerly known as JavaScript_ Tooling
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

<a href="working-with-nodejs"></a>

## Working with Node.js

> Node.js v10.0.0 ships with NPM v5.6.0 if downloading the `.pkg` install.

> In the past certain NPM modules / packages can create a `.v8flags.{version}.{md5-hash-of-username}.json within the users home directory.  These files can safely be deleted. see [this](https://stackoverflow.com/questions/34612415) for more information.

<a href="package-json"></a>

## package.json

What are the differences between **devDependencies** and **dependencies** in _package.json_<br />
**dependencies** are installed for both _production_ and _development_.
> see [🙈](https://stackoverflow.com/a/22004559/708807) for a more detailed explanation.

<a href="working-with-eslint"></a>

## Working with [ESlint](https://eslint.org)

To setup a `$USER`, ie. a global configuration file for eslint for a particular user that will be used for pretty much every Node.js project, or `.js` / `.jsx` file, create `~/.eslintrc`, which can be formatted using JSON. 👍

> If a particular ECMAScript project does not contain a local eslint configuration file, then eslint will traverse up the file heirarchy to look for a configuration file until eslint reaches the `$USER`'s home directory.

To setup a ECMAScript project to use a local eslint configuration file, eslint provides a wizard by running the below command in the project root.

```
eslint --init
```

<a href="setup-eslint-to-play-nice-with-vs-code"></a>

### Setup ESLint to play nice with VS Code

To get VS Code and ESLint to play nice with each other
1. Install ESLint globally using yarn or npm, whichever you are using to manage global npmjs.com packages / modules.
2. A global **.eslintrc** file can be set up in `$HOME` or a local **.eslintrc.{js,json,yaml}** file can be setup in the project root.
3. Install **standard** ie. standardjs.com
```
yarn global add standard eslint-config-standard
```
3. If installing globally using yarn, a couple of settings will have to be added to VS Code's **settings.json**.
**Ex**
```
// use global eslint installed via yarn
"eslint.packageManager": "yarn",
"eslint.enable": true
```
4. Install unmet peer dependenices globally or locally using preferred package manager.

<a href="using-nodejs-with-neovim"></a>

## Using Node.js with Neovim

To install the Node.js provider package for Neovim make sure the **neovim** package has been installed using a Node.js package manager.

```
npm -g i neovim
yarn global add neovim
```

<a href="working-with-npm"></a>

## Working with NPM

To update NPM to latest stable release

```fish
npm install npm@latest -g
```

To install a NPM package / module globally for a user on the system that should be accessible via the `$PATH`

> If the NPM prefix is not set, the homebrew version of Nodejs / NPM will put global packages with in `/usr/local/bin`

```fish
npm install -g [name-of-package]
```

ie.

```fish
npm install -g create-react-app
```

To uninstall a npm package / module from a project.

```fish
npm uninstall [module] --save
```

To list all globally installed packages for a node instance

```fish
npm -g ls --depth=0
```

<a href="npm-security"></a>

### NPM security 

To update a vulnerable package contained within a `package.json` file

```fish
npm install mr-fancy-package@42.0 --save
```

> The above command will explicity define the package within the `package.json` file.

<a href="working-with-yarn"></a>

## Working with [Yarn](https://yarnpkg.com/en/)

> ⚠️  Before installing a global package with yarn installed via homebrew, make sure the `global bin` and `global prefix` have been set, ie.

To set the **global** prefix bin where packages that are installed with yarn globally and store the binaires

```fish
yarn config set prefix ~/.config/yarn
```

> The above configuration command will create `bin` dir within `global` dir to store the symlinks to the globally installed binaries.

```fish
yarn config set bin -g ~/.config/yarn/bin
```

The above settings can be verified / checked with

```fish
yarn global dir
```

```fish
yarn global bin
```

To install a package / module globally using yarn

```fish
yarn global add [mr-fancy-node-module]
```

ie.

```fish
yarn global add create-react-app
```

The above installation command should place the `create-react-app` binary within `~/.config/yarn/bin/`

The dependencies, ie. `node_modules` for `create-react-app` should be within `~/.config/yarn/global/node_modules`

To list globally installed modules ie. packages within yarn

```
yarn global list
```

To upgrade a specific npm module / package using yarn

```
yarn upgrade package@version
```

**Ex**

```
yarn upgrade marked@0.3.9
```

To add a package as a development dependency, see [🙈](https://yarnpkg.com/lang/en/docs/cli/add/)

```fish
yarn add <package> [-D/--dev]
```

<a href="working-with-yarn-on-debian"></a>

### Working with Yarn on Debian

If the below error message arises run the command below the error message.

> W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: https://dl.yarnpkg.com stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY

```
wget -qO - https://raw.githubusercontent.com/yarnpkg/releases/gh-pages/debian/pubkey.gpg | sudo apt-key add -
```

<a href="useful-links"></a>

## Useful Links
- [**YouTube** JavaScript's event loop](https://www.youtube.com/watch?v=8aGhZQkoFbQ)

<a href="react"></a>

### react
- [**facebook.com** future of react](https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Freact%2Fvideos%2F1552821821462886%2F&show_text=0&width=560&mute=0)

<a href="tutorials"></a>

## Tutorials
- [**medium.com** building a CLI app using node.js](https://tech.cars.com/developing-command-line-tools-in-node-js-14eeb1ac877e)
- [**codeburst.io** 25 Useful Node.js Tutorials _March 13, 2018_](https://codeburst.io/25-node-js-tutorials-1db3b1da0260)
- [All about Node.js](https://codeburst.io/all-about-node-js-you-wanted-to-know-25f3374e0be7)
- [Using OAuth with Express & Node](http://ranjithnair.github.io/2018/01/30/Oauth-Express.html)

<a href="web-scrapping"></a>

### Web Scrapping
- [A Guide to Automating & Scraping the Web with JavaScript](https://codeburst.io/a-guide-to-automating-scraping-the-web-with-javascript-chrome-puppeteer-node-js-b18efb9e9921)

<a href="real-time"></a>

### real-time
- [Going real time with Socket.IO](https://codeburst.io/going-real-time-with-socket-io-node-js-and-react-3e0f02d3d447)
- [**medium** Building a Node.js WebSocket Chat App with Socket.io and React](https://itnext.io/building-a-node-js-websocket-chat-app-with-socket-io-and-react-473a0686d1e1)

<a href="v8"></a>

### V8
- [Node.js V8 internals](https://codeburst.io/node-js-v8-internals-an-illustrative-primer-83766e983bf6)

<a href="graphql"></a>

### GraphQL
- [How GraphQL Replaces Redux](https://hackernoon.com/how-graphql-replaces-redux-3fff8289221d)
- [Securing a GraphQL API from malicious queries](https://dev-blog.apollodata.com/securing-your-graphql-api-from-malicious-queries-16130a324a6b)

<a href="todos"></a>

## TODOs
- [ ] Review all links recently added.
- [x] ~~flesh out TOC~~
- [ ] organize contents of the doc a little better _time permitting_
