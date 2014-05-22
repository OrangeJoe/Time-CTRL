PLUGIN.Title = "TimeCTRL"
PLUGIN.Description = "Time Controller"
PLUGIN.Author = "Orange Joe"
PLUGIN.Version = "1.1"


function PLUGIN:Init()
	flags_plugin = plugins.Find("flags")
	if (not flags_plugin) then
		error("FLAGS PLUGIN REQUIRED ! Please visit the Oxide forums to get the Flags Plugin.")
		return
	end
	flags_plugin:AddFlagsChatCommand(self, "dawn", {"kick"}, self.cmdDawn)
	flags_plugin:AddFlagsChatCommand(self, "dusk", {"kick"}, self.cmdDusk)
	flags_plugin:AddFlagsChatCommand(self, "t", {"kick"}, self.cmdT)
	self:AddChatCommand("time", self.cmdTime)
end

   print( PLUGIN.Title .. " v" .. PLUGIN.Version .. " loaded!" )

function PLUGIN:cmdDawn()
	rust.RunServerCommand("env.time 6")
    rust.BroadcastChat("=TIME=", "Hour: 6:00")
end

function PLUGIN:cmdDusk()
	rust.RunServerCommand("env.time 19")
    rust.BroadcastChat("=TIME=", "Hour: 19:00")
end

function PLUGIN:cmdT( netuser, cmd, args )
	rust.RunServerCommand("env.time "..args[1])
end

function PLUGIN:cmdTime( netuser )
	local tme = Rust.EnvironmentControlCenter.Singleton:GetTime()
	rust.InventoryNotice( netuser, string.format("%.2f", tme))
end	

function PLUGIN:SendHelpText( netuser )
	rust.SendChatToUser( netuser, "/time | Displays current in game time.")
end
