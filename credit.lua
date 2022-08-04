-----------------------------------------------------------------------------------------
--
-- credit.lua 크레딧
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor(0)

 	local team = display.newText("제작\n", display.contentWidth/2, display.contentHeight * 0.15)
 	team.size = 20

 	local teamName = display.newText("NPC 6기 3팀\n", display.contentWidth/2, display.contentHeight * 0.18)
 	teamName.size = 20

 	local plan = display.newText("기획\n", display.contentWidth/2, display.contentHeight * 0.25)
 	plan.size = 20

 	local pname1 = display.newText("안은지\n", display.contentWidth/2, display.contentHeight * 0.28)
 	pname1.size = 20

 	local design = display.newText("디자인\n", display.contentWidth/2, display.contentHeight * 0.35)
 	design.size = 20

 	local dname1 = display.newText("권유진\n", display.contentWidth/2, display.contentHeight * 0.38)
 	dname1.size = 20

 	local dname2 = display.newText("정서연\n", display.contentWidth/2, display.contentHeight * 0.41)
 	dname2.size = 20

 	local develope = display.newText("개발\n", display.contentWidth/2, display.contentHeight * 0.48)
 	develope.size = 20

 	local vname1 = display.newText("김미현\n", display.contentWidth/2, display.contentHeight * 0.51)
 	vname1.size = 20

 	local vname2 = display.newText("김예지\n", display.contentWidth/2, display.contentHeight * 0.54)
 	vname2.size = 20

 	local vname3 = display.newText("김서영\n", display.contentWidth/2, display.contentHeight * 0.57)
 	vname3.size = 20

 	local vname4 = display.newText("정유진\n", display.contentWidth/2, display.contentHeight * 0.60)
 	vname4.size = 20

 	local vname5 = display.newText("최유정\n", display.contentWidth/2, display.contentHeight * 0.63)
 	vname5.size = 20

 	local reference = display.newText("게임 레퍼런스", display.contentWidth/2, display.contentHeight * 0.7)
 	reference.size = 20

 	local game = display.newText("짱구의 여름방학 이야기", display.contentWidth/2, display.contentHeight * 0.73)
 	game.size = 20

 	--fade--
	local options =
	{ 
		effect = "crossFade",
    	time = 800
    }

 	--다음 장면--
	local function tap(event)
		composer.gotoScene('epilogue', options)
	end
	background:addEventListener("tap", tap)

	--layer 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(team)
	sceneGroup:insert(teamName)
	sceneGroup:insert(plan)
	sceneGroup:insert(pname1)
	sceneGroup:insert(design)
	sceneGroup:insert(dname1)
	sceneGroup:insert(dname2)
	sceneGroup:insert(develope)
	sceneGroup:insert(vname1)
	sceneGroup:insert(vname2)
	sceneGroup:insert(vname3)
	sceneGroup:insert(vname4)
	sceneGroup:insert(vname5)
	sceneGroup:insert(reference)
	sceneGroup:insert(game)
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