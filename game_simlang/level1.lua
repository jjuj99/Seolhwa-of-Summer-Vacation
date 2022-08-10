-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local timeAttack

function scene:create( event )
	local sceneGroup = self.view

	local settingGroup = display.newGroup()

	local explosionSound = audio.loadSound( "sound/Over the hill.mp3" )
	audio.play(explosionSound, {channel=2, loops=-1})
	--배경음악 설정
	audio.setMaxVolume(1, { channel=2 })
	audio.setVolume(0.5, {channel=2})

	local explosionSound2 = audio.loadSound( "sound/코드39.wav" )

	local explosionSound3 = audio.loadSound( "sound/스위치_랜턴_버튼.mp3" )

	local clickSound = audio.loadSound( "sound/카툰코드음14.wav" )
	
	
	local levelText2
	local startGroup = display.newGroup()

	--시작 화면---------------------
	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local back = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2, 550,350,10)
	back:setFillColor(0.5, 0.5, 0.2)

	local textStart= display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.4, 450,200,10)
	textStart:setFillColor(0.5, 0.4, 0.4)

	local textStart2 = display.newText("천생연분", display.contentWidth/2, display.contentHeight*0.28)
	textStart2.size = 30

	local button = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.66, 450,100,10)
	button:setFillColor(0.5, 0.4, 0.4)


 	local text = display.newText("시작하기", display.contentWidth/2, display.contentHeight*0.66)
 	text.size = 30

	 local startTalk = display.newText("심랑의 색, 특징, 그리고 생김새를 유심히 살펴보렴.", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
	 startTalk:setFillColor(0)
	 startTalk.size=30

	 local nameBack =display.newImageRect("image/dialogue/이름.png",200,50)
	 nameBack.x,nameBack.y = display.contentWidth*0.3, display.contentHeight*0.8
	 

	 local name = display.newText("지천", display.contentWidth*0.3, display.contentHeight*0.8,"font/경기천년바탕_Regular.ttf")
	 startTalk:setFillColor(0)
	 name:setFillColor(0)
	 name.size=30

	 startGroup:insert(back)
	 startGroup:insert(time)
	 startGroup:insert(textStart)
	 startGroup:insert(textStart2)
	 startGroup:insert(button)
	 startGroup:insert(text)
	 startGroup:insert(startTalk)
	 startGroup:insert(nameBack)
	 startGroup:insert(name)
	-- 이미지 불러오기 ----
	

	local levelText = display.newText("1단계)어디에 있을까?", display.contentWidth*0.5, display.contentHeight*0.9, "font/경기천년바탕_Regular.ttf")
	levelText:setFillColor(0)
	levelText.size=30
	levelText.alpha=0

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	local cardgroup= display.newGroup()
	-- local back = display.newImageRect("image/p9_1.png",display.contentWidth, display.contentHeight)
	-- back.x, back.y = display.contentWidth*0.5, display.contentHeight*0.5

	

	local setting1 = display.newImage("image/public/설정.png")
	setting1.x, setting1.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local face = display.newImage("image/public/지천.png")
	face.x, face.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

	local c1 = display.newImageRect("image/simlang_image/유영.png",170,248)
	c1.x,c1.y = display.contentWidth*0.151, display.contentHeight*0.773
	
	local c2 = display.newImageRect("image/simlang_image/심랑.png",170,248)
	c2.x,c2.y = display.contentWidth*0.8486, display.contentHeight*0.773

	local board = display.newImageRect("image/simlang_image/보드.png",680,400)
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.48

	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local timeBoard = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.1, 100,100, 5)
	timeBoard:setFillColor(0.6, 0.5, 0.5)

	local timerText =  display.newText("timer", display.contentWidth*0.5, display.contentHeight*0.05)
	timerText.size=20

--------
	local card1 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card1.x,card1.y= display.contentWidth*0.37, display.contentHeight*0.34

	local card11 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card11.x,card11.y= display.contentWidth*0.37, display.contentHeight*0.34
	card11.alpha=0
--------
	local card2 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card2.x,card2.y= display.contentWidth*0.63, display.contentHeight*0.34

	local card21 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card21.x,card21.y= display.contentWidth*0.63, display.contentHeight*0.34
	card21.alpha=0
-------
	local card3 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card3.x,card3.y= display.contentWidth*0.37, display.contentHeight*0.62

	local card31 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card31.x,card31.y= display.contentWidth*0.37, display.contentHeight*0.62
	card31.alpha=0
	
-------
	local card4 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card4.x,card4.y= display.contentWidth*0.63, display.contentHeight*0.62

	local card41 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card41.x,card41.y= display.contentWidth*0.63, display.contentHeight*0.62
	card41.alpha=0

------
	local level = display.newImageRect("image/simlang_image/단계.png",670,120)
	level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

	local touchAn = display.newImage("image/simlang_image/숨은정답1.png")
	touchAn.x,touchAn.y=400,500
	touchAn:scale(0.3,0.3)

	------이미지 불러오기 끝 ----------------

	----설정창 이미지 불러오기 및 그룹넣고 레이어 정리----------
	local background3 = display.newImage("image/setting/설정창바탕.png")
	-- background3.strokeWidth = 5
	-- background3:setStrokeColor(0.5, 0.5, 0.5)
	background3.x, background3.y = display.contentCenterX, display.contentCenterY

	local replay = display.newImage("image/setting/2클릭.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	local detail = display.newImage("image/setting/3클릭.png")
	detail.x, detail.y = display.contentWidth * 0.5, display.contentHeight * 0.5

	local out = display.newImage("image/setting/4클릭.png")
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

    local button1 = display.newImage("image/public/X.png")
	button1.x,button1.y=display.contentWidth*0.645,display.contentHeight*0.17


	
	settingGroup:insert(background3)
	settingGroup:insert(replay)
	settingGroup:insert(detail)
	settingGroup:insert(sound1)
	settingGroup:insert(sound2)
	settingGroup:insert(sound3)
    settingGroup:insert(out)
	settingGroup:insert(button1)

	settingGroup.alpha=0
	-------------------------------event 정리--------------------------
	
	function detail:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		detail.alpha = 0
		sound1.alpha = 1
		sound2.alpha = 1
		sound3.alpha = 1
	end
	detail:addEventListener("tap", detail)


	function sound1:tap ( event )
		audio.setVolume(0, {channel=2})
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.setVolume(0.5, {channel=2})
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.setVolume(1, {channel=2})
	end
	sound3:addEventListener("tap", sound3)

	function replay:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		audio.play(click)
 		composer.hideOverlay('fade', 400)
 	end
 	replay:addEventListener("tap", replay)

	-- function replay:tap( event )
	-- 	audio.play(explosionSound3, {duration = 1000})
    --     composer.removeScene('game_simlang.level1')
	-- 	composer.gotoScene('game_simlang.level1')
 	-- end
 	-- replay:addEventListener("tap", replay)

     function button1:tap( event )
		audio.play(explosionSound3, {duration = 1000})
        timer.resume(timeAttack)
		
		card2:addEventListener("tap", card2)
		card3:addEventListener("tap", card3)
		card4:addEventListener("tap", card4)
		card1:addEventListener("tap", card1)

		settingGroup.alpha=0
	end
	button1:addEventListener("tap", button1)

	function out:tap( event )
		audio.pause(explosionSound)
		audio.play(explosionSound3, {duration = 1000})		
        composer.removeScene('game_simlang.level3')
		composer.gotoScene('start')
 	end
 	out:addEventListener("tap", out)

	----------------------------------------------------------------------

	-----레이어 정리-----------
	sceneGroup:insert(background)
	--sceneGroup:insert(back)
	sceneGroup:insert(face)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(item)
	sceneGroup:insert(setting1)
	sceneGroup:insert(board)
	sceneGroup:insert(card1)
	sceneGroup:insert(card2)
	sceneGroup:insert(card3)
	sceneGroup:insert(card4)
	sceneGroup:insert(card11)
	sceneGroup:insert(card21)
	sceneGroup:insert(card31)
	sceneGroup:insert(card41)
	sceneGroup:insert(level)
	sceneGroup:insert(touchAn)
	sceneGroup:insert(levelText)
	sceneGroup:insert(timeBoard)
	sceneGroup:insert(timerText)
	sceneGroup:insert(time)


	--레이어 정리 끝 -------------

	

	
	sceneGroup:insert(startGroup)


	--tap 확대 event------------------------------------------------
	function card1:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
---------------------
	function card2:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
--------------------
	function card3:tap( event )
		time.alpha = 0
		audio.play(explosionSound2)
		--audio.pause(explosionSound)
		timer.pause(timeAttack)
		levelText.alpha=0
		levelText2 = display.newText("찾기 성공! 1단계 통과~~", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30

		sceneGroup:insert(levelText2)
	local board = display.newImageRect("image/items/바탕.png",500,300)
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.5

    local title = display.newText("게임 클리어/꽃 획득 성공!", display.contentWidth/2, display.contentHeight*0.33,"font/경기천년바탕_Regular.ttf")
 	title.size = 30
    title:setFillColor(0)

    local object1 = display.newImageRect("image/items/백리향.png",450,180)
	object1.x,object1.y= display.contentWidth*0.5, display.contentHeight*0.5

	local button2 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button2.x,button2.y=864,235

 	sceneGroup:insert(board)
    sceneGroup:insert(title)
    sceneGroup:insert(object1)
	sceneGroup:insert(button2)

	card1:removeEventListener("tap", card1)
	card2:removeEventListener("tap", card2)
	card3:removeEventListener("tap", card3)
	card4:removeEventListener("tap", card4)
	
		--composer.showOverlay('game_simlang.popup')
	function button2:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		composer.removeScene('game_simlang.level1')
		composer.gotoScene('game_simlang.level2')
		timer.cancel(timeAttack)
	end
	button2:addEventListener("tap", button2)
	
	
	
	

	
	end
	
----------------
	function card4:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
--------------
function button:tap( event )
	startGroup.alpha=0
	levelText.alpha=1

	

		--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1

		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end

		if( time.text == '-1') then
			time.alpha = 0
			audio.pause(explosionSound)
			composer.showOverlay('game_simlang.fail')
			levelText.alpha=0
			levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
			levelText2:setFillColor(0)
			levelText2.size=30

			sceneGroup:insert(levelText2)
			
		end
	end

	timeAttack = timer.performWithDelay(1000, counter, 11)   

	card1:addEventListener("tap", card1)
	card2:addEventListener("tap", card2)
	card3:addEventListener("tap", card3)
	card4:addEventListener("tap", card4)
end
button:addEventListener("tap", button)
		
function setting1:tap( event )
	settingGroup.alpha=1
	timer.pause(timeAttack)
	audio.play(explosionSound3, {duration = 1000})
	card1:removeEventListener("tap", card1)
	card2:removeEventListener("tap", card2)
	card3:removeEventListener("tap", card3)
	card4:removeEventListener("tap", card4)	
end
setting1:addEventListener("tap", setting1)

function face:tap( event )
	audio.play(explosionSound3, {duration = 1000})
	timer.pause(timeAttack)
	composer.setVariable( "timeAttack2", timeAttack )

	composer.showOverlay('game_simlang.jichunface')
end
face:addEventListener("tap", face)

function item:tap( event )
	audio.play(explosionSound3, {duration = 1000})
	timer.pause(timeAttack)
	composer.setVariable( "timeAttack3", timeAttack )
	composer.showOverlay('game_simlang.item')
end
item:addEventListener("tap", item)

sceneGroup:insert(settingGroup)
settingGroup:toFront()

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
		composer.removeScene('game_simlang.level1')
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene