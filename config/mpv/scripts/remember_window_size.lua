-- Save this as restore_window_position.lua in your MPV scripts directory
-- claude.ai
utils = require 'mp.utils'
local options = require 'mp.options'
local opts = {
  save_file = '~~/window_position.txt',
}
options.read_options(opts)

local function save_window_position()
  local win_w, win_h = mp.get_property_number("osd-width"), mp.get_property_number("osd-height")
  local fs = mp.get_property_native("fullscreen")
  if win_w and win_h then
    local content = string.format("%d,%d,%s", win_w, win_h, tostring(fs))
    local file = io.open(mp.command_native({"expand-path", opts.save_file}), "w")
    if file then
      file:write(content)
      file:close()
    end
  end
end

local function resize_window(w, h)
  -- Use i3-msg to resize the window
  os.execute(string.format("i3-msg resize set %dpx %dpx", w, h))
  -- Allow a short delay for the resize to take effect
  mp.add_timeout(0.1, function()
    -- Then set MPV's own size properties
    mp.set_property("geometry", string.format("%dx%d", w, h))
  end)
end

local function restore_window_position()
  local file = io.open(mp.command_native({"expand-path", opts.save_file}), "r")
  if file then
    local content = file:read("*all")
    file:close()
    local w, h, fs = content:match("(%d+),(%d+),(%a+)")
    if w and h then
      w, h = tonumber(w), tonumber(h)
      mp.set_property_bool("fullscreen", fs == "true")
      if fs ~= "true" then
        resize_window(w, h)
      end
    end
  end
end

-- Function to ensure window size is set correctly
local function ensure_correct_size()
  local current_w, current_h = mp.get_property_number("osd-width"), mp.get_property_number("osd-height")
  local file = io.open(mp.command_native({"expand-path", opts.save_file}), "r")
  if file then
    local content = file:read("*all")
    file:close()
    local w, h, fs = content:match("(%d+),(%d+),(%a+)")
    if w and h then
      w, h = tonumber(w), tonumber(h)
      if current_w ~= w or current_h ~= h then
        resize_window(w, h)
      end
    end
  end
end

mp.register_event("shutdown", save_window_position)

-- Use a startup script to set initial size
mp.register_event("start-file", function()
  mp.add_timeout(0.5, restore_window_position)
end)

-- Periodically check and correct size
mp.add_periodic_timer(1, ensure_correct_size)

-- Save window size after manual resizing
mp.observe_property("osd-width", "number", function(name, value)
  mp.add_timeout(0.5, save_window_position)
end)
mp.observe_property("osd-height", "number", function(name, value)
  mp.add_timeout(0.5, save_window_position)
end)
