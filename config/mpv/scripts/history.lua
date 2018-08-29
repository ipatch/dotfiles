local HISTFILE = os.getenv("APPDATA") or os.getenv("HOME") .. "/.config/mpv/mpv_history.log"

mp.register_event("file-loaded", function()
    local title, logfile;

    title = mp.get_property("media-title");  
    title = (title == mp.get_property("filename") and "" or ("(%s)"):format(title));

    logfile = io.open(HISTFILE, "a+");
    logfile:write(("[%s] %s %s\n"):format(os.date("%Y-%m-%d %X"), mp.get_property("path"), title));    
    logfile:close();
end)
