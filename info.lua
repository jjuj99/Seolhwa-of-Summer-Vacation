-----------------------------------------------------------------------------------------
--
-- info.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/jichuns/바탕.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY

	background.strokeWidth = 5
	background:setStrokeColor(0.5, 0.5, 0.5)

	local storyInfo = display.newImage("image/jichuns/1.png")
	storyInfo.x, storyInfo.y = display.contentWidth * 0.5, display.contentHeight * 0.335

	local gameInfo = display.newImage("image/jichuns/2.png")
	gameInfo.x, gameInfo.y = display.contentWidth * 0.5, display.contentHeight * 0.665

	function background:tap( event )
		composer.hideOverlay( 'info' )
	end
	background:addEventListener("tap", background)

	sceneGroup:insert(background)
	sceneGroup:insert(storyInfo)
	sceneGroup:insert(gameInfo)

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