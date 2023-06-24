-----------------------------------------------------------------------------------------
--
-- ascension_clear.lua
-- 이밍 승천 게임 클리어 페이지
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	

	-- 배경 > 탭하면 다음 화며으로 --
	local background = display.newImage("image/game_ascension/성공.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY


	function background:tap( event )
		audio.play(click)

		local eming = composer.getVariable("eming")
 		local save = composer.getVariable("save")
 		local wall = composer.getVariable("wall")

 		timer.performWithDelay(1, function()
 										-- 물리엔진 삭제 --
										physics.removeBody(save)
										physics.removeBody(eming)

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										-- 브금 변경 --
										audio.stop()
										audio.dispose(explosionSound)
										BGM = audio.loadSound("sound/08. 이밍 성공 후_Fly With Me.mp3")
										audio.play(BGM, {channel=1, loops=-1})

										-- 다음화면으로 넘어가기 --
										composer.removeScene("game_ascension.phase_clear")
 										composer.gotoScene("scenario7")
									end, 1)
 	end
 	background:addEventListener("tap", background)


 	-- 레이어 정리 --
 	sceneGroup:insert(background)
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