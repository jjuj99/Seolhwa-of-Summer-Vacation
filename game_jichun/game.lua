-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	soundTable = {
		backgroundMusic = audio.loadStream( "sound/OverTheHill.mp3" ),
		jabSound = audio.loadSound( "sound/Jab.mp3" ),
	}	 
	audio.play(soundTable.backgroundMusic, {channel=1, loops=-1})
	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1}) 
	
	local background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	local zeroText = display.newImage("image/time/zeroText.png")
	zeroText.x, zeroText.y = 600, 72
	local zeroText2 = display.newImage("image/time/zeroText.png")
	zeroText2.x, zeroText2.y = 698, 72
	local timeImage = display.newImage("image/time/clock.gif")
	timeImage:scale(0.83, 0.83)
	timeImage.x, timeImage.y = 535, 66
	local dash = display.newImage("image/time/dash.png")
	dash.x, dash.y = 685, 72
	dash.alpha = 0
	local dash2 = display.newImage("image/time/dash.png")
	dash2.x, dash2.y = 666, 72
	
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
	
	--점수_변수선언
	local score= display.newText(0, 500, 210)
	score.size = 100
	score:setFillColor(0)
	score.alpha = 0

	--- 타이머_변수선언
	local second= display.newText(00, 747, 72, "font/bold.ttf")
 	second.size = 62
 	second:setFillColor(0)
	local minute= display.newText(01, 649, 72, "font/bold.ttf")
	minute.size = 62
	minute:setFillColor(0)

	--타이머_함수
	math.randomseed(os.time())
	local function counter( event )
		second.text = second.text - 1
		
		--타이머_텍스트 배치
		if('0' < second.text and second.text < '10' and minute.text == '0') then
			dash.alpha = 0
			dash2.alpha = 1
			zeroText2.alpha = 1
		else
			dash.alpha = 1
			dash2.alpha = 0
			zeroText2.alpha = 0
		end
		
		if(second.text == '1' or second.text == '2' or second.text == '3' or
		second.text == '4' or second.text == '5' or second.text == '6' or
		second.text == '7' or second.text == '8' or second.text == '9') then
			zeroText2.alpha = 1
			zeroText2.x = 720
			second.x = 770
		end

		--실패

		if ( minute.text == '0' and second.text == '0') then
			composer.showOverlay('fail')
			dash.alpha = 0
			dash2.alpha = 0
			zeroText.alpha = 0
			zeroText2.alpha = 0
			timeImage.alpha = 0
			minute.alpha = 0
			second.alpha = 0
		elseif( second.text == '-1' ) then
			second.text = 59
			minute.text = minute.text - 1
		end
		
		-- 성공
		if( score.text == '20') then
			timer.pause(timeAttack)
			composer.showOverlay('ending')
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
	timeAttack = timer.performWithDelay(1000, counter, 60)
	
	----event

	local function cheekTap( event )
		audio.play(soundTable.jabSound, {channel=2, loops=0})
		audio.setMaxVolume(1, { channel=2})
		audio.setVolume(0.5, {channel=2}) 
		score.text = score.text - 1;
	end
	cheek:addEventListener("tap", cheekTap)

	local oneTapScore = 0
	local function oneTap( event )
		audio.play(soundTable.jabSound, {channel=2, loops=0})
		audio.setMaxVolume(1, { channel=2})
		audio.setVolume(0.5, {channel=2}) 
		if(oneTapScore == 2) then
			(event.target).alpha = 0
			score.text = score.text + 2
			oneTapScore = 0
		else
			oneTapScore = oneTapScore + 1
		end
	end
	for i = 0, 11 do
		oneTooth[i]:addEventListener("tap", oneTap)
	end

	local twoTapScore = 0
	local function twoTap( event )
		audio.play(soundTable.jabSound, {channel=2, loops=0})
		audio.setMaxVolume(1, { channel=2})
		audio.setVolume(0.5, {channel=2}) 
		if(twoTapScore == 5) then
			(event.target).alpha = 0
			score.text = score.text + 2
			twoTapScore = 0;
		else
			twoTapScore = twoTapScore + 1
		end
	end
	for i = 0, 11 do
		twoTooth[i]:addEventListener("tap", twoTap)
	end
	
	--시작 화면
	local start = {
		isModal = true,
		effect = "fade",
		time = 400,
		params = {}
	}

	if composer.getVariable("start") == nil then
		composer.showOverlay('jichunStart', start)
	end
	--설정
 	function option:tap( event )
		timer.pause(timeAttack)
 		composer.setVariable( "timeAttack", timeAttack )
		composer.showOverlay('setting')
 	end
 	option:addEventListener("tap", option)
	
	--아이템
	function item:tap( event )
		timer.pause(timeAttack)
 		composer.setVariable( "timeAttack", timeAttack )
		composer.showOverlay('items')
 	end
 	item:addEventListener("tap", item)
	
	--정렬
	sceneGroup:insert(background)
	sceneGroup:insert(cheek)
	sceneGroup:insert(noToothGroup)
	sceneGroup:insert(oneToothGroup)
	sceneGroup:insert(twoToothGroup)
	sceneGroup:insert(objectGroup)
	sceneGroup:insert(minute)
	sceneGroup:insert(second)
	sceneGroup:insert(zeroText)
	sceneGroup:insert(zeroText2)
	sceneGroup:insert(timeImage)
	sceneGroup:insert(score)
	sceneGroup:insert(dash)
	sceneGroup:insert(dash2)
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