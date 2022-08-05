-----------------------------------------------------------------------------------------
--
-- phase3_2.lua
-- 이밍 승천 연습 중간권
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- local physics = require( "physics" )

function scene:create( event )
	local sceneGroup = self.view

	physics.start()
	physics.setDrawMode( "hybrid" )


	-- 배경 --
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor(1)

	sceneGroup:insert(background)


	-- 기본 오브젝트 배치 --
	local menuGroup = display.newGroup()

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local guide = display.newImage("image/public/지천.png")
	guide.x, guide.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09


	-- 구름 오브젝트 배치 --
	local cloud = {}

	cloud[1] = display.newImage("image/game_ascension/phase3/중간권구름.png")
	cloud[1].x, cloud[1].y = 450, 600
	-- cloud[1]:scale(0.4, 0.4)

	cloud[2] = display.newImage("image/game_ascension/phase3/중간권구름.png")
	cloud[2].x, cloud[2].y = 200, 450
	-- cloud[2]:scale(0.4, 0.4)

	cloud[3] = display.newImage("image/game_ascension/phase3/중간권구름.png")
	cloud[3].x, cloud[3].y = 500, 350
	-- cloud[3]:scale(0.4, 0.4)

	cloud[4] = display.newImage("image/game_ascension/phase3/중간권구름.png")
	cloud[4].x, cloud[4].y = 800, 300
	-- cloud[4]:scale(0.4, 0.4)

	cloud[5] = display.newImage("image/game_ascension/phase3/중간권구름.png")
	cloud[5].x, cloud[5].y = 550, 200
	-- -- cloud[5]:scale(0.4, 0.4)

	
	-- 벽 설정 --
	local wall = {}

	wall[1] = display.newRect(0, background.y, 30, background.height)
	wall[2] = display.newRect(background.width, background.y, 30, background.height)
	wall[3] = display.newRect(background.x, 0, background.width, 30)
	wall[3].name = "up"
	wall[4] = display.newRect(background.x, background.height, background.width, 30)
	wall[4].name = "down"


	for i = 1, #cloud do 
		physics.addBody(cloud[i], "static")
		sceneGroup:insert(cloud[i])
	end

	for i = 1, #wall do
		physics.addBody(wall[i], "static")
		sceneGroup:insert(wall[i])
	end


	local arrow = {}

	arrow[1] = display.newImage("image/game_ascension/왼쪽이동.png")
	arrow[1].x, arrow[1].y = 1000, 600
	arrow[1]:scale(0.4, 0.4)
	arrow[1].name = "left"

	arrow[2] = display.newImage("image/game_ascension/점프.png")
	arrow[2].x, arrow[2].y = 150, 600
	arrow[2]:scale(0.4, 0.4)
	arrow[2].name = "jump"

	arrow[3] = display.newImage("image/game_ascension/오른쪽이동.png")
	arrow[3].x, arrow[3].y = 1160, 600
	arrow[3]:scale(0.4, 0.4)
	arrow[3].name = "right"

	arrow[4] = "right"


	local eming = display.newImageRect("image/game_ascension/이밍.png", 100, 100)
	eming.x, eming.y = 500, 540
	-- eming:scale(0.4, 0.4)

	local eming_outline_none = graphics.newOutline(1, "image/game_ascension/이밍.png")
	local eming_outline_flip = graphics.newOutline(1, "image/game_ascension/이밍.png")
	-- player.x, player.y = background.x, background.y+200
	eming.name = "eming"

	physics.addBody(eming, {friction=1, outline=eming_outline_none})
	eming.isFixedRotation = true 
	sceneGroup:insert(eming)

	function arrowTab( event )
		x = eming.x
		y = eming.y
		if (event.target.name == "jump") then
			if (arrow[4] == "left") then
				transition.to(eming, {time=100, x=(x-100), y=(y-100)})
			else
			    transition.to(eming, {time=100, x=(x+100), y=(y-100)})
			end
			
		else
			if (event.target.name == arrow[4]) then
			    if (event.target.name == "left") then
			       transition.to(eming, {time=100, x=(x-50)})
			    else
			       transition.to(eming, {time=100, x=(x+50)})
			    end
			 else
			    arrow[4] = event.target.name
			    eming:scale(-1, 1)
			    physics.removeBody(eming)

			    if (event.target.name == "left") then
			       physics.addBody(eming, {friction=1, outline=eming_outline_flip})
			       transition.to(eming, {time=100, x=(x-50)})
			    else
			       physics.addBody(eming, {friction=1, outline=eming_outline_none})
			       transition.to(eming, {time=100, x=(x+50)})
			    end
			    eming.isFixedRotation = true
				end
		end
	end

	for i = 1, 3 do
		arrow[i]:addEventListener("tap", arrowTab)
		sceneGroup:insert(arrow[i])
	end


	-- 벽 충돌 설정 --

	local flag = false
	
	function wallCollision(self, event)
		if(event.phase == "ended" and flag == false) then
			if(event.other.name == "up") then
				flag = true

				timer.performWithDelay(1, function()
										physics.removeBody(eming)

										for i = 1, #cloud do 
											physics.removeBody(cloud[i])
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										composer.gotoScene('game_ascension.phase4_1')
									end, 1)

			elseif(event.other.name == "down") then
				flag = true
				timer.performWithDelay(1, function()
										physics.removeBody(eming)

										for i = 1, #cloud do 
											physics.removeBody(cloud[i])
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										composer.gotoScene('game_ascension.phase3_1')
									end, 1)

			end
		end
	end

	eming.collision = wallCollision
	eming:addEventListener('collision')


	function set:tap( event )
		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

		composer.setVariable("phase", "phase3_2")
		composer.setVariable("eming", eming)
		composer.setVariable("wall", wall)
		composer.setVariable("cloud", cloud)

 		composer.showOverlay('game_ascension.ascension_setting', options)
 	end
 	set:addEventListener("tap", set)

 	function item:tap( event )
 		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

 		composer.showOverlay('items', options)
 	end
 	item:addEventListener("tap", item)

 	function guide:tap( event )
 		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

 		composer.showOverlay('game_ascension.ascension_info', options)
 	end
 	guide:addEventListener("tap", guide)

 	menuGroup:insert(set)
	menuGroup:insert(guide)
	menuGroup:insert(item)

	sceneGroup:insert(menuGroup)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)

		composer.removeScene('game_ascension.phase3_2')

	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene