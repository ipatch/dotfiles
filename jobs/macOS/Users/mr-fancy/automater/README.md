## Automater workflows / apps for macOS

This directory contains a **unrar.app** which should be placed within a local or global **/Applications** dir on macOS to extract **.rar** files on macOS by double clicking the rar archive via the **Finder.app**

Within the _$PWD/unrar.app_ is a file that can opened via **Automater.app** on macOS which allows modifying this Automater workflow and then can be resaved as an **.app** bundle to work via the GUI _Finder_ on macOS.

### Limitations

Presently the **unrar.app** is unable to extract passowrd protected rar archives as the CLI password prompt is not passed to Finder for input so the workflow / app will fail.

❗️ Copy the automater workflows ie. apps within this directory to **/Applications** in order to use the workflows via Finder, ie. double clicking on a **.rar** file to extract.

### TODOs

- [ ] _time permitting_ see if it's possible to pass CLI input to an automater workflow / script for input, ie. being able to extract passowrd protected rar archives or at least present a more sensible error / log message when trying to extrac a password protected rar archive.
