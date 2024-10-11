-- Save this as restore_window_position.lua in your MPV scripts directory
-- claude.ai example
-- NO WORK!

utils = require 'mp.utils'

local options = require 'mp.options'
local opts = {
  save_file = '~~/window_position.txt',
}
options.read_options(opts)

local function save_window_position()
  local win_w, win_h = mp.get_property_number("width"), mp.get_property_number("height")
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
        mp.set_property_number("geometry", w, h)
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

-- mp.register_event("shutdown", save_window_position)
-- mp.register_event("file-loaded", restore_window_position)

mp.register_event("shutdown", save_window_position)
mp.register_event("file-loaded", function()
    -- Delay the restore_window_position call slightly to ensure MPV is ready
    mp.add_timeout(0.5, restore_window_position)
end)

-- Add this to handle manual resizing
mp.observe_property("osd-width", "number", save_window_position)
mp.observe_property("osd-height", "number", save_window_position)
