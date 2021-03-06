pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local xrandr = require("utils.xrandr")

require("config.error")

beautiful.init(awful.util.getdir("config") .. "theme.lua" )

require("config.wall")
require("config.layout")
require("config.rules")
require("config.tags")
require("config.bar")
require("config.keys")

require("awful.autofocus")
require("config.notif")

require("run")
-- Signals
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
