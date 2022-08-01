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

	
	-- 이미지 불러오기 ----
	local levelText = display.newText("1단계)어디에 있을까?", display.contentWidth*0.5, display.contentHeight*0.9)
	levelText:setFillColor(0)
	levelText.size=30

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
	cardgroup:insert(card1)

	local card11 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card11.x,card11.y= display.contentWidth*0.37, display.contentHeight*0.34
	card11.alpha=0
	cardgroup:insert(card11)

	local card12 = display.newImageRect("image/simlang_image/그림3.png",300,180)
	card12.x,card12.y= display.contentWidth*0.37, display.contentHeight*0.34
	card12.alpha=0
	cardgroup:insert(card12)

	local card13 = display.newImageRect("image/simlang_image/그림4.png",300,180)
	card13.x,card13.y= display.contentWidth*0.37, display.contentHeight*0.34
	card13.alpha=0
	cardgroup:insert(card13)
--------
	local card2 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card2.x,card2.y= display.contentWidth*0.63, display.contentHeight*0.34
	cardgroup:insert(card2)

	local card21 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card21.x,card21.y= display.contentWidth*0.63, display.contentHeight*0.34
	card21.alpha=0
	cardgroup:insert(card21)

	local card22 = display.newImageRect("image/simlang_image/그림3.png",300,180)
	card22.x,card22.y= display.contentWidth*0.63, display.contentHeight*0.34
	card22.alpha=0
	cardgroup:insert(card22)

	local card23 = display.newImageRect("image/simlang_image/그림4.png",300,180)
	card23.x,card23.y= display.contentWidth*0.63, display.contentHeight*0.34
	card23.alpha=0
	cardgroup:insert(card23)
-------
	local card3 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card3.x,card3.y= display.contentWidth*0.37, display.contentHeight*0.62
	cardgroup:insert(card3)

	local card31 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card31.x,card31.y= display.contentWidth*0.37, display.contentHeight*0.62
	card31.alpha=0
	cardgroup:insert(card31)

	local card32 = display.newImageRect("image/simlang_image/그림3.png",300,180)
	card32.x,card32.y= display.contentWidth*0.37, display.contentHeight*0.62
	card32.alpha=0
	cardgroup:insert(card32)

	local card33 = display.newImageRect("image/simlang_image/그림4.png",300,180)
	card33.x,card33.y= display.contentWidth*0.37, display.contentHeight*0.62
	card33.alpha=0
	cardgroup:insert(card33)
	
-------
	local card4 = display.newImageRect("image/simlang_image/그림.png",300,180)
	card4.x,card4.y= display.contentWidth*0.63, display.contentHeight*0.62
	cardgroup:insert(card4)

	local card41 = display.newImageRect("image/simlang_image/그림2.png",300,180)
	card41.x,card41.y= display.contentWidth*0.63, display.contentHeight*0.62
	card41.alpha=0
	cardgroup:insert(card41)

	local card42 = display.newImageRect("image/simlang_image/그림3.png",300,180)
	card42.x,card42.y= display.contentWidth*0.63, display.contentHeight*0.62
	card42.alpha=0
	cardgroup:insert(card42)

	local card43 = display.newImageRect("image/simlang_image/그림4.png",300,180)
	card43.x,card43.y= display.contentWidth*0.63, display.contentHeight*0.62
	card43.alpha=0
	cardgroup:insert(card43)
------
	local level = display.newImageRect("image/simlang_image/단계.png",670,120)
	level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

	local touchAn = display.newImage("image/simlang_image/숨은정답1.png")
	touchAn.x,touchAn.y=400,500
	touchAn:scale(0.06,0.06)

	------이미지 불러오기 끝 ----------------


	-----레이어 정리-----------
	sceneGroup:insert(background)
	--sceneGroup:insert(back)
	sceneGroup:insert(face)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(item)
	sceneGroup:insert(setting1)
	sceneGroup:insert(board)
	sceneGroup:insert(cardgroup)
	sceneGroup:insert(level)
	sceneGroup:insert(touchAn)
	sceneGroup:insert(levelText)
	sceneGroup:insert(timeBoard)
	sceneGroup:insert(timerText)
	sceneGroup:insert(time)
	touchAn:toFront()
	--레이어 정리 끝 -------------

	--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1
   
		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end
   
		if( time.text == '-1') then
			time.alpha = 0
			composer.showOverlay('game_simlang.fail')
			
		end
	end
   
	timeAttack = timer.performWithDelay(1000, counter, 11)   

	--tap 확대 event------------------------------------------------
	function card1:tap( event )
		card1.alpha=0
		card11.alpha=1
	end
	card1:addEventListener("tap", card1)
	function card11:tap( event )
		card11.alpha=0
		card12.alpha=1
	end
	card11:addEventListener("tap", card11)

	function card12:tap( event )
		card12.alpha=0
		card13.alpha=1
	end
	card12:addEventListener("tap", card12)
---------------------
	function card2:tap( event )
		card2.alpha=0
		card21.alpha=1
	end
	card2:addEventListener("tap", card2)
	function card21:tap( event )
		card21.alpha=0
		card22.alpha=1
	end
	card21:addEventListener("tap", card21)
	function card22:tap( event )
		card22.alpha=0
		card23.alpha=1
	end
	card22:addEventListener("tap", card22)
--------------------
	function card3:tap( event )
		card3.alpha=0
		card31.alpha=1
		touchAn.x,touchAn.y=450,450
		touchAn:scale(1.3,1.3)
	end
	card3:addEventListener("tap", card3)
	function card31:tap( event )
		card31.alpha=0
		card32.alpha=1
		touchAn.x,touchAn.y=450,450
		touchAn:scale(2,2)
	end
	card31:addEventListener("tap", card31)
	function card32:tap( event )
		card32.alpha=0
		card33.alpha=1
		touchAn.x,touchAn.y=450,450
		touchAn:scale(3,3)
	end
	card32:addEventListener("tap", card32)
----------------
	function card4:tap( event )
		card4.alpha=0
		card41.alpha=1
	end
	card4:addEventListener("tap", card4)
	function card41:tap( event )
		card41.alpha=0
		card42.alpha=1
	end
	card41:addEventListener("tap", card41)
	function card42:tap( event )
		card42.alpha=0
		card43.alpha=1
	end
	card42:addEventListener("tap", card42)
--------------
	function touchAn:tap( event )
		time.alpha = 0
		timer.pause(timeAttack)
		composer.showOverlay('game_simlang.popup')
	end
	touchAn:addEventListener("tap", touchAn)

	function setting1:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack", timeAttack )

		composer.showOverlay('game_simlang.setting')
	end
	setting1:addEventListener("tap", setting1)

	function face:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack2", timeAttack )

		composer.showOverlay('game_simlang.jichunface')
	end
	face:addEventListener("tap", face)

	function item:tap( event )
		timer.pause(timeAttack)
		composer.setVariable( "timeAttack3", timeAttack )
		composer.showOverlay('game_simlang.item')
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
		--timer.cancel(timeAttack)
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