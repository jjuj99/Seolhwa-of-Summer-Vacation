-----------------------------------------------------------------------------------------
--
-- saying_start.lua
-- 
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 --
	local touch = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")

	-- 배경 --
	local background = display.newImage("image/saying_game/속뜻의 지혜_시작버튼X.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY

	-- 시작 버튼 --
	local start = display.newImage("image/saying_game/시작버튼.png")
	start.x, start.y = display.contentWidth * 0.5, display.contentHeight * 0.77

	
	-- 시작 버튼 클릭시 --

	function start:tap( event )
		audio.play(touch)
 		composer.hideOverlay('fade', 400)
 	end
 	start:addEventListener("tap", start)


 	-- 레이어 정리 --

 	sceneGroup:insert(background)
 	sceneGroup:insert(start)
 	
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