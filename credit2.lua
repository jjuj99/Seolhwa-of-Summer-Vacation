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

	local dp1 = display.newText("*거구귀 미니게임 터치", display.contentWidth/2, display.contentHeight * 0.1, "font/경기천년바탕_Regular.ttf")
 	dp1.size = 17

 	local m1 = display.newText("♬ Jab Sounds | Free Sound Effects | Sound Clips | Sound Bites (soundbible.com)", display.contentWidth/2, display.contentHeight * 0.13, "font/경기천년바탕_Regular.ttf")
 	m1.size = 17

 	local dp2 = display.newText("*수화산 중심", display.contentWidth/2, display.contentHeight * 0.17, "font/경기천년바탕_Regular.ttf")
 	dp2.size = 17

 	local m2 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.2, "font/경기천년바탕_Regular.ttf")
 	m2.size = 17

 	local m3 = display.newText("♬ Track: Endless - https://youtu.be/gmGxgzGQ56g", display.contentWidth/2, display.contentHeight * 0.23, "font/경기천년바탕_Regular.ttf")
 	m3.size = 17

 	local dp3 = display.newText("*수화 동굴", display.contentWidth/2, display.contentHeight * 0.27, "font/경기천년바탕_Regular.ttf")
 	dp3.size = 17

 	local m4 = display.newText("♬ 동굴 안에서 들리는 저음 소리, 한국저작권위원회 (저작물 44198 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.3, "font/경기천년바탕_Regular.ttf")
 	m4.size = 17

 	local m5 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.33, "font/경기천년바탕_Regular.ttf")
 	m5.size = 17

 	local m6 = display.newText("♬ Track: Lucky day - https://youtu.be/qoMgCok-pqg", display.contentWidth/2, display.contentHeight * 0.36, "font/경기천년바탕_Regular.ttf")
 	m6.size = 17

 	local m7 = display.newText("♬ Fly With Me, 김성원 (저작물 50 건), 한국저작권위원회, 자유이용", display.contentWidth/2, display.contentHeight * 0.4, "font/경기천년바탕_Regular.ttf")
 	m6.size = 17

 	local dp4 = display.newText("*수화 연못", display.contentWidth/2, display.contentHeight * 0.44, "font/경기천년바탕_Regular.ttf")
 	dp3.size = 17

 	local m8 = display.newText("♬ Day Dream, 김정식 (저작물 29 건) 김민기 (저작물 10 건) 계한용 (저작물 13 건) 황명수 (저작물 1 건), 한국저작권위원회, 자유이용", display.contentWidth/2, display.contentHeight * 0.47, "font/경기천년바탕_Regular.ttf")
 	m4.size = 17

 	local m9 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.5, "font/경기천년바탕_Regular.ttf")
 	m8.size = 17

 	local m10 = display.newText("♬ Track: My home - https://youtu.be/2jeKqX3AY6w", display.contentWidth/2, display.contentHeight * 0.53, "font/경기천년바탕_Regular.ttf")
 	m9.size = 17

 	local dp5 = display.newText("*수화산 정상", display.contentWidth/2, display.contentHeight * 0.57, "font/경기천년바탕_Regular.ttf")
 	dp5.size = 17

 	local m11 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.6, "font/경기천년바탕_Regular.ttf")
 	m10.size = 17

 	local m12 = display.newText("♬ Track: Good hair day - https://youtu.be/EEMBkpgNoX0", display.contentWidth/2, display.contentHeight * 0.63, "font/경기천년바탕_Regular.ttf")
 	m11.size = 17

 	local m13 = display.newText("♬ Boy meets Girl, 윤제휘 (저작물 30 건), 한국저작권위원회, 자유이용", display.contentWidth/2, display.contentHeight * 0.66, "font/경기천년바탕_Regular.ttf")
 	m12.size = 17

 	local dp6 = display.newText("*퇴산", display.contentWidth/2, display.contentHeight * 0.7, "font/경기천년바탕_Regular.ttf")
 	dp6.size = 17

 	local m14 = display.newText("♬ 겨울 폭풍 소리와 윙윙거리는 바람 소리, 한국저작권위원회 (저작물 44198 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.73, "font/경기천년바탕_Regular.ttf")
 	m13.size = 17

 	local dp7 = display.newText("*수화산 없는 마을", display.contentWidth/2, display.contentHeight * 0.77, "font/경기천년바탕_Regular.ttf")
 	dp7.size = 17

 	local m15 = display.newText("♬ Music provided by 브금저장소 [BGM Storage]", display.contentWidth/2, display.contentHeight * 0.80, "font/경기천년바탕_Regular.ttf")
 	m14.size = 17

 	local m16 = display.newText("♬ Track: 봄소풍 - https://youtu.be/JBRVbTeIPU4", display.contentWidth/2, display.contentHeight * 0.83, "font/경기천년바탕_Regular.ttf")
 	m15.size = 17

 	--fade--
	local options =
	{ 
		effect = "crossFade",
    	time = 500
    }

 	--다음 장면--
	local function tap(event)
		composer.gotoScene('credit3', options)
	end
	background:addEventListener("tap", tap)

	--layer 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(dp1)
	sceneGroup:insert(dp2)
	sceneGroup:insert(dp3)
	sceneGroup:insert(dp4)
	sceneGroup:insert(dp5)
	sceneGroup:insert(dp6)
	sceneGroup:insert(dp7)
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
	sceneGroup:insert(m11)
	sceneGroup:insert(m12)
	sceneGroup:insert(m13)
	sceneGroup:insert(m14)
	sceneGroup:insert(m15)
	sceneGroup:insert(m16)
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