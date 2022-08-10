-----------------------------------------------------------------------------------------
--
-- ascension_start.lua
-- 이밍 승천 게임 시작 페이지
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 --
	local explosionSound3 = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	
	local background = display.newImage("image/game_ascension/이밍창바탕.png")
	-- background.strokeWidth = 5
	-- background:setStrokeColor(0.5, 0.5, 0.5)
	background.x, background.y = display.contentCenterX, display.contentCenterY

	local startBtn = display.newImage("image/setting/2.png")
	startBtn.x, startBtn.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	function startBtn:tap( event )
		audio.play(explosionSound3)
 		composer.hideOverlay('fade', 400)
 	end
 	startBtn:addEventListener("tap", startBtn)

 	sceneGroup:insert(background)
 	sceneGroup:insert(startBtn)
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