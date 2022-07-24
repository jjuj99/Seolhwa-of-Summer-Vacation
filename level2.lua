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

	-- local back = display.newImageRect("image/p9_2.png",display.contentWidth, display.contentHeight)
	-- back.x, back.y = display.contentWidth*0.5, display.contentHeight*0.5

	local face = display.newImage("image/지천얼굴.png")
	face.x,face.y = display.contentWidth*0.82, display.contentHeight*0.088

	local c1 = display.newImageRect("image/유영.png",170,248)
	c1.x,c1.y = display.contentWidth*0.151, display.contentHeight*0.773
	
	local c2 = display.newImageRect("image/심랑.png",170,248)
	c2.x,c2.y = display.contentWidth*0.8486, display.contentHeight*0.773

	local item = display.newImageRect("image/아이템.png",100,100)
	item.x,item.y= display.contentWidth*0.925, display.contentHeight*0.088

	local setting1 = display.newImageRect("image/설정.png",90,90)
	setting1.x,setting1.y= display.contentWidth*0.1, display.contentHeight*0.088

	local board = display.newImageRect("image/보드.png",680,400)
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.48

	local card1 = display.newImageRect("image/숨은그림.png",150,182)
	card1.x,card1.y= display.contentWidth*0.31, display.contentHeight*0.343

	local card2 = display.newImageRect("image/숨은그림.png",150,182)
	card2.x,card2.y= display.contentWidth*0.434, display.contentHeight*0.343

	local card3 = display.newImageRect("image/숨은그림.png",150,182)
	card3.x,card3.y=  display.contentWidth*0.558, display.contentHeight*0.343

	local card4 = display.newImageRect("image/숨은그림.png",150,182)
	card4.x,card4.y=  display.contentWidth*0.682, display.contentHeight*0.343

	local card5 = display.newImageRect("image/숨은그림.png",150,182)
	card5.x,card5.y= display.contentWidth*0.31, display.contentHeight*0.617

	local card6 = display.newImageRect("image/숨은그림.png",150,182)
	card6.x,card6.y= display.contentWidth*0.434, display.contentHeight*0.617

	local card7 = display.newImageRect("image/숨은그림.png",150,182)
	card7.x,card7.y=  display.contentWidth*0.558, display.contentHeight*0.617

	local card8 = display.newImageRect("image/숨은그림.png",150,182)
	card8.x,card8.y=  display.contentWidth*0.682, display.contentHeight*0.617

	local level = display.newImageRect("image/단계.png",670,120)
	level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

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
	sceneGroup:insert(card1)
	sceneGroup:insert(card2)
	sceneGroup:insert(card3)
	sceneGroup:insert(card4)
	sceneGroup:insert(card5)
	sceneGroup:insert(card6)
	sceneGroup:insert(card7)
	sceneGroup:insert(card8)
	sceneGroup:insert(level)
	--레이어 정리 끝 -------------
	
	
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
