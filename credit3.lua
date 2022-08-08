-----------------------------------------------------------------------------------------
--
-- credit.lua 크레딧
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	-- 배경음악--
	local BGM = audio.loadSound("sound/15. 스크롤_A new start.mp3")
	audio.play(BGM, {channel=1, loops=-1})

	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1})
	
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor(0)

	local dp1 = display.newText("*엔딩", display.contentWidth/2, display.contentHeight * 0.3, "font/경기천년바탕_Regular.ttf")
 	dp1.size = 17

 	local m1 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.33, "font/경기천년바탕_Regular.ttf")
 	m1.size = 17

 	local dp2 = display.newText("♬ Track: A new start - https://youtu.be/2JlSirdn_zo", display.contentWidth/2, display.contentHeight * 0.37, "font/경기천년바탕_Regular.ttf")
 	dp2.size = 17

 	local m2 = display.newText("*에필로그", display.contentWidth/2, display.contentHeight * 0.4, "font/경기천년바탕_Regular.ttf")
 	m2.size = 17

 	local m3 = display.newText("♬ 폴링 스타즈 인 더 이스트(Falling Stars In The East), 김정식 (저작물 29 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.43, "font/경기천년바탕_Regular.ttf")
 	m3.size = 17

 	local dp3 = display.newText("*미니게임", display.contentWidth/2, display.contentHeight * 0.47, "font/경기천년바탕_Regular.ttf")
 	dp3.size = 17

 	local m4 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.5, "font/경기천년바탕_Regular.ttf")
 	m4.size = 17

 	local m5 = display.newText("♬ Track: Over the hill - https://youtu.be/oN-LAguSjSU", display.contentWidth/2, display.contentHeight * 0.53, "font/경기천년바탕_Regular.ttf")
 	m5.size = 17

 	local m6 = display.newText("*아이템 획득 소리", display.contentWidth/2, display.contentHeight * 0.56, "font/경기천년바탕_Regular.ttf")
 	m6.size = 17

 	local m7 = display.newText("♬ 코드39, 김용배 (저작물 3000 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.6, "font/경기천년바탕_Regular.ttf")
 	m6.size = 17

 	local dp4 = display.newText("일반버튼 누르는 소리", display.contentWidth/2, display.contentHeight * 0.64, "font/경기천년바탕_Regular.ttf")
 	dp3.size = 17

 	local m8 = display.newText("♬ 스위치_랜턴_버튼, 한국저작권위원회 (저작물 44198 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.67, "font/경기천년바탕_Regular.ttf")
 	m4.size = 17

 	local m9 = display.newText("*미니게임 안 버튼 누르는 소리", display.contentWidth/2, display.contentHeight * 0.7, "font/경기천년바탕_Regular.ttf")
 	m8.size = 17

 	local m10 = display.newText("♬ 카툰코드음14, 김용배 (저작물 3000 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.73, "font/경기천년바탕_Regular.ttf")
 	m9.size = 17

 	--fade--
	local options =
	{ 
		effect = "crossFade",
    	time = 500
    }

 	--다음 장면--
	local function tap(event)
		audio.stop()
		audio.dispose(BGM)
		BGM = audio.loadSound("sound/01-a 수화산 설화_설화_10초.mp3")
		audio.play(BGM, {channel=1, loops=-1})
		composer.gotoScene('epilogue', options)
	end
	background:addEventListener("tap", tap)

	--layer 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(dp1)
	sceneGroup:insert(dp2)
	sceneGroup:insert(dp3)
	sceneGroup:insert(dp4)
	sceneGroup:insert(m1)
	sceneGroup:insert(m2)
	sceneGroup:insert(m3)
	sceneGroup:insert(m4)
	sceneGroup:insert(m5)
	sceneGroup:insert(m6)
	sceneGroup:insert(m7)
	sceneGroup:insert(m8)
	sceneGroup:insert(m9)
	sceneGroup:insert(m10)
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