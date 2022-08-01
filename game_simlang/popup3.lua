

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local board = display.newImageRect("image/simlang_image/보드.png",500,300)
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.5

    local title = display.newText("게임 클리어/꽃 획득 성공!", display.contentWidth/2, display.contentHeight*0.33)
 	title.size = 30
    title:setFillColor(0)

    local object1 = display.newImageRect("image/public/꽃3.png",150,150)
	object1.x,object1.y= display.contentWidth*0.38, display.contentHeight*0.5

    local object2 = display.newImageRect("image/public/설명3.png",300,150)
	object2.x,object2.y= display.contentWidth*0.56, display.contentHeight*0.5

	local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button1.x,button1.y=864,235

 	sceneGroup:insert(board)
    sceneGroup:insert(title)
    sceneGroup:insert(object1)
    sceneGroup:insert(object2)
	sceneGroup:insert(button1)

	function button1:tap( event )
		local timeAttack = composer.getVariable("timeAttack")
        timer.resume(timeAttack)
		composer.hideOverlay('game_simlang.setting')
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
		composer.removeScene('fail')
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