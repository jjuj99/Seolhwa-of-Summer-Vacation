-----------------------------------------------------------------------------------------
--
-- setting1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/setting/설정창 바탕.png")
	background.strokeWidth = 5
	background:setStrokeColor(0.5, 0.5, 0.5)
	background.x, background.y = display.contentCenterX, display.contentCenterY

	local replay = display.newImage("image/setting/2.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	local out = display.newImage("image/setting/4.png")
	out.x, out.y = display.contentWidth * 0.5, display.contentHeight * 0.7

	local sound = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, 100, 100)
	sound.alpha = 0
	sound.fill = {
		type = "image",
		filename = "image/setting/스피커2.png"
	}

	function sound:tap( event)
		if (index == 1) then
			sound.fill = {
				type = "image",
				filename = "image/setting/스피커2.png"
			}
			audio.setVolume(0.5, {channel=1})
			index = 2
		elseif (index == 2) then
			sound.fill = {
				type = "image",
				filename = "image/setting/스피커3.png"
			}
			audio.setVolume(1, {channel=1})
			index = 3
		elseif (index == 3) then
			sound.fill = {
				type = "image",
				filename = "image/setting/스피커1.png"
			}
			audio.setVolume(0, {channel=1})
			index = 1
		end
	end
	sound:addEventListener("tap", sound)

	function replay:tap( event )
 		composer.hideOverlay('setting2')
 	end
 	replay:addEventListener("tap", replay)

 	sceneGroup:insert(background)
 	sceneGroup:insert(replay)
 	sceneGroup:insert(sound)
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