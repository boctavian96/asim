---Main file
require("button")
require("PlayerScore")
	
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	
	butoane = {}
	
	GameState = 1


function love.load()

	loadAssets()
	
end;


function love.update(dt)
	
	updateGame()
	
end;


function love.draw()

	drawGame()
	
end;


function loadAssets()

	imgz = "images/img.png"
	img_sleep = "images/work.png"
	img_party = "images/party.png"

	if love.filesystem.exists("Save.lua", pS) and 1==2 then
		m = file.io("Save.lua")
	else
		pS = PlayerScore:new(nil, 50, 100, 20, 10)
	end
	
	button_party = Button:new(nil, "Party", 500, 500, 50, 150)
	button_work = Button:new(nil, "Work", 500, 300, 50, 150)
	button_sleep = Button:new(nil, "Sleep", 500, 400, 50, 150)
	button_learn = Button:new(nil, "Learn", 500, 200, 50, 150)
	button_make_sandwich = Button:new(nil, "Make Sandwich", 500, 100, 50, 150)
	
	button_level_up = Button:new(nil, "LEVEL UP", 200, 500, 50, 150)
	
	table.insert(butoane, button_party)
	table.insert(butoane, button_work)
	table.insert(butoane, button_sleep)
	table.insert(butoane, button_learn)
	table.insert(butoane, button_make_sandwich)
	
	butoane_room2 = {} 
	
	table.insert(butoane_room2, Button:new(nil, "Play Games", 200, 100, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Hail Pepe", 200, 200, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Investeste", 200, 300, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Mergi la Cinema", 200, 400, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Cudle Tavee", 400, 100, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Learn Math", 400, 200, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Make Games", 400, 300, 50, 150))
	table.insert(butoane_room2, Button:new(nil, "Go in a trip", 400, 400, 50, 150))
	
end

function updateGame()

	keyboard()
	pS:update()

	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	
	if (GameState == 1) then
		for i=1, #butoane do 
			butoane[i]:update(mouse_x, mouse_y, oldmousedown)
		end
	else 
		for i=1, #butoane_room2 do 
			butoane_room2[i]:update(mouse_x, mouse_y, oldmousedown)
		end
	end
	
	
	
	button_level_up:update(mouse_x, mouse_y, oldmousedown)
	
	oldmousedown = love.mouse.isDown(1)


end

function drawGame()
	
		
	pS:drawScore(50, 50)
	
	if GameState == 1 then 
	
		for i=1, #butoane do
			butoane[i]:drawButton()
		end
		
		if pS.skill >= 100 then 
			button_level_up:drawButton()
		end
		
	else 
	
		for i=1, #butoane_room2 do 
			butoane_room2[i]:drawButton()
		end
		
	end
	 
	
	
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("Mouse X : "..mouse_x, 100, 0)
	love.graphics.print("Mouse Y : "..mouse_y, 300, 0)

end

function keyboard()
	
	if love.keyboard.isDown("escape") then 
		local t = {}
		table.insert(t, tostring(pS.money))
		table.insert(t, tostring(pS.happiness))
		table.insert(t, tostring(pS.energy))
		table.insert(t, tostring(pS.skill))
		
	--SaveGame
	  love.filesystem.write( "Save.lua", tostring(t))
	
		love.event.quit()
	end
	
	if love.keyboard.isDown("r") then 
		pS = PlayerScore:new(nil, 50, 100, 20, 10)
	end
	
	if love.keyboard.isDown("s") then 
		pS.skill = 99.99
	end
	
	if love.keyboard.isDown("right") then 
		GameState = 2
	end
	
	if love.keyboard.isDown("left") then 
		GameState = 1
	end

end