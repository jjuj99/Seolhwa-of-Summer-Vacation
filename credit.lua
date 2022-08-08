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

	local program = display.newText("[제작]\n", display.contentWidth/2, display.contentHeight * 0.1, "font/경기천년바탕_Regular.ttf")
	program.size = 18

 	local team = display.newText("Npc 6기 3팀", display.contentWidth/2, display.contentHeight * 0.12, "font/경기천년바탕_Regular.ttf")
 	team.size = 20

 	local team1 = display.newText("기획: 안은지", display.contentWidth/2, display.contentHeight * 0.18, "font/경기천년바탕_Regular.ttf")
 	team1.size = 17

 	local team2 = display.newText("디자인: 권유진, 전서연", display.contentWidth/2, display.contentHeight * 0.22, "font/경기천년바탕_Regular.ttf")
 	team2.size = 17

 	local team3 = display.newText("개발: 김미현, 김서영, 김예지, 정유진, 최유정", display.contentWidth/2, display.contentHeight * 0.26, "font/경기천년바탕_Regular.ttf")
 	team3.size = 17

 	local reference = display.newText("[게임 레퍼런스]\n", display.contentWidth/2, display.contentHeight * 0.33, "font/경기천년바탕_Regular.ttf")
 	reference.size = 18

 	local reference1 = display.newText("게임, 닌텐도 스위치, 짱구는 못말려! 나와 박사의 여름방학 ~끝나지 않는 7일간의 여행~", display.contentWidth/2, display.contentHeight * 0.35, "font/경기천년바탕_Regular.ttf")
 	reference1.size = 17

	local reference2 = display.newText("네이버 웹툰, 이온작가, 합격시켜 주세용!", display.contentWidth/2, display.contentHeight * 0.39, "font/경기천년바탕_Regular.ttf")
 	reference2.size = 17

 	local reference3 = display.newText("게임, 닌텐도 스위치, 젤다의 전설 야생의 숨결", display.contentWidth/2, display.contentHeight * 0.43, "font/경기천년바탕_Regular.ttf")
 	reference3.size = 17

 	local bgm = display.newText("[배경음악]\n", display.contentWidth/2, display.contentHeight * 0.5, "font/경기천년바탕_Regular.ttf")
 	bgm.size = 18

 	local dp1 = display.newText("*시작화면", display.contentWidth/2, display.contentHeight * 0.53, "font/경기천년바탕_Regular.ttf")
 	dp1.size = 17

 	local m1 = display.newText("♬ 춘천 그리고 가을(권민찬 외 10명), 권민찬 (저작물 2 건), 한국저작권위원회, 자유이용", display.contentWidth/2, display.contentHeight * 0.56, "font/경기천년바탕_Regular.ttf")
 	m1.size = 17

 	local dp2 = display.newText("*수화산 설화", display.contentWidth/2, display.contentHeight * 0.6, "font/경기천년바탕_Regular.ttf")
 	dp2.size = 17

 	local m2 = display.newText("♬ Forgotten Kingdom(잊혀진 왕국), 이충헌 (저작물 4 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.63, "font/경기천년바탕_Regular.ttf")
 	m2.size = 17

 	local dp3 = display.newText("*수화산 있는 마을", display.contentWidth/2, display.contentHeight * 0.67, "font/경기천년바탕_Regular.ttf")
 	dp3.size = 17

 	local m3 = display.newText("♬ Music provided by BGM Storage", display.contentWidth/2, display.contentHeight * 0.7, "font/경기천년바탕_Regular.ttf")
 	m3.size = 17

 	local m4 = display.newText("♬ Track: Elemental Forest - https://youtu.be/O56rxBQTMmo", display.contentWidth/2, display.contentHeight * 0.73, "font/경기천년바탕_Regular.ttf")
 	m3.size = 17

 	local dp4 = display.newText("*입산", display.contentWidth/2, display.contentHeight * 0.77, "font/경기천년바탕_Regular.ttf")
 	dp4.size = 17

 	local m5 = display.newText("♬ 포장 비닐 만지는, 김용배 (저작물 3000 건), 한국저작권위원회, CC BY", display.contentWidth/2, display.contentHeight * 0.8, "font/경기천년바탕_Regular.ttf")
 	m4.size = 17

 	local dp5 = display.newText("*거구귀 입 안", display.contentWidth/2, display.contentHeight * 0.84, "font/경기천년바탕_Regular.ttf")
 	dp5.size = 17

 	local m6 = display.newText("♬ 뮤직 박스, 신혜린 (저작물 7 건), 한국저작권위원회, 자유이용", display.contentWidth/2, display.contentHeight * 0.87, "font/경기천년바탕_Regular.ttf")
 	m5.size = 17

 	--fade--
	local options =
	{ 
		effect = "crossFade",
    	time = 500
    }

 	--다음 장면--
	local function tap(event)
		composer.gotoScene('credit2', options)
	end
	background:addEventListener("tap", tap)

	--layer 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(program)
	sceneGroup:insert(team)
	sceneGroup:insert(team1)
	sceneGroup:insert(team2)
	sceneGroup:insert(team3)
	sceneGroup:insert(reference)
	sceneGroup:insert(reference1)
	sceneGroup:insert(reference2)
	sceneGroup:insert(reference3)
	sceneGroup:insert(bgm)
	sceneGroup:insert(dp1)
	sceneGroup:insert(dp2)
	sceneGroup:insert(dp3)
	sceneGroup:insert(dp4)
	sceneGroup:insert(dp5)
	sceneGroup:insert(m1)
	sceneGroup:insert(m2)
	sceneGroup:insert(m3)
	sceneGroup:insert(m4)
	sceneGroup:insert(m5)
	sceneGroup:insert(m6)
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