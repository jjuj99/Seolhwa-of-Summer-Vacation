
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	
    local back = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2, 700,500,10)
	back:setFillColor(0.5, 0.5, 0.2)

	local textStart= display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.4, 500,300,10)
	textStart:setFillColor(0.5, 0.4, 0.4)

	local textStart2 = display.newText("게임 플레이 방법", display.contentWidth/2, display.contentHeight*0.24)
	textStart2.size = 30

	local button = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.69, 500,100,10)
	button:setFillColor(0.5, 0.4, 0.4)


 	local text = display.newText("시작하기", display.contentWidth/2, display.contentHeight*0.69)
 	text.size = 30

	function button:tap( event )
		local timeAttack = composer.getVariable("timeAttack1")
        timer.resume(timeAttack)
		composer.hideOverlay('game_simlang.start')
	end
	button:addEventListener("tap", button)

	sceneGroup:insert(back)
	sceneGroup:insert(textStart)
	sceneGroup:insert(textStart2)
	sceneGroup:insert(button)
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