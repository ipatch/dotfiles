-- === VirtualNumpad ===
--
-- toggle `7,8,9,u,i,o,j,k,l,m,comma,period` to their numpad equivalents
--

local obj={}
obj.__index = obj

-- Metadata
obj.name = "VirtualNumpad"
obj.version = "1.0"
obj.author = "Chris <chris.r.jones.1983@gmail.com>"
obj.homepage = "https://github.com/ipatch/dotfiles"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()

  -- setup menubar icon
  vnumpad = hs.menubar.new()

  k = hs.hotkey.modal.new('shift-option', 'n')
  function k:entered() 
    hs.alert'Virtual Numpad' 
    vnumpad:setTitle("⌨︎")
  end

  function k:exited() 
    hs.alert'Exit Virtual Numpad'
    vnumpad:setTitle("⌨️")
  end

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
end

return obj
