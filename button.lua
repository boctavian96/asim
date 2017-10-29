--Button
--Game button
Button = {name, x = 0, y = 0, height = 0, width = 0}
Button.__index = Button
--Constructor 

function Button:new(o, name, x, y, height, width)
	local self = {}
	setmetatable(self, Button)
	self.__index = self
	self.name = name
	self.x = x
	self.y = y
	self.height = height
	self.width = width
	print "Am instantiat Butonul"
	return self
end

function Button:drawButton()
	print("Printez "..self.name)
	love.graphics.setColor(150, 100, 20)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(self.name, self.x + 15, self.y + 15)
end

function Button:update(mouse_x, mouse_y, oldmousedown)
	
	if mouse_x > self.x and mouse_x < self.x + self.width then
		--print "first"
		if mouse_y > self.y and mouse_y < self.y + self.height then
			love.graphics.setColor(255, 0, 0)
			--print "second"
			if love.mouse.isDown(1) and not oldmousedown then 
				--Do something
				love.graphics.setColor(255, 255, 255)
				print "WORKS !!!"
				
				if(self.name == "Party" and pS.money > 0 and pS.energy > 0) then
					pS.happiness = pS.happiness + pS.moneylvl
					pS.energy = pS.energy - 5
					pS.money = pS.money - 2
				end
				
				if (self.name == "Work" and pS.energy > 0 and pS.happiness > 0) then 
					pS.happiness = pS.happiness - 8
					pS.energy = pS.energy - 5
					pS.money = pS.money + pS.moneylvl
					pS.skill = pS.skill + 0.001
				end
				
				if (self.name == "Sleep" and pS.energy < 100) then 
					pS.energy = pS.energy + pS.energylvl + 2
					pS.happiness = pS.happiness + pS.happinesslvl - 4
				end
				
				if(self.name == "Learn" and pS.energy > 0) then 
					pS.energy = pS.energy - 10
					pS.skill = pS.skill+ 0.010
				end
				
				if(self.name == "Make Sandwich" and pS.energy > 0 and pS.money > 0) then
					pS.money = pS.money - 2
					pS.energy = pS.energy - 1 
					pS.skill = pS.skill + 0.010
					pS.happiness = pS.happiness + pS.happinesslvl
				end
				
				if(self.name == "LEVEL UP" and pS.skill >= 100) then 
					pS.level = pS.level + 1
					pS.skill = 0
				end
				
				if(self.name == "Play Games" and pS.energy > 0) then 
					pS.happiness = pS.happiness + 20
					pS.energy = pS.energy - 10
					pS.skill = pS.skill + 0.001
				end
				
				if(self.name == "Hail Pepe" and pS.energy > 50) then 
					pS.skill = pS.skill + 1
				end
				
				if(self.name == "Investeste" and pS.money > 0 and pS.energy > 80) then 
					pS.money = pS.money + (pS.money * 10) / 100
					pS.energy = 0
				end
				
				if(self.name == "Mergi la Cinema" and pS.money >= 20 and pS.energy > 40) then
					pS.money = pS.money - 20
					pS.happiness = pS.happiness + 10
				end
				
				if (self.name == "Cudle Tavee" and pS.energy > 5 )then 
					pS.energy = pS.energy - 5
					pS.happiness = pS.happiness + 10
				end
				
				if (self.name == "Learn Math" and pS.energy > 20) then 
					pS.energy = pS.energy - 20
					pS.skill = pS.skill + 0.5
				end
				
				if (self.name == "Make Games" and pS.energy > 20 and pS.happiness > 40)then
					pS.energy = pS.energy - 40
					pS.money = pS.money + 100
					pS.happiness = pS.happiness - 10
				end
				
				if (self.name == "Go in a trip" and pS.money > 100 and pS.energy > 90 ) then
					pS.money = pS.money - 100
					pS.energy = 0
					pS.happiness = pS.happiness + 100
				end
			end
		end
	end
end
