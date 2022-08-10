-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local backgroundMusic = audio.loadStream("sound/04.InJichun'sMouth.mp3")
	audio.play(backgroundMusic, {channel=1, loops=-1})
	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1}) 
	says:audio.stop()
 		audio.dispose(BGM) 
		dispose()
	--local background = display.newImageRect("image/example.png", display.contentWidth, display.contentHeight)
	--background.x, background.y = display.contentWidth/2, display.contentHeight/2

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
	sceneGroup:insert(noToothGroup)
	sceneGroup:insert(oneToothGroup)
	sceneGroup:insert(twoToothGroup)
	sceneGroup:insert(cheek)
	sceneGroup:insert(objectGroup)
	--sceneGroup:insert(background)
	
	--점수_변수선언
	local score= display.newText(0, 500, 210)
	score.size = 100
	score:setFillColor(0)
	score.alpha = 0.5

	--- 타이머_변수선언
	local second= display.newText(0, display.contentWidth*0.9, display.contentHeight*0.15)
 	second.size = 100
 	second:setFillColor(1, 1, 1)
 	second.alpha = 0.5
	local minute= display.newText(2, 1200, 210)
	minute.size = 100
	minute:setFillColor(1, 1, 1)
	minute.alpha = 0.5

	--타이머_함수
	math.randomseed(os.time())
	local function counter( event )
		second.text = second.text - 1
		if( second.text == '-1' ) then
			second.text = 59
			minute.text = minute.text - 1
		end
		if( minute.text == 0 and second.text == '-1') then
			second.alpha = 0
   		end
		-- 충치 발생
		if(second.text%2 ~= 0) then
			local cavity = math.random(2)
			local whichTooth = math.random(11)
			if(cavity == 2) then
				if(twoTooth[whichTooth].alpha ~= 1) then
					oneTooth[whichTooth].alpha = 1
				end
			else
				twoTooth[whichTooth].alpha = 1
			end
		end
	end
	timeAttack = timer.performWithDelay(1000, counter, 121)
	
	----event // 클릭하면 깨끗해지기
	local function oneTap( event )
		
		dice[math.random(6)].alpha = 1
	end
	oneToothGroup:addEventListener("tap", tapDice)

	local function twoTap( event )
		
		dice[math.random(6)].alpha = 1
	end
	oneToothGroup:addEventListener("tap", tapDice)


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