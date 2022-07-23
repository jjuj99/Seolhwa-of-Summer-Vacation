-----------------------------------------------------------------------------------------
--
-- publicObj.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	-- 오브젝트들 배치 --
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	local set = display.newImage("image/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local guide = display.newImage("image/지천.png")
	guide.x, guide.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

	local char = display.newImage("image/인물1.png")
	char.x, char.y = display.contentWidth * 0.2, display.contentHeight * 0.6

	local char2 = display.newImage("image/인물2.png") --청자는 어둡게 할 필요 있음
	char2.x, char2.y = display.contentWidth * 0.8, display.contentHeight * 0.6

	local name = display.newImage("image/이름.png")
	name.x, name.y = display.contentWidth * 0.19, display.contentHeight * 0.62

	local lines = display.newImage("image/대사창.png")
	lines.x, lines.y = display.contentWidth * 0.5, display.contentHeight * 0.8

	local next = display.newImage("image/다음.png")
	next.x, next.y = display.contentWidth * 0.925, display.contentHeight * 0.88

	--layer 정리--

	sceneGroup:insert(background)
	sceneGroup:insert(set)
	sceneGroup:insert(guide)
	sceneGroup:insert(item)
	scencGroup:insert(char)
	sceneGroup:insert(char2)
	sceneGroup:insert(name)
	sceneGroup:insert(lines)
	sceneGroup:insert(next)
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