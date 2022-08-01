

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

    local set = display.newImageRect("image/public/설정창.png",400,600)
    set.x,set.y= display.contentWidth/2, display.contentHeight/2

    local buttonNum2 = display.newImageRect("image/public/다시하기.png",370,100)
    buttonNum2.x,buttonNum2.y=640,295

    local buttonNum3 = display.newImageRect("image/public/세부설정.png",370,100)
    buttonNum3.x,buttonNum3.y=640,420

    local buttonNum4 = display.newImageRect("image/public/나가기.png",370,100)
    buttonNum4.x,buttonNum4.y=640,545

	local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button1.x,button1.y=800,91
    sceneGroup:insert(set)
    sceneGroup:insert(buttonNum2)
    sceneGroup:insert(buttonNum3)
    sceneGroup:insert(buttonNum4)
	sceneGroup:insert(button1)

    function buttonNum2:tap( event )
		composer.removeScene('game_simlang.level1')
		composer.hideOverlay('game_simlang.setting')
		composer.gotoScene('game_simlang.level1')
	end
	buttonNum2:addEventListener("tap", buttonNum2)

    function buttonNum3:tap( event )
	end
	buttonNum3:addEventListener("tap", buttonNum3)

    function buttonNum4:tap( event )
		composer.removeScene('game_simlang.setting')
	end
	buttonNum4:addEventListener("tap", buttonNum4)

	function button1:tap( event )
		local timeAttack = composer.getVariable("timeAttack")
        timer.resume(timeAttack)
		composer.hideOverlay('game_simlang.setting')
	end
	button1:addEventListener("tap", button1)



	-- local timeAttack = composer.getVariable("timeAttack")
    --     timer.resume(timeAttack)
 	-- 	composer.hideOverlay('setting')
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