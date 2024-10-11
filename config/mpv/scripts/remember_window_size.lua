-- non working chatgpt code example

local save_file = mp.command_native({"expand-path", "~~/window_size.conf"})

-- Load window size from the file
local function load_window_size()
    local file = io.open(save_file, "r")
    if file then
        local width, height = file:read("*n", "*n")
        file:close()
        if width and height then
            mp.set_property("window-scale", width)
        end
    end
end

-- Save window size to the file
local function save_window_size()
    local width = mp.get_property_number("window-scale")
    local file = io.open(save_file, "w+")
    if file then
        file:write(width .. "\n")
        file:close()
    end
end

mp.register_event("file-loaded", load_window_size)
mp.register_event("shutdown", save_window_size)

