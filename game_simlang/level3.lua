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
	--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1
   
		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end
   
		if( time.text == '-1') then
			time.alpha = 0
			composer.showOverlay('game_simlang.fail3')
			levelText.alpha=0
			levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
			levelText2:setFillColor(0)
			levelText2.size=30

			sceneGroup:insert(levelText2)
			timer.cancel(timeAttack)
			
		end
	end
   
	timeAttack = timer.performWithDelay(1000, counter, 11)   
	--tap 확대 event------------------------------------------------
	function card1:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card1:addEventListener("tap", card1)

	function card2:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card2:addEventListener("tap", card2)

	function card3:tap( event )
		time.alpha = 0
		audio.pause(explosionSound)
		timer.pause(timeAttack)

		levelText.alpha=0
		levelText2 = display.newText("찾기 성공! 숨은 그림 찾기 클리어!", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30

		sceneGroup:insert(levelText2)
		local board = display.newImageRect("image/simlang_image/보드.png",500,300)
		board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.5
	
		local title = display.newText("게임 클리어/꽃 획득 성공!", display.contentWidth/2, display.contentHeight*0.33)
		 title.size = 30
		title:setFillColor(0)
	
		local object1 = display.newImageRect("image/public/꽃3.png",150,150)
		object1.x,object1.y= display.contentWidth*0.38, display.contentHeight*0.5
	
		local object2 = display.newImageRect("image/public/설명3.png",300,150)
		object2.x,object2.y= display.contentWidth*0.56, display.contentHeight*0.5
	
		local button1 = display.newImageRect("image/simlang_image/엑스.png",50,50)
		button1.x,button1.y=864,235
	
		 sceneGroup:insert(board)
		sceneGroup:insert(title)
		sceneGroup:insert(object1)
		sceneGroup:insert(object2)
		sceneGroup:insert(button1)
	
		function button1:tap( event )
			composer.removeScene('game_simlang.level3')
			--composer.gotoScene('game_simlang.level2')
			timer.cancel(timeAttack)
		end
		button1:addEventListener("tap", button1)
	end
	card3:addEventListener("tap", card3)

	function card4:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
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
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card5:addEventListener("tap", card5)

	function card6:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card6:addEventListener("tap", card6)

	function card7:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card7:addEventListener("tap", card7)

	function card8:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card8:addEventListener("tap", card8)

	function card9:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card9:addEventListener("tap", card9)

	function card10:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card10:addEventListener("tap", card10)

	function card11:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card11:addEventListener("tap", card11)

	function card12:tap( event )
		time.alpha = 0
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail3')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9)
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)
		timer.cancel(timeAttack)
	end
	card12:addEventListener("tap", card12)
	
	function set:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack", timeAttack )

		composer.showOverlay('game_simlang.setting3')
	end
	set:addEventListener("tap", set)

	function face:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack2", timeAttack )

		composer.showOverlay('game_simlang.jichunface3')
	end
	face:addEventListener("tap", face)

	function item:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack3", timeAttack )
		composer.showOverlay('game_simlang.item3')
	end
	item:addEventListener("tap", item)
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
