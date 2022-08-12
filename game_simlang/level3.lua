-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local timeAttack

function scene:create( event )
	local sceneGroup = self.view
	local settingGroup = display.newGroup()
	local popupGroup = display.newGroup()

	local explosionSound2 = audio.loadSound( "sound/코드39.wav" )

	local explosionSound3 = audio.loadSound( "sound/스위치_랜턴_버튼.mp3" )
	
	-- local explosionSound4 = audio.loadSound( "sound/Boy meets Girl.mp3" )

	local clickSound = audio.loadSound( "sound/카툰코드음14.wav" )

	local levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9, "font/경기천년바탕_Regular.ttf")
	levelText2:setFillColor(0)
	levelText2.size=30

	levelText2.alpha=0
	-- 이미지 불러오기 ----
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	local levelText = display.newText("3단계)어디에 있을까?", display.contentWidth*0.5, display.contentHeight*0.9, "font/경기천년바탕_Regular.ttf")
	levelText:setFillColor(0)
	levelText.size=30

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local face = display.newImage("image/public/지천.png")
	face.x, face.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

	local c1 = display.newImageRect("image/simlang_image/유영.png",170,410)
	c1.x,c1.y = display.contentWidth*0.151, display.contentHeight*0.71
	
	local c2 = display.newImageRect("image/simlang_image/심랑.png",170,410)
	c2.x,c2.y = display.contentWidth*0.8486, display.contentHeight*0.71

	local c3 = display.newImageRect("image/simlang_image/심랑_눈물.png",170,410)
	c3.x,c3.y = display.contentWidth*0.8486, display.contentHeight*0.71
	c3.alpha=0

	local c4 = display.newImageRect("image/character/유영당황.png",170,410)
	c4.x,c4.y = display.contentWidth*0.151, display.contentHeight*0.71
	c4.alpha=0

	local c5 = display.newImageRect("image/character/심랑_신난,완전체.png",170,410)
	c5.x,c5.y = display.contentWidth*0.8486, display.contentHeight*0.71
	c5.alpha=0

	local c6 = display.newImageRect("image/character/유영웃는.png",170,410)
	c6.x,c6.y = display.contentWidth*0.151, display.contentHeight*0.71
	c6.alpha=0

	local board = display.newImageRect("image/simlang_image/배경.jpg",680,400)
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.48

	local card1 = display.newImageRect("image/simlang_image/1_6.png",630,182)
	card1.x,card1.y= 650,250

	local card2 = display.newImageRect("image/simlang_image/7_10.png",410,182)
	card2.x,card2.y= 522,439

	local card3 = display.newImageRect("image/simlang_image/정답.png",110,182)
	card3.x,card3.y=  779,439

	local card4 = display.newImageRect("image/simlang_image/12.png",110,182)
	card4.x,card4.y=  904,439

	local level = display.newImageRect("image/dialogue/대사창.png",720,160)
	level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local timeBoard = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.1, 100,100, 5)
	timeBoard:setFillColor(0.6, 0.5, 0.5)

	local timerText =  display.newText("timer", display.contentWidth*0.5, display.contentHeight*0.05)
	timerText.size=20

	local board11 = display.newImage("image/simlang_image/성공.png")
	board11.x,board11.y= display.contentWidth*0.5, display.contentHeight*0.5

	popupGroup:insert(board11)
	

	popupGroup.alpha=0

	------이미지 불러오기 끝 ----------------

	----설정창 이미지 불러오기 및 그룹넣고 레이어 정리----------
	local background2 = display.newImage("image/setting/설정창바탕.png")
	-- background2.strokeWidth = 5
	-- background2:setStrokeColor(0.5, 0.5, 0.5)
	background2.x, background2.y = display.contentCenterX, display.contentCenterY

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



	settingGroup:insert(background2)
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
		audio.setVolume(0, {channel=1})
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.setVolume(0.5, {channel=1})
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.setVolume(1, {channel=1})
	end
	sound3:addEventListener("tap", sound3)

	function replay:tap( event )
		audio.play(explosionSound3, {duration = 1000})
        composer.removeScene('game_simlang.level3')
		composer.gotoScene('game_simlang.level3')
 	end
 	replay:addEventListener("tap", replay)

     function button1:tap( event )
		audio.play(explosionSound3, {duration = 1000})
        timer.resume(timeAttack)
		
		card1:addEventListener("tap", card1)
		card2:addEventListener("tap", card2)
		card3:addEventListener("tap", card3)
		card4:addEventListener("tap", card4)

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

	
	-----레이어 정리-----------
	sceneGroup:insert(background)
	-- sceneGroup:insert(back)
	sceneGroup:insert(face)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(c4)
	sceneGroup:insert(c5)
	sceneGroup:insert(c6)
	sceneGroup:insert(item)
	sceneGroup:insert(set)
	sceneGroup:insert(board)
	sceneGroup:insert(card1)
	sceneGroup:insert(card2)
	sceneGroup:insert(card3)
	sceneGroup:insert(card4)
	sceneGroup:insert(level)
	sceneGroup:insert(levelText)
	sceneGroup:insert(timeBoard)
	sceneGroup:insert(timerText)
	sceneGroup:insert(time)
	sceneGroup:insert(levelText2)
	sceneGroup:insert(popupGroup)
	
	--레이어 정리 끝 -------------
	
	

	--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1
   
		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end
   
		if( time.text == '-1') then
			time.alpha = 0
			--audio.pause(explosionSound)
			composer.showOverlay('game_simlang.fail21')
			levelText.alpha=0
			levelText2.alpha=1

			timer.cancel(timeAttack)
		end
	end
   
	timeAttack = timer.performWithDelay(1000, counter, 11)   
	
	--tap 정답 고르기 event------------------------------------------------
	function card1:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		levelText.alpha=0
		levelText2.alpha=1
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card1:addEventListener("tap", card1)

	function card2:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		levelText.alpha=0
		levelText2.alpha=1
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card2:addEventListener("tap", card2)

	function card3:tap( event )
		time.alpha = 0
		popupGroup.alpha=1

	function board11:tap( event )	
		levelText2.alpha=0
		popupGroup.alpha=0
		audio.pause(explosionSound4)
		composer.removeScene('game_simlang.level3')
		-- 변경된 부분입니다.
		audio.stop()
		audio.dispose(explosionSound)
		BGM = audio.loadSound("sound/12. 심랑 성공 후_Boy meets Girl.mp3")
		audio.play(BGM, {channel=1, loops=-1})
		composer.gotoScene('..scenario11')
		timer.cancel(timeAttack)		
	end
	board11:addEventListener("tap", board11)
		audio.play(clickSound)
		audio.pause(explosionSound)
		audio.play(explosionSound2)
		timer.pause(timeAttack)

		c2.alpha=0
		c5.alpha=1
		c1.alpha=0
		c6.alpha=1

		--audio.play(explosionSound4)

		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
		levelText.alpha=0
		levelText2 = display.newText("찾기 성공! 숨은 그림 찾기 클리어!", display.contentWidth*0.5, display.contentHeight*0.9, "font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		levelText2.alpha=1
	end
	card3:addEventListener("tap", card3)

	
	function card4:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail21')
		levelText.alpha=0
		levelText2.alpha=1
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
	end
	card4:addEventListener("tap", card4)

	function set:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		timer.pause(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	
		settingGroup.alpha=1
	end
	set:addEventListener("tap", set)

	function face:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack2", timeAttack )

		composer.showOverlay('game_simlang.jichunface3')
	end
	face:addEventListener("tap", face)

	function item:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack3", timeAttack )
		composer.showOverlay('game_simlang.item3')
	end
	item:addEventListener("tap", item)



	sceneGroup:insert(settingGroup)
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
		composer.removeScene('game_simlang.level3')
		--timer.cancel(timeAttack)
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
