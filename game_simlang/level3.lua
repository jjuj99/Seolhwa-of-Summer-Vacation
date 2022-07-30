-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

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
	--레이어 정리 끝 -------------
	function card1:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card1:addEventListener("tap", card1)

	function card2:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card2:addEventListener("tap", card2)

	function card3:tap( event )
		composer.showOverlay('game_simlang.clear')
	end
	card3:addEventListener("tap", card3)

	function card4:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card4:addEventListener("tap", card4)

	function card5:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card5:addEventListener("tap", card5)

	function card6:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card6:addEventListener("tap", card6)

	function card7:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card7:addEventListener("tap", card7)

	function card8:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card8:addEventListener("tap", card8)

	function card9:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card9:addEventListener("tap", card9)

	function card10:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card10:addEventListener("tap", card10)

	function card11:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card11:addEventListener("tap", card11)

	function card12:tap( event )
		composer.showOverlay('game_simlang.fail')
	end
	card12:addEventListener("tap", card12)
	
	function set:tap( event )
		composer.showOverlay('game_simlang.setting')
	end
	set:addEventListener("tap", set)

	function face:tap( event )
		composer.showOverlay('game_simlang.jichunface')
	end
	face:addEventListener("tap", face)

	function item:tap( event )
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
