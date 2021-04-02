-- === CommandFn ===
--
-- NOTE: this script / function is INCOMPLETE
-- TODO: spend some time hashing out / working on script / function.
-- Use left command key ⌘ when held while pressing a `f1` and possible other function keys as function keys and not media keys on macOS
--
-- Download: https://github.com/ipatch/dotfiles

local obj={}
obj.__index = obj

-- Metadata
obj.name = "CommandFn"
obj.version = "1.0"
obj.author = "Chris <chris.r.jones.1983@gmail.com>"
obj.homepage = "https://github.com/ipatch/dotfiles"
obj.license = "MIT - https://opensource.org/licneses/MIT"

function obj:init()

  -- setup menubar icon
  cmdfn = hs.menubar.new()
  
  cmdfn:setTitle("f1")

  local function catcher(event)
    if event:getFlags()['right-cmd'] and event:getCharacters() == 'f1' then
      return true, {hs.eventtap.event.newKeyEvent({}, 'f1', true)}
    end
  end

  cmd_tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, catcher):start()

end

-- function obj:init()
--   local function catcher(event)
--     if event:getFlags()['cmd'] and event:getCharacters() == "f1" then
--       return true, {hs.eventtap.event.newKeyEvent({}, "f1", true)}
--     end
--   end
--   cmd_tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, catcher):start()
-- end

return obj
