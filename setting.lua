-----------------------------------------------------------------------------------------
--
-- setting.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	
	local background = display.newImage("image/setting/설정창바탕.png")
	background.strokeWidth = 5
	background:setStrokeColor(0.5, 0.5, 0.5)
	background.x, background.y = display.contentCenterX, display.contentCenterY

	local replay = display.newImage("image/setting/다시하기1.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	local detail = display.newImage("image/setting/세부설정1.png")
	detail.x, detail.y = display.contentWidth * 0.5, display.contentHeight * 0.5

	local out = display.newImage("image/setting/나가기1.png")
	out.x, out.y = display.contentWidth * 0.5, display.contentHeight * 0.7

	local sound1 = display.newRect(display.contentWidth * 0.4, display.contentHeight * 0.5, 50, 50)
	sound1.alpha = 0
	sound1.fill = {
		type = "image",
		filename = "image/setting/스피커1.png"
	}

	local sound2 = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, 50, 50)
	sound2.alpha = 0
	sound2.fill = {
		type = "image",
		filename = "image/setting/스피커2.png"
	}

	local sound3 = display.newRect(display.contentWidth * 0.6, display.contentHeight * 0.5, 50, 50)
	sound3.alpha = 0
	sound3.fill = {
		type = "image",
		filename = "image/setting/스피커3.png"
	}

	function detail:tap( event )
		audio.play(click)
		detail.alpha = 0
		sound1.alpha = 1
		sound2.alpha = 1
		sound3.alpha = 1
		-- replay.fill = {
		-- 	type = "image",
		-- 	filename = "image/setting/2클릭.png"
		-- }
		-- detail.fill = {
		-- 	type = "image",
		-- 	filename = "image/setting/4클릭.png"
		-- }
	end
	detail:addEventListener("tap", detail)

	function sound1:tap ( event )
		audio.play(click)
		audio.setVolume(0, {channel=1})
		audio.setVolume(0, click)
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.play(click)
		audio.setVolume(0.5, {channel=1})
		audio.setVolume(0.4, click)
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.play(click)
		audio.setVolume(1, {channel=1})
		audio.setVolume(1, click)
	end
	sound3:addEventListener("tap", sound3)

	function replay:tap( event )
		audio.play(click)
 		composer.hideOverlay('fade', 400)
 	end
 	replay:addEventListener("tap", replay)

 	sceneGroup:insert(background)
 	sceneGroup:insert(replay)
 	sceneGroup:insert(detail)
 	sceneGroup:insert(sound1)
 	sceneGroup:insert(sound2)
 	sceneGroup:insert(sound3)
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