-----------------------------------------------------------------------------------------
--
-- ascension_setting.lua
-- 이밍 승천 게임 설정
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	physics.start()
	
	local background = display.newImage("image/setting/설정창 바탕.png")
	background.strokeWidth = 5
	background:setStrokeColor(0.5, 0.5, 0.5)
	background.x, background.y = display.contentCenterX, display.contentCenterY

	local replay = display.newImage("image/setting/2.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	local detail = display.newImage("image/setting/3.png")
	detail.x, detail.y = display.contentWidth * 0.5, display.contentHeight * 0.5

	local out = display.newImage("image/setting/4.png")
	out.x, out.y = display.contentWidth * 0.5, display.contentHeight * 0.7

	local sound1 = display.newRect(display.contentWidth * 0.4, display.contentHeight * 0.5, 50, 50)
	sound1.alpha = 0
	sound1.fill = {
		type = "image",
		filename = "image/setting/스피커1.png"
	}

	local sound2 = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, 50, 50)
	sound2.alpha = 0
	sound2.fill = {
		type = "image",
		filename = "image/setting/스피커2.png"
	}

	local sound3 = display.newRect(display.contentWidth * 0.6, display.contentHeight * 0.5, 50, 50)
	sound3.alpha = 0
	sound3.fill = {
		type = "image",
		filename = "image/setting/스피커3.png"
	}


	function detail:tap( event )
		detail.alpha = 0
		sound1.alpha = 1
		sound2.alpha = 1
		sound3.alpha = 1
	end
	detail:addEventListener("tap", detail)


	function sound1:tap ( event )
		audio.setVolume(0, {channel=1})
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.setVolume(0.5, {channel=1})
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.setVolume(1, {channel=1})
	end
	sound3:addEventListener("tap", sound3)

	-- local index = 2 --나가서 다시 설정 들어오면 이미지가 바뀜--
	-- function sound:tap( event)
	-- 	if (index == 1) then
	-- 		sound.fill = {
	-- 			type = "image",
	-- 			filename = "image/setting/스피커2.png"
	-- 		}
	-- 		audio.setVolume(0.5, {channel=1})
	-- 		index = 2
	-- 	elseif (index == 2) then
	-- 		sound.fill = {
	-- 			type = "image",
	-- 			filename = "image/setting/스피커3.png"
	-- 		}
	-- 		audio.setVolume(1, {channel=1})
	-- 		index = 3
	-- 	elseif (index == 3) then
	-- 		sound.fill = {
	-- 			type = "image",
	-- 			filename = "image/setting/스피커1.png"
	-- 		}
	-- 		audio.setVolume(0, {channel=1})
	-- 		index = 1
	-- 	end
	-- end
	-- sound:addEventListener("tap", sound)

	function replay:tap( event )
 		-- composer.hideOverlay('fade', 400)
 		local phase = composer.getVariable("phase")

 		local eming = composer.getVariable("eming")
 		local save = composer.getVariable("save")
 		local wall = composer.getVariable("wall")
 		local cloud = composer.getVariable("cloud")


 	-- 	physics.removeBody(eming)
 	-- 	physics.removeBody(ground)
		-- for i = 1, #cloud do 
		-- 	physics.removeBody(cloud[i])
		-- end
		-- for i = 1, #wall do
		-- 	physics.removeBody(wall[i])
		-- end

		timer.performWithDelay(1, function()
										if save ~= nil then
											physics.removeBody(save)
										end

										physics.removeBody(eming)

										if cloud ~= nil then
											for i = 1, #cloud do 
												physics.removeBody(cloud[i])
											end
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										composer.removeScene('game_ascension.' .. phase, true)
 										composer.gotoScene('game_ascension.phase1_1')
									end, 1)





 		-- composer.removeScene('game_ascension.' .. phase, true)
 		-- composer.gotoScene('game_ascension.phase1_1')
 	end
 	replay:addEventListener("tap", replay)

 	sceneGroup:insert(background)
 	sceneGroup:insert(replay)
 	sceneGroup:insert(detail)
 	sceneGroup:insert(sound1)
 	sceneGroup:insert(sound2)
 	sceneGroup:insert(sound3)
 	sceneGroup:insert(out)
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