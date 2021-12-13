-- NOTE: exp IPC module
-- LINK: https://www.hammerspoon.org/docs/hs.ipc.html
require("hs.ipc")

-- hs.ipc.cliUninstall(true)
hs.ipc.cliInstall("/usr/local/bin")
hs.ipc.cliSaveHistory(true)

-- NOTE: quickly reload hs configuration file, and spoons for quick testing / debugging
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config reloaded")

function alert(message)
  hs.alert(message)
end

-- NOTE: to execute the below func from a shell,
-- `hs -c "helloHammerspoon()"
function helloHammerspoon()
  print("Hello, Hammerspoon!")
end

-- load spoons last, if error in spoon, won't prevent `reload` hotkey from being bound
hs.loadSpoon("VirtualNumpad")
-- hs.loadSpoon("CommandFn")
-- hs.loadSpoon("AutoRaise")
hs.loadSpoon("SpoonTest")


