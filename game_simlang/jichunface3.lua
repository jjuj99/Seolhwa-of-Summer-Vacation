

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

    local set = display.newImageRect("image/public/지천바탕.png",400,600)
    set.x,set.y= display.contentWidth/2, display.contentHeight/2

    local buttonNum1 = display.newImageRect("image/public/지천버튼1.png",355,260)
    buttonNum1.x,buttonNum1.y=640,220

    local buttonNum2 = display.newImageRect("image/public/지천버튼2.png",355,260)
    buttonNum2.x,buttonNum2.y=640,500

	local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button1.x,button1.y=820,80

   
    sceneGroup:insert(set)
    sceneGroup:insert(buttonNum1)
    sceneGroup:insert(buttonNum2)
	sceneGroup:insert(button1)

    function button1:tap( event )
		local timeAttack = composer.getVariable("timeAttack2")
        timer.resume(timeAttack)
		composer.hideOverlay('game_simlang.jichunface3')
	end
	button1:addEventListener("tap", button1)

 


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