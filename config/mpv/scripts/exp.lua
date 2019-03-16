-- print a OSD message with a key binding ...just a tad convoluted
-- NOTE: this key-binding / function will only work when the GUI window is activated, and NOT through a CLI
-- ... `⌘+s` will snap a screenshot of the mpv output window.
-- TODO: migrate / figure out todo with Javascript

local mp = require 'mp'
local utils = require 'mp.utils'
local options = require 'mp.options'

local M = {}

function M.lshow_text()
  -- text to display On Screen over video output
  local msg = "silly onscreen message"
  -- duration of message equals 5 seconds
  ms = 5000
  mp.commandv("show-text", msg, ms)
end

function M.bind_meta_s()
  mp.add_key_binding('meta+s', '', M.lshow_text)
end

function M.ubind_meta_s()
  mp.remove_key_binding('meta+s')
end

function M.main()
  M.bind_meta_s()
end

mp.register_event("file-loaded", M.main)
