--[[
LuCI - Lua Configuration Interface

Copyright 2016 Weijie Gao <hackpascal@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

require("luci.sys")

local fs = require "nixio.fs"

local f = SimpleForm("cups",
	translate("CUPS - Printer Sharing"),
	translate("CUPS is the printer system for UNIX-like systems."))

manage = f:section(SimpleSection, translate("Management"))

local b = manage:option(Button, "_open")

b.template = "cups/open"


config = f:section(SimpleSection, translate("Configuration"))

local o = config:option(Value, "_config")

o.template = "cbi/tvalue"
o.rows = 20

function o.cfgvalue(self, section)
	return fs.readfile("/etc/cups/cupsd.conf")
end

function o.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	fs.writefile("/etc/cups/cupsd.conf", value)
	luci.sys.exec("/etc/init.d/cupsd restart")
end

return f

