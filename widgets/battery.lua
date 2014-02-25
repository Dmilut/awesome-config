--
--  Simple battery widget
--
local beautiful = require("beautiful")
local naughty = require("naughty")
local awful = require("awful")

batterywidget = awful.widget.progressbar()
batterywidget:set_width(8)
batterywidget:set_vertical(true)
batterywidget:set_border_color(beautiful.border_normal)
batterywidget:set_color(beautiful.widget_color)
--batterywidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 20 }, stops = { { 0, "#FF5656"}, { 0.5, "#88A175" }, { 1, "#FF7F50" } }})
batmon_t = awful.tooltip({ objects = { batterywidget.widget },})
vicious.register(batterywidget, vicious.widgets.bat, function (widget, args)
    batmon_t:set_text(" State: " .. args[1] .. " | Charge: " .. args[2] .. "% | Remaining: " .. args[3])
    if args[2] <= 5 then
        naughty.notify({ text="Battery is low! " .. args[2] .. " percent remaining." })
    end
    return args[2]
end , 60, "BAT0")
