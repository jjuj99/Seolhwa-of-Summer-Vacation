-----------------------------------------------------------------------------------------
--
-- ending2.lua 처음으로 돌아가기, 끝내기
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background.fill = {
		type = "image",
		filename = "image/background/엔딩화면.jpg"
	}

	local replay = display.newImage("image/end/처음으로 돌아가기_클릭전.png")
	replay.x, replay.y = display.contentWidth * 0.25, display.contentHeight * 0.2

	local out = display.newImage("image/end/끝내기_클릭전.png")
	out.x, out.y = display.contentWidth * 0.25, display.contentHeight * 0.35

	local options =
	{ 
		effect = "crossFade",
    	time = 500
    }

	function replay:tap( event )
 		composer.gotoScene('start', options)
 	end
 	replay:addEventListener("tap", replay)

 	function out:tap( event )
 		composer.gotoScene('exit', 'fade', 400)
 	end
 	out:addEventListener("tap", out)

 	sceneGroup:insert(background)
 	sceneGroup:insert(replay)
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