-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local scoreText
local endingFlag = 0

function scene:create( event )
	local sceneGroup = self.view
	
	soundTable = {
		backgroundMusic = audio.loadStream( "sound/04.mp3" ),
		jabSound = audio.loadSound( "sound/Jab.mp3" ),
	}	 
	audio.play(soundTable.backgroundMusic, {channel=1, loops=-1})
	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1}) 
	
	local background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	local timeBackground = display.newImage("image/time/zeroText.png")
	timeBackground.x, timeBackground.y = 635, 72
	local timeImage = display.newImage("image/time/clock.gif")
	timeImage:scale(0.83, 0.83)
	timeImage.x, timeImage.y = 535, 66
	
	local objectGroup = display.newGroup()
	local option = display.newImage("image/option.png")
	option.x, option.y = 65, 64
	local item = display.newImage("image/item.png")
	item.x, item.y = 1215, 64
	objectGroup:insert(option)
	objectGroup:insert(item)

	local cheek = display.newGroup()
	local leftCheek = display.newImage("image/leftCheek.png")
	leftCheek.x, leftCheek.y = 129, 410
	local rightCheek = display.newImage("image/rightCheek.png")
	rightCheek.x, rightCheek.y = 1152, 410
	cheek:insert(leftCheek)
	cheek:insert(rightCheek)

	------NoClick
	------이빨 변수선언_이미지 크기 (171 * 171 px)
	local noToothGroup = display.newGroup()
 	local noTooth = {}
 	for i = 0, 11 do
 		if(i < 6) then
			noTooth[i] = display.newImage(noToothGroup, "image/noClickTooth/noUp.png")
			noTooth[i].x, noTooth[i].y = 219 + 171*i, 217
		else
			noTooth[i] = display.newImage(noToothGroup, "image/noClickTooth/noDown.png")
			noTooth[i].x, noTooth[i].y = 219 + 171*(i-6), 605
		end
 	end
	------OneClick
	local oneToothGroup = display.newGroup()
 	local oneTooth = {}
 	for i = 0, 11 do
		if(i < 6) then
			oneTooth[i] = display.newImage(oneToothGroup, "image/oneClickTooth/oneUp.png")
			oneTooth[i].x, oneTooth[i].y = 219 + 171*i, 217
		else
			oneTooth[i] = display.newImage(oneToothGroup, "image/oneClickTooth/oneDown.png")
			oneTooth[i].x, oneTooth[i].y = 219 + 171*(i-6), 605
		end
		oneTooth[i].alpha = 0
 	end
	-----TwoClick
	local twoToothGroup = display.newGroup()
 	local twoTooth = {}
 	for i = 0, 11 do
		if(i < 6) then
			twoTooth[i] = display.newImage(twoToothGroup, "image/twoClickTooth/twoUp.png")
			twoTooth[i].x, twoTooth[i].y = 219 + 171*i, 217
		else
			twoTooth[i] = display.newImage(twoToothGroup, "image/twoClickTooth/twoDown.png")
			twoTooth[i].x, twoTooth[i].y = 219 + 171*(i-6), 605
		end
		twoTooth[i].alpha = 0
 	end

	--정렬
	sceneGroup:insert(background)
	sceneGroup:insert(cheek)
	sceneGroup:insert(noToothGroup)
	sceneGroup:insert(oneToothGroup)
	sceneGroup:insert(twoToothGroup)
	sceneGroup:insert(objectGroup)
	
	--점수_변수선언
	local score= display.newText(0, 500, 210)
	score.size = 100
	score:setFillColor(0)
	score.alpha = 0.5

	--- 타이머_변수선언
	local second= display.newText(0, 747, 74, "font/bold.ttf")
 	second.size = 62
 	second:setFillColor(0)
	local minute= display.newText(1, 649, 74, "font/bold.ttf")
	minute.size = 62
	minute:setFillColor(0)

	--타이머_함수
	math.randomseed(os.time())
	local function counter( event )
		second.text = second.text - 1
		
		--if ( endingFlag == 1 and second.text == '-1' ) then
		--	second.alpha = 0
		--	minute.alpha = 0

		--	if( score.text ~= '성공!' ) then
		--		score.text = '실패!'
		--		scoreText = '실패!'
		--		composer.setVariable("scoreText", scoreText)
		--		composer.gotoScene('ending')
		--	end
		if( second.text == '-1' ) then
			second.text = 59
			minute.text = minute.text - 1
			endingFlag = endingFlag + 1
		end

		if( minute.text == 0 and second.text == '-1') then
			second.alpha = 0
   		end

		if( score.text == '20') then
			timeImage.alpha = 0
			timeBackground.alpha = 0
			minute.alpha = 0
			second.alpha = 0
			score.alpha = 0

			score.text = '성공!'
			scoreText = '성공!'
			composer.setVariable("scoreText", scoreText)
			second.text = 0
			--변경되었습니다.--
			audio.stop()
			BGM = audio.loadSound("sound/05. 수화산 중심_Endless.mp3")
			audio.play(BGM, {channel=1, loops=-1})
			composer.gotoScene('..scenario4')
		end
		-- 충치 발생
		local count = 0
		if(second.text%2 ~= 0) then
			local whichTooth = math.random(11)
			if(twoTooth[whichTooth].alpha ~= 1) then
				oneTooth[whichTooth].alpha = 1
			end
		else
			for i = 0, 11 do
				if(count == 2 and oneTooth[i].alpha == 1) then
					twoTooth[i].alpha = 1
				else
					count = count + 1;
				end
			end
		end
	end
	timeAttack = timer.performWithDelay(1000, counter, 61)
	
	----event 
	--// 게임 설명, 설정창, BGM, 실패 텍스트, 아이템창
	
	local oneTapScore = 0;
	local function oneTap( event )
		if(oneTapScore == 2) then
			(event.target).alpha = 0;
			score.text = score.text + 2;
			oneTapScore = 0;
		else
			oneTapScore = oneTapScore + 1;
		end
	end
	for i = 0, 11 do
		oneTooth[i]:addEventListener("tap", oneTap)
	end

	local twoTapScore = 0;
	local function twoTap( event )
		if(twoTapScore == 5) then
			(event.target).alpha = 0;
			score.text = score.text + 2;
			twoTapScore = 0;
		else
			twoTapScore = twoTapScore + 1;
		end
	end
	for i = 0, 11 do
		twoTooth[i]:addEventListener("tap", twoTap)
	end
	

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
		-- e.g. start minuters, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop minuters, stop animation, unload sounds, etc.)
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