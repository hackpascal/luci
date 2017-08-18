--[[
LuCI - Lua Configuration Interface

Copyright 2016 Weijie Gao <hackpascal@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

m = Map("vlmcsd", translate("KMS Server"))

sl = m:section(NamedSection, "listen", "listen", translate("Listening Settings"))

o = sl:option(Flag, "enable4", translate("Enable IPv4"))
o.rmempty = false
o.default = true

o = sl:option(Value, "ipv4", translate("IPv4 Address"))
o.datatype = "ip4addr"
o.default = "0.0.0.0"

o = sl:option(Flag, "enable6", translate("Enable IPv6"))
o.rmempty = false
o.default = true

o = sl:option(Value, "ipv6", translate("IPv6 Address"))
o.datatype = "ip6addr"
o.default = "::"

o = sl:option(Value, "port", translate("Listen Port"))
o.datatype = "uinteger"
o.default = "1688"


sa = m:section(NamedSection, "activation", "activation", translate("Activation Settings"))

o = sa:option(Value, "maxclients", translate("Max client requests"), translate("Max. clients activating simultaneously. 0 for no limitation."));
o.datatype = "uinteger"
o.default = "0"

o = sa:option(Value, "timeout", translate("Connection timeout"), translate("Disconnect clients after <timeout> of inactivity."));
o.datatype = "uinteger"
o.default = "30"

o = sa:option(Flag, "forcedisconn", translate("Disconnect client after each request"))
o.default = false

o = sa:option(Value, "reteyinterval", translate("Retry interval"), translate("The unit is minute. 's' (sec) / 'h' (hour) / 'd' (day) / 'w' (week) can be appended. Default is 2d."))
o.rmempty = false

o = sa:option(Value, "renewinterval", translate("Renewal interval"), translate("Default is 1w."));
o.rmempty = false

o = sa:option(Flag, "ndr64", translate("Enable NDR64"), translate("Enable the NDR64 transfer syntax in RPC."))
o.default = true

o = sa:option(Flag, "btfn", translate("Enable BTFN"), translate("Enable bind time feature negotiation in RPC."))
o.default = true


se = m:section(NamedSection, "epid", "epid", translate("ePID Settings"))

o = se:option(ListValue, "epidrand", translate("ePID randomization level"))
o:value("0")
o:value("1")
o:value("2")
o.default = "1"

o = se:option(Value, "lcid", translate("LCID"), translate("Use fixed <LCID> in random ePIDs. 0 for defaults. Refer to https://msdn.microsoft.com/en-us/goglobal/bb964664.aspx"))
o.default = "0"

o = se:option(Value, "windows", translate("ePID for Windows"))
o.rmempty = false

o = se:option(Value, "win10cngov", translate("ePID for Windows 10 China Gov"))
o.rmempty = false

o = se:option(Value, "office2010", translate("ePID for Office 2010"))
o.rmempty = false

o = se:option(Value, "office2013", translate("ePID for Office 2013"))
o.rmempty = false

o = se:option(Value, "office2016", translate("ePID for Office 2016"))
o.rmempty = false

o = se:option(Value, "hwid", translate("Fixed hardware Id"))
o.rmempty = false


sg = m:section(NamedSection, "log", "log", translate("Logging Settings"))

o = sg:option(Flag, "syslog", translate("Enable log to syslog"))
o.rmempty = false

o = sg:option(Flag, "filelog", translate("Enable log to file"))
o.rmempty = false

o = sg:option(Flag, "verbose", translate("Verbose log"))
o.rmempty = false

o = sg:option(Value, "file", translate("Log file"))
o.rmempty = false
o.default = "/var/log/vlmcsd.log"

return m
