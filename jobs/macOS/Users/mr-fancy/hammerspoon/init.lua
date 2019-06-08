k = hs.hotkey.modal.new('shift-option', 'n')
function k:entered() hs.alert'Virtual Numpad' end
function k:exited() hs.alert'Exit Virtual Numpad' end
k:bind('shift-option', 'n', function() k:exit() end)

hs.fnutils.each({
  { key='j', padkey='pad1'},
  { key='k', padkey='pad2'},
  { key='l', padkey='pad3'},
  { key='u', padkey='pad4'},
  { key='i', padkey='pad5'},
  { key='o', padkey='pad6'},
  { key='7', padkey='pad7'},
  { key='8', padkey='pad8'},
  { key='9', padkey='pad9'},
  { key='m', padkey='pad0'},
  { key='/', padkey='pad+'},
  { key=';', padkey='pad-'},
  { key='p', padkey='pad*'},
  { key='0', padkey='pad/'},
}, function(vmap)
  k:bind({}, vmap.key,
    function() hs.eventtap.keyStroke({}, vmap.padkey, 20) end,
    nil,
    function() hs.eventtap.keyStroke({}, vmap.padkey, 20) end)
  end
)
