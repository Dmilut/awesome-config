--
-- CPU usage widget
--

local awful = require("awful")
local beautiful = require("beautiful")

cpuwidget = awful.widget.graph()
cpuwidget:set_width(30)
cpuwidget:set_height(20)

cpuwidget:set_border_color(beautiful.border_normal)
cpuwidget:set_background_color(beautiful.bg_normal)
cpuwidget:set_color(beautiful.widget_color)
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 20 }, stops = { { 0, "#FF5656"}, { 0.5, "#88A175" }, { 1, "#AECF96" } }})

cpuwidget_t = awful.tooltip({ objects = { cpuwidget.widget },})

-- Register CPU widget
vicious.register(cpuwidget, vicious.widgets.cpu, 
                    function (widget, args)
                        cpuwidget_t:set_text("CPU Usage: " .. args[1] .. "%")
                        return args[1]
                    end)
