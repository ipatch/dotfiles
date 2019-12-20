hs.loadSpoon("VirtualNumpad")
-- hs.loadSpoon("CommandFn")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config reloaded")
