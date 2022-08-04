-----------------------------------------------------------------------------------------
--
-- items.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/items/바탕.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY

	background.strokeWidth = 5
	background:setStrokeColor(0.5, 0.5, 0.5)

	local flower1 = display.newImage("image/items/꽃1.png")
	flower1.x, flower1.y = display.contentWidth * 0.405, display.contentHeight * 0.3

	local flower2 = display.newImage("image/items/꽃2.png")
	flower2.x, flower2.y = display.contentWidth * 0.405, display.contentHeight * 0.5

	local flower3 = display.newImage("image/items/꽃3.png")
	flower3.x, flower3.y = display.contentWidth * 0.405, display.contentHeight * 0.7

	local explain1 = display.newImage("image/items/설명1.png")
	explain1.x, explain1.y = display.contentWidth * 0.557, display.contentHeight * 0.3

	local explain2 = display.newImage("image/items/설명2.png")
	explain2.x, explain2.y = display.contentWidth * 0.557, display.contentHeight * 0.5

	local explain3 = display.newImage("image/items/설명3.png")
	explain3.x, explain3.y = display.contentWidth * 0.557, display.contentHeight * 0.7

	sceneGroup:insert(background)
	sceneGroup:insert(flower1)
	sceneGroup:insert(flower2)
	sceneGroup:insert(flower3)
	sceneGroup:insert(explain1)
	sceneGroup:insert(explain2)
	sceneGroup:insert(explain3)

	function background:tap( event )
		composer.hideOverlay( 'items' )
	end
	background:addEventListener("tap", background)

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