## Working with Hammerspoon

I have both **Dock icon** and **menu icon** disabled in the **Hammerspoon Preferences**, that said **Hammerspoon.app** can be accessed via Spotlight <kbd>⌘</kbd>+<kbd>␣</kbd> **aka** <kbd>⌘</kbd>+<kbd>spacebar</kbd>.

**Hammerspoon** makes setting up an a _Virtual Numpad_ on a MacBook keyboard somewhat manageable, which is convenient when working with apps such as [**Blender &nearr;**](https://www.blender.org/).

- **Hammerspoon** defaults to storing configuration files, ie. **init.lua** in **$HOME/.hamerspoon**

- **Hammerspoon** APIs do not have features to distinguish between a _right command key_ press from a _left command key_ press, and thus is should be relied up [**Karabiner-Element**](https://github.com/pqrs-org/Karabiner-Elements) &nearr;

## hammerspoon / troubleshooting

recently (circa december 2021) my cli install of hammerspoon was no longer working ie. dangling symlinks within `/usr/local` directory. in short to check the status of the cli install for hammerspoon, open up the hammerspoon console from the hammer icon in the menu bar and use the below commands to status, uninstall, install / reinstall / fix the _cli / ipc_ functionality of hammerspoon.

> run the below commands within the hammerspoon console.

```
hs.ipc.cliStatus()
hs.ipc.cliInstall()
hs.ipc.cliUninstall()
```
