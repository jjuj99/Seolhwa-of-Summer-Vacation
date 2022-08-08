-----------------------------------------------------------------------------------------
--
-- start.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	--배경음악--

    local BGM = audio.loadSound("sound/00. 시작화면_춘천 그리고 가을(권민찬 외 10명).mp3")
	audio.play(BGM, {channel=1, loops=-1})
	
	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1})


	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")

	-- 오브젝트들 배치 --
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.91

	local logo = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.35, 450, 450)
	logo.fill = {
		type = "image",
		filename = "image/start/여름방학 설화.png"
	}
	local starting = display.newImage("image/start/시작하기.png")
	starting.x, starting.y = display.contentWidth * 0.5, display.contentHeight * 0.7

	--fade--

	local options =
	{ 
		effect = "fade",
    	time = 300
    }

	--layer 정리--

	sceneGroup:insert(background)
	sceneGroup:insert(set)
	sceneGroup:insert(logo)
	sceneGroup:insert(starting)

	--설정창--

	function set:tap( event )
		audio.play(click)
		local option = {
			isModal = true,
			effect = "fade",
			tiem = 400,
			params = {}
		}
 		composer.showOverlay('setting', options)
 	end
 	set:addEventListener("tap", set)

 	--시작하기--

 	function starting:tap( event )
 		audio.stop()
 		audio.dispose(BGM)
 		BGM = audio.loadSound("sound/01 수화산 설화_설화_20초.mp3")
	    audio.play(BGM, {channel=1, loops=-1})
 		composer.gotoScene('prologue', options)
 		composer.removeScene('start')
 	end
 	starting:addEventListener("tap", starting)

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