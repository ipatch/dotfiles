## installation

1. navigate to the file location within browser that has <strong>*</strong>monkey browser extension installed on it.
2. click on the file URL `*.user.js` to load the userscript in the browser based editor

> for my particular local dev setup, i'm using apache2 on macos 10.14, and am serving the script file from my `~/Sites` directory within my `/Users/$USER` directory.

### troubleshooting

💡 there is a bit of a delay from when the userscript file is written and when the browser picks up on the change, so if the initial refresh does not load changes give 5 secs and try again, and if still nothing inspect <strong>*</strong>monkey settings.

the scripts can be a little finicky to get loaded, make sure the `downloadURL` and the `updateURL` are set to the proper path on the filesystem or else script changes will not be pushed when developing a script locally for testing.  _violentmonkey_ should display an error if it fails to _fetch_ the updated script 

## Setup/local development for userscript files

- watch the following [youtube video][link1] for setting up local text editor for userscripts.

[link1]: <https://www.youtube.com/watch?v=CtGT_l7TMe4>

## TODOs

<a id="todos"></a>

- [x] ~~see if a symlink will work with specifying the path to the script file as opposed to putting the raw script file within the `~/Sites` directory~~
  > it appears symlinking $HOME/Sites/lnk to $dots/config/violentmonkey/script.user.js to not have any issues on macos using vivaldi browser
- [ ] flesh out readme explaining how the defeault macos apache2 can be used to serve userscript files in order to edit userscripts in local editor such as vim, neovim, or dare i say emacs 😬 instead of using the builtin browser based script editor.
- [ ] in an alt life get hot loading working userscripts so i don't have to refresh the page everytime i make a change to a userscript
