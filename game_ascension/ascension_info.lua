-----------------------------------------------------------------------------------------
--
-- ascension_info.lua
-- 이밍 승천 게임 소개(지천 얼굴 클릭시)
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	

	-- X 버튼 --
	local x = display.newImage("image/public/X.png")
	x.x, x.y = display.contentWidth * 0.645, display.contentHeight * 0.2


	-- 게임 설명 이미지 --
	local info = display.newImage("image/game_ascension/승천연습 설명.png")
	info.x, info.y = display.contentWidth * 0.5, display.contentHeight * 0.5


	-- X 누르면 창 닫는 함수 --
	function x:tap( event )
		audio.play(click)
		composer.hideOverlay('fade', 400)
	end
	x:addEventListener("tap", x)


	-- 레이어 정리 --
	sceneGroup:insert(info)
	sceneGroup:insert(x)

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