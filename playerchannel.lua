
local function new(y, z)
	for a, b in z do
		y[a] = b
	end
	
	return y
end

local player = {}

function player.newchannel(client)
	local obj = {}
	
	obj.hierarchy = new(Instance.new("Folder"), {Name = "communicationchannel"; Parent = client})
	
	function obj.new(name, body)
		local obj2 = {["body"] = body; connection = nil}
		obj2.class = new(Instance.new("RemoteEvent"), {Name = name; Parent = obj.hierarchy})
		
		function obj2.listen()
			obj2.connection = obj2.class.OnServerEvent:Connect(obj2.body)
		end
		
		function obj2.ignore()
			if obj2.connection then obj2.connection:Disconnect() end
		end
		
		return obj2
	end
	
	return obj
end

return player
