

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect("image/simlang_image/실패.png",700,400)
 	background.x,background.y=display.contentWidth/2, display.contentHeight/2

 	local text = display.newImage("image/simlang_image/다시하기.png")
 	text.x,text.y=display.contentWidth/2, display.contentHeight*0.64

 	function text:tap( event )
		background.alpha=0
		composer.removeScene('game_simlang.level3')
		composer.hideOverlay('fade', 400)
		--composer.hideOverlay('game_simlang.fail21')
        composer.gotoScene('game_simlang.level1')
		
		
 	end
 	text:addEventListener("tap", text)

 	sceneGroup:insert(background)
 	sceneGroup:insert(text)

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
		composer.hideOverlay('game_simlang.fail21')
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