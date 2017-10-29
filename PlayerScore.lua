--Scores
PlayerScore = {money = 0, energy = 0, skill = 0, happiness = 0, level = 1}
PlayerScore.__index = PlayerScore

--Constructor

function PlayerScore:new(o, money, energy, skill, happiness)
	local self = {}
	setmetatable(self, PlayerScore)
	self.money = money
	self.energy = energy
	self.skill = skill
	self.happiness = happiness
	self.level = 1
	
	self.moneylvl = 5 * self.level
	self.energylvl = 5 * self.level
	self.happinesslvl = 8 * self.level
	return self
end

function PlayerScore:update()

	if self.money < 0 then 
		self.money = 0
	end

	if self.energy > 100 then
		self.energy = 100
	end
	
	if self.energy < 0 then 
		self.energy = 0
	end
	
	if self.happiness > 300 then 
		self.happiness = 300
	end	
	
	if self.happiness < 0 then 
		self.happiness = 0
	end
	
	if self.skill > 100 then 
		self.skill = 100
	end
end

function PlayerScore:statusBar(x)
	return x*0.5 --WIDTH
end

function PlayerScore:drawScore(x, y)
	--RGB
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Money : $ "..self.money, x, y)
	
	love.graphics.print("Energy : "..self.energy, x, y + 20)
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", x, y + 35, self.energy * 0.5, 5)
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Skill : "..self.skill, x, y + 50)
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("fill", x, y + 65, self.skill * 0.5, 5)
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Happiness : "..self.happiness, x, y + 80)
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", x, y + 95, self.happiness * 0.5, 5 )
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Level : "..self.level, x, y + 110)
end