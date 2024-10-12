-- Save this as restore_window_position.lua in your MPV scripts directory

-- NOTE: ipatch, to get the current window size and placement run, xwininfo

-- NOTE: ipatch, to resize a window using `i3-msg`
-- i3-msg '[class="mpv"] resize set 2743 720'

-- TODO: using the above xwininfo command get the current size of the window
-- TODO: using the mpv lua api, use the above i3-msg command to set the window size

-- chaggpt
-- Define the file path to save the window size (change as needed)
local save_file = mp.command_native({"expand-path", "~~/window_attributes.txt"})

-- Function to get the current window size and save it
local function save_window_size()
    -- Get the current window width and height
    local width = mp.get_property_number("osd-width", 0)
    local height = mp.get_property_number("osd-height", 0)

    -- Open the file for writing
    local file = io.open(save_file, "w")
    if file then
        -- Write the window width and height to the file
        file:write(string.format("Width: %d\nHeight: %d\n", width, height))
        file:close()
        mp.osd_message("Window size saved: " .. width .. "x" .. height)
    else
        mp.osd_message("Error: Unable to save window size")
    end
end

-- Register the function to run when the video is loaded or resized
mp.register_event("file-loaded", save_window_size)
mp.observe_property("osd-dimensions", "native", save_window_size)


