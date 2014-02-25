-- Keyboard widget

local beautiful = require("beautiful")
local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")

-- Keyboard map indicator and changer
kbdcfgwidget = wibox.widget.textbox()

kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { "us", "" }, { "ru", "" } }
kbdcfg.current = 1  -- us is our default layout
kbdcfgwidget:set_text(" " .. kbdcfg.layout[kbdcfg.current][1] .. " ")

kbdcfg.switch = function ()
  kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
  local t = kbdcfg.layout[kbdcfg.current]
  kbdcfgwidget:set_text(" " .. t[1] .. " ")
  os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
end

 -- Mouse bindings
kbdcfgwidget:buttons(
	awful.util.table.join(
		awful.button({ }, 1, function () kbdcfg.switch() end)
	)
)
