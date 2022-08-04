-----------------------------------------------------------------------------------------
--
-- ending1.lua fin, 감사합니다.
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor(0)

 	local endingText = display.newText("Fin!\n", display.contentWidth/2, display.contentHeight*0.45)
 	endingText.size = 80

 	local endingText2 =  display.newText("감사합니다.", display.contentWidth/2, display.contentHeight*0.55)
 	endingText2.size = 75

 -- 	local replay = display.newText("다시 하기", display.contentWidth/2, display.contentHeight*0.7)
	-- replay.size = 100

 -- 	function replay:tap( event )
 -- 		composer.gotoScene('game')
 -- 	end
 -- 	replay:addEventListener("tap", replay)

 	--fade--
	local options =
	{ 
		effect = "fade",
    	time = 150
    }

 	--다음 장면--
	local function tap(event)
		composer.gotoScene('credit')
	end
	background:addEventListener("tap", tap)

	sceneGroup:insert(background)
 	sceneGroup:insert(endingText)
 	sceneGroup:insert(endingText2)

	-- sceneGroup:insert(replay)
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