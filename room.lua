--Camera 

Camera = {id = 0}

function Camera:new(id)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.id = id
	return o
end
