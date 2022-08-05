

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2, 700,400, 45)
 	background:setFillColor(0.6, 0.5, 0.5)

 	local title = display.newText("Fail", display.contentWidth/2, display.contentHeight*0.3)
 	title.size = 60

    local button1 = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.64, 700,200,10)
 	button1:setFillColor(0.5, 0.5, 0.2)

 	local text = display.newText("다시하기", display.contentWidth/2, display.contentHeight*0.64)
 	text.size = 30

 	function button1:tap( event )
		--composer.removeScene('game_simlang.fail2')
		composer.hideOverlay('game_simlang.fail3')
        composer.gotoScene('game_simlang.level1')
		composer.removeScene('game_simlang.level3')
 	end
 	button1:addEventListener("tap", button1)

 	sceneGroup:insert(background)
 	sceneGroup:insert(title)
     sceneGroup:insert(button1)
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
		composer.hideOverlay('game_simlang.fail3')
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