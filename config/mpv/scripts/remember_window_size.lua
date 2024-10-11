-- Save this as restore_window_position.lua in your MPV scripts directory
-- claude.ai example
utils = require 'mp.utils'

local options = require 'mp.options'
local opts = {
  save_file = '~~/window_position.txt',
}
options.read_options(opts)

local function save_window_position()
  local win_x, win_y = mp.get_property_number("window-x"), mp.get_property_number("window-y")
  local win_w, win_h = mp.get_property_number("window-width"), mp.get_property_number("window-height")
  local fs = mp.get_property_native("fullscreen")

  if win_x and win_y and win_w and win_h then
    local content = string.format("%d,%d,%d,%d,%s", win_x, win_y, win_w, win_h, tostring(fs))
    local file = io.open(mp.command_native({"expand-path", opts.save_file}), "w")
    if file then
      file:write(content)
      file:close()
    end
  end
end

local function restore_window_position()
  local file = io.open(mp.command_native({"expand-path", opts.save_file}), "r")
  if file then
    local content = file:read("*all")
    file:close()

    local x, y, w, h, fs = content:match("(-?%d+),(-?%d+),(%d+),(%d+),(%a+)")
    if x and y and w and h then
      mp.set_property_number("window-x", tonumber(x))
      mp.set_property_number("window-y", tonumber(y))
      mp.set_property_number("window-width", tonumber(w))
      mp.set_property_number("window-height", tonumber(h))
      mp.set_property_bool("fullscreen", fs == "true")
    end
  end
end

mp.register_event("shutdown", save_window_position)
mp.register_event("file-loaded", restore_window_position)
