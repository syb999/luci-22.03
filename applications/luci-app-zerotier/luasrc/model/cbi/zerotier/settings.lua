
a=Map("zerotier",translate("ZeroTier"),translate("Zerotier is an open source, cross-platform and easy to use virtual LAN"))
a:section(SimpleSection).template  = "zerotier/zerotier_status"

t=a:section(NamedSection,"sample_config","zerotier")
t.anonymous=true
t.addremove=false

e=t:option(Flag,"enabled",translate("Enable"))
e.default=0
e.rmempty=false

e=t:option(DynamicList,"join",translate('ZeroTier Network ID'))
e.password=true
e.rmempty=false

e=t:option(Flag,"nat",translate("Auto NAT Clients"))
e.default=0
e.rmempty=false
e.description = translate("Allow zerotier clients access your LAN network")

e=t:option(DummyValue,"opennewwindow" , 
	translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"Zerotier.com\" onclick=\"window.open('https://my.zerotier.com/network')\" />"))
e.description = translate("Create or manage your zerotier network, and auth clients who could access")

e=t:option(Button, "zeroinit", translate("Initialization for network"))
e.rmempty = true
e.inputstyle = "apply"
function e.write(self, section)
	luci.util.exec("rm -rf /etc/zerotier /etc/config/zero >/dev/null 2>&1 &")
end
e.description = translate("When you need to join a new network, please initialize first")

return a
