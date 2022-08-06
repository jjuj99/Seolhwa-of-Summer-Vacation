-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect("image/example.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	
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
	cheek:insert(rightCheek) ---미완

	------NoClick
	------위쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Ntooth1 = display.newImage("image/noClickTooth/1.png")
	Ntooth1.x, Ntooth1.y = 219, 217
	local Ntooth2 = display.newImage("image/noClickTooth/2.png")
	Ntooth2.x, Ntooth2.y = 390, 217
	local Ntooth3 = display.newImage("image/noClickTooth/3.png")
	Ntooth3.x, Ntooth3.y = 561, 217
	local Ntooth4 = display.newImage("image/noClickTooth/4.png")
	Ntooth4.x, Ntooth4.y = 732, 217
	local Ntooth5 = display.newImage("image/noClickTooth/5.png")
	Ntooth5.x, Ntooth5.y = 903, 217
	local Ntooth6 = display.newImage("image/noClickTooth/6.png")
	Ntooth6.x, Ntooth6.y = 1074, 217
	------아래쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Ntooth7 = display.newImage("image/noClickTooth/7.png")
	Ntooth7.x, Ntooth7.y = 219, 605
	local Ntooth8 = display.newImage("image/noClickTooth/8.png")
	Ntooth8.x, Ntooth8.y = 390, 605
	local Ntooth9 = display.newImage("image/noClickTooth/9.png")
	Ntooth9.x, Ntooth9.y = 561, 605
	local Ntooth10 = display.newImage("image/noClickTooth/10.png")
	Ntooth10.x, Ntooth10.y = 732, 605
	local Ntooth11 = display.newImage("image/noClickTooth/11.png")
	Ntooth11.x, Ntooth11.y = 903, 605
	local Ntooth12 = display.newImage("image/noClickTooth/12.png")
	Ntooth12.x, Ntooth12.y = 1074, 605
	local Ntooth = display.newGroup()
	cheek:insert(Ntooth)
	cheek:insert(rightCheek)

	------OneClick
	------위쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Otooth1 = display.newImage("image/oneClickTooth/1.png")
	Otooth1.x, Otooth1.y = 219, 217
	local Otooth2 = display.newImage("image/oneClickTooth/2.png")
	Otooth2.x, Otooth2.y = 390, 217
	local Otooth3 = display.newImage("image/oneClickTooth/3.png")
	Otooth3.x, Otooth3.y = 561, 217
	local Otooth4 = display.newImage("image/oneClickTooth/4.png")
	Otooth4.x, Otooth4.y = 732, 217
	local Otooth5 = display.newImage("image/oneClickTooth/5.png")
	Otooth5.x, Otooth5.y = 903, 217
	local Otooth6 = display.newImage("image/oneClickTooth/6.png")
	Otooth6.x, Otooth6.y = 1074, 217
	------아래쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Otooth7 = display.newImage("image/oneClickTooth/7.png")
	Otooth7.x, Otooth7.y = 219, 605
	local Otooth8 = display.newImage("image/oneClickTooth/8.png")
	Otooth8.x, Otooth8.y = 390, 605
	local Otooth9 = display.newImage("image/oneClickTooth/9.png")
	Otooth9.x, Otooth9.y = 561, 605
	local Otooth10 = display.newImage("image/oneClickTooth/10.png")
	Otooth10.x, Otooth10.y = 732, 605
	local Otooth11 = display.newImage("image/oneClickTooth/11.png")
	Otooth11.x, Otooth11.y = 903, 605
	local Otooth12 = display.newImage("image/oneClickTooth/12.png")
	Otooth12.x, Otooth12.y = 1074, 605

	-----TwoClick
	------위쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Ttooth1 = display.newImage("image/twoClickTooth/1.png")
	Ttooth1.x, Ttooth1.y = 219, 217
	local Ttooth2 = display.newImage("image/twoClickTooth/2.png")
	Ttooth2.x, Ttooth2.y = 390, 217
	local Ttooth3 = display.newImage("image/twoClickTooth/3.png")
	Ttooth3.x, Ttooth3.y = 561, 217
	local Ttooth4 = display.newImage("image/twoClickTooth/4.png")
	Ttooth4.x, Ttooth4.y = 732, 217
	local Ttooth5 = display.newImage("image/twoClickTooth/5.png")
	Ttooth5.x, Ttooth5.y = 903, 217
	local Ttooth6 = display.newImage("image/twoClickTooth/6.png")
	Ttooth6.x, Ttooth6.y = 1074, 217
	------아래쪽 이빨 변수선언_이미지 크기 (171 * 171 px)
	local Ttooth7 = display.newImage("image/twoClickTooth/7.png")
	Ttooth7.x, Ttooth7.y = 219, 605
	local Ttooth8 = display.newImage("image/twoClickTooth/8.png")
	Ttooth8.x, Ttooth8.y = 390, 605
	local Ttooth9 = display.newImage("image/twoClickTooth/9.png")
	Ttooth9.x, Ttooth9.y = 561, 605
	local Ttooth10 = display.newImage("image/twoClickTooth/10.png")
	Ttooth10.x, Ttooth10.y = 732, 605
	local Ttooth11 = display.newImage("image/twoClickTooth/11.png")
	Ttooth11.x, Ttooth11.y = 903, 605
	local Ttooth12 = display.newImage("image/twoClickTooth/12.png")
	Ttooth12.x, Ttooth12.y = 1074, 605
	--정렬

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