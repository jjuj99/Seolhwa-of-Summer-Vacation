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

	composer.removeScene('game_simlang.fail2')

	local flag

	local settingGroup = display.newGroup()

	local explosionSound2 = audio.loadSound( "sound/코드39.wav" )

	local explosionSound3 = audio.loadSound( "sound/스위치_랜턴_버튼.mp3" )
	
	local explosionSound4 = audio.loadSound( "sound/Boy meets Girl.mp3" )

	local clickSound = audio.loadSound( "sound/카툰코드음14.wav" )

	-- local explosionSound = audio.loadSound( "image/simlang_image/Trust.mp3" )
	-- audio.play(explosionSound, {channel=3, loops=-1})
	-- --배경음악 설정
	-- audio.setMaxVolume(1, { channel=3 })
	-- audio.setVolume(0.5, {channel=3})

	local levelText2
	-- 이미지 불러오기 ----
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	-- local back = display.newImageRect("image/p10_2.png",display.contentWidth, display.contentHeight)
	-- back.x, back.y = display.contentWidth*0.5, display.contentHeight*0.5

	local levelText = display.newText("3단계)어디에 있을까?", display.contentWidth*0.5, display.contentHeight*0.9)
	levelText:setFillColor(0)
	levelText.size=30

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

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

	local card1 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card1.x,card1.y= 364,250

	local card2 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card2.x,card2.y= 475,250

	local card3 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card3.x,card3.y=  580,250

	local card4 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card4.x,card4.y=  690,250

	local card5 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card5.x,card5.y= 799,250

	local card6 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card6.x,card6.y= 904,250

	local card7 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card7.x,card7.y=  364,439

	local card8 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card8.x,card8.y=  475,439

	local card9 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card9.x,card9.y= 580,439

	local card10 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card10.x,card10.y= 690,439

	local card11 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card11.x,card11.y= 799,439

	local card12 = display.newImageRect("image/simlang_image/숨은그림.png",100,182)
	card12.x,card12.y= 904,439


	local level = display.newImageRect("image/simlang_image/단계.png",670,120)
	level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local timeBoard = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.1, 100,100, 5)
	timeBoard:setFillColor(0.6, 0.5, 0.5)

	local timerText =  display.newText("timer", display.contentWidth*0.5, display.contentHeight*0.05)
	timerText.size=20

	------이미지 불러오기 끝 ----------------

	----설정창 이미지 불러오기 및 그룹넣고 레이어 정리----------
	local background2 = display.newImage("image/setting/설정창 바탕.png")
	background2.strokeWidth = 5
	background2:setStrokeColor(0.5, 0.5, 0.5)
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

    local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button1.x,button1.y=822,128


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

	--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1
   
		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end
   
		if( time.text == '-1') then
			time.alpha = 0
			levelText.alpha=0
			levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
			levelText2:setFillColor(0)
			levelText2.size=30

			sceneGroup:insert(levelText2)
			timer.cancel(timeAttack)
	
			composer.showOverlay('game_simlang.fail21')
		end
	end
   
	timeAttack = timer.performWithDelay(1000, counter, 11)   
	
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
		card5:addEventListener("tap", card5)
		card6:addEventListener("tap", card6)
		card7:addEventListener("tap", card7)
		card8:addEventListener("tap", card8)
		card9:addEventListener("tap", card9)
		card10:addEventListener("tap", card10)
		card11:addEventListener("tap", card11)
		card12:addEventListener("tap", card12)

		settingGroup.alpha=0
	end
	button1:addEventListener("tap", button1)

	function out:tap( event )
		audio.phase(explosionSound)
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
	sceneGroup:insert(item)
	sceneGroup:insert(set)
	sceneGroup:insert(board)
	sceneGroup:insert(card1)
	sceneGroup:insert(card2)
	sceneGroup:insert(card3)
	sceneGroup:insert(card4)
	sceneGroup:insert(card5)
	sceneGroup:insert(card6)
	sceneGroup:insert(card7)
	sceneGroup:insert(card8)
	sceneGroup:insert(card9)
	sceneGroup:insert(card10)
	sceneGroup:insert(card11)
	sceneGroup:insert(card12)
	sceneGroup:insert(level)
	sceneGroup:insert(levelText)
	sceneGroup:insert(timeBoard)
	sceneGroup:insert(timerText)
	sceneGroup:insert(time)
	
	--레이어 정리 끝 -------------
	
	--tap 확대 event------------------------------------------------
	function card1:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card1:addEventListener("tap", card1)

	function card2:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card2:addEventListener("tap", card2)

	function card3:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		audio.pause(explosionSound)
		audio.play(explosionSound2)
		timer.pause(timeAttack)

		audio.play(explosionSound4)

		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
		card5:removeEventListener("tap", card5)
		card6:removeEventListener("tap", card6)
		card7:removeEventListener("tap", card7)
		card8:removeEventListener("tap", card8)
		card9:removeEventListener("tap", card9)
		card10:removeEventListener("tap", card10)
		card11:removeEventListener("tap", card11)
		card12:removeEventListener("tap", card12)
		levelText.alpha=0
		levelText2 = display.newText("찾기 성공! 숨은 그림 찾기 클리어!", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30

		sceneGroup:insert(levelText2)
		local board = display.newImageRect("image/items/바탕.png",500,300)
		board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.5
	
		local title = display.newText("게임 클리어/꽃 획득 성공!", display.contentWidth/2, display.contentHeight*0.33)
		 title.size = 30
		title:setFillColor(0)
	
		local object1 = display.newImageRect("image/items/진달래.png",450,180)
	object1.x,object1.y= display.contentWidth*0.5, display.contentHeight*0.5

	local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
	button1.x,button1.y=864,235

 	sceneGroup:insert(board)
    sceneGroup:insert(title)
    sceneGroup:insert(object1)
	sceneGroup:insert(button1)
	
		function button1:tap( event )
			audio.pause(explosionSound4)
			composer.removeScene('game_simlang.level3')
			composer.gotoScene('scenario9')
			timer.cancel(timeAttack)
		end
		button1:addEventListener("tap", button1)
	end
	card3:addEventListener("tap", card3)

	function card4:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail21')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
	end
	card4:addEventListener("tap", card4)

	function card5:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card5:addEventListener("tap", card5)

	function card6:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
	
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card6:addEventListener("tap", card6)

	function card7:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card7:addEventListener("tap", card7)

	function card8:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		timer.cancel(timeAttack)
	end
	card8:addEventListener("tap", card8)

	function card9:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		
		timer.cancel(timeAttack)
	end
	card9:addEventListener("tap", card9)

	function card10:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		
		timer.cancel(timeAttack)
	end
	card10:addEventListener("tap", card10)

	function card11:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		
		timer.cancel(timeAttack)
	end
	card11:addEventListener("tap", card11)

	function card12:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		--audio.pause(explosionSound)
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		composer.showOverlay('game_simlang.fail21')
		
		timer.cancel(timeAttack)
	end
	card12:addEventListener("tap", card12)


	function set:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		timer.pause(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
		card5:removeEventListener("tap", card5)
		card6:removeEventListener("tap", card6)
		card7:removeEventListener("tap", card7)
		card8:removeEventListener("tap", card8)
		card9:removeEventListener("tap", card9)
		card10:removeEventListener("tap", card10)
		card11:removeEventListener("tap", card11)
		card12:removeEventListener("tap", card12)
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