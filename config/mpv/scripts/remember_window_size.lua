-- Save this as restore_window_position.lua in your MPV scripts directory

-- NOTE: ipatch, to get the current window size and placement run, xwininfo

-- NOTE: ipatch, to resize a window using `i3-msg`
-- i3-msg '[class="mpv"] resize set 2743 720'

-- TODO: using the above xwininfo command get the current size of the window
-- TODO: using the mpv lua api, use the above i3-msg command to set the window size

-- chaggpt
-- Define the file path to save the window size (change as needed)
local save_file = mp.command_native({"expand-path", "~~/window_attributes.txt"})

local function foo()
end

-- os cmds func to get window size and placement
local function get_window_info()
  -- mp.add_timeout(0.1, function()
  -- get the window id of the mpv window using xwininfo
  local cmd = 'xwininfo -name "mpv"'

  -- run the command and capture the output
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  -- Debugging: Display the result from xwininfo
  mp.osd_message(result)

  -- variables to store width, height, x, y
  local width, height, x, y

  -- Parse the result to extract width, height, X, and Y
  width = result:match("Width:%s*(%d+)")
  height = result:match("Height:%s*(%d+)")
  x = result:match("Absolute upper%-left X:%s*(%d+)")
  y = result:match("Absolute upper%-left Y:%s*(%d+)")

  -- Convert the extracted values to numbers and return
  if width and height and x and y then
    mp.osd_message(string.format("Window info: %dx%d @ (%d, %d)", width, height, x, y))
    return tonumber(width), tonumber(height), tonumber(x), tonumber(y)
  else
    mp.osd_message("Error: Unable to retrieve window info from xwininfo")
    return nil, nil, nil, nil
  end
end

-- Function to save window attributes using xwininfo
local function save_window_attributes()
  -- Get the window size and position using xwininfo
  local width, height, x, y = get_window_info()

  if width and height and x and y then
    -- Open the file for writing
    local file = io.open(save_file, "w")
    if file then
      -- Write the window width, height, and position to the file
      file:write(string.format("Width: %d\nHeight: %d\nX: %d\nY: %d\n", width, height, x, y))
      file:close()
      mp.osd_message("Window attributes saved: " .. width .. "x" .. height .. " @ (" .. x .. "," .. y .. ")")
    else
      mp.osd_message("Error: Unable to save window attributes")
    end
  end
end

-- mpv API func to get the current window size and save it
local function save_window_attributes_mpv_api()
    -- Get the current window width and height
    local width = mp.get_property_number("osd-width", 0)
    local height = mp.get_property_number("osd-height", 0)

    -- Get the window position (geometry) if supported
    local x = mp.get_property_number("window-x", 0)
    local y = mp.get_property_number("window-y", 0)

    -- Open the file for writing
    local file = io.open(save_file, "w")
    if file then
        -- Write the window width and height, and position to the file
        -- NOTE: ipatch, example
        ------------------
        -- Width: 1095
        -- Height: 616
        -- X: 0
        -- Y: 0
        ------------------
        file:write(string.format("Width: %d\nHeight: %d\nX: %d\nY: %d\n", width, height, x, y))
        file:close()
        mp.osd_message("Window attributes saved: " .. width .. "x" .. height .. " @ (" .. x .. "," .. y .. ")")
    else
        mp.osd_message("Error: Unable to save window size")
    end
end

-- Define the path to the window attributes file
local attributes_file = mp.command_native({"expand-path", "~~/window_attributes.txt"})

-- Function to read the saved window size from the attributes file
local function read_saved_window_size()
    -- Try to open the attributes file
    local file = io.open(attributes_file, "r")
    if file then
        -- Variables to store width and height
        local width, height
        
        -- Read the file line by line
        for line in file:lines() do
            -- Match the Width and Height lines and extract values
            width = width or line:match("Width:%s*(%d+)")
            height = height or line:match("Height:%s*(%d+)")
        end

        file:close()
        
        -- If width and height are found, return them as numbers
        if width and height then
            return tonumber(width), tonumber(height)
        else
            mp.osd_message("Error: Invalid data in window_attributes.txt")
            return nil, nil
        end
    else
        mp.osd_message("Error: Unable to open window_attributes.txt")
        return nil, nil
    end
end

-- Function to resize the mpv window using i3-msg
local function resize_window_with_i3(width, height)
    -- Construct the i3-msg command
    local command = string.format('i3-msg \'[class="mpv"] resize set %d %d\'', width, height)
    
    -- Execute the command
    os.execute(command)
    mp.osd_message("Resizing mpv window to: " .. width .. "x" .. height)
end

-- Function to restore the window size when mpv is launched
local function restore_window_size()
    -- Read the saved window size
    local width, height = read_saved_window_size()
    
    -- If we got valid values, resize the window
    if width and height then
        resize_window_with_i3(width, height)
    end
end

-- Register the restore function to run when mpv starts
mp.register_event("file-loaded", restore_window_size)

-- Register the function to run when the video is loaded or resized/moved
-- mp.register_event("file-loaded", save_window_attributes)

-- Add event listener for window resize or move
mp.observe_property("osd-dimensions", "native", save_window_attributes)
mp.observe_property("window-scale", "native", save_window_attributes)
mp.observe_property("window-x", "native", save_window_attributes)
mp.observe_property("window-y", "native", save_window_attributes)
