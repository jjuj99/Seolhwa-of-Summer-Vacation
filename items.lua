-----------------------------------------------------------------------------------------
--
-- items.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

    click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	
	local background = display.newImage("image/setting/설정창바탕.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY

	local txt = display.newText("획득한 아이템이 없습니다.", display.contentWidth * 0.5, display.contentHeight * 0.5, "font/경기천년바탕_Regular.ttf")
	txt.size = 25
	txt:setFillColor(0)

	local x = display.newImage("image/setting/X.png")
	x.x, x.y = display.contentWidth * 0.645, display.contentHeight * 0.17

	sceneGroup:insert(background)
	sceneGroup:insert(x)
	sceneGroup:insert(txt)

	function x:tap( event )
        local timeAttack = composer.getVariable("timeAttack")
        timer.resume(timeAttack)

		audio.play(click)
		composer.hideOverlay( 'fade', 400)
	end
	x:addEventListener("tap", x)

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