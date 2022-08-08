-----------------------------------------------------------------------------------------
--
-- prologue.lua 산의 소문
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")

	-- 오브젝트들 배치 --
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local guide = display.newImage("image/public/지천.png")
	guide.x, guide.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

	local lines = display.newImage("image/dialogue/대사창.png")
	lines.x, lines.y = display.contentWidth * 0.5, display.contentHeight * 0.8

	local next = display.newImage("image/dialogue/다음.png")
	next.x, next.y = display.contentWidth * 0.925, display.contentHeight * 0.88

	-- 더미 대사, 더미 이름--

	local script = display.newText("더미텍스트", display.contentWidth*0.505, display.contentHeight*0.785, display.contentWidth * 0.88, display.contentWidth * 0.1, "font/경기천년바탕_Regular.ttf")
	script.size = 29
	script.align = "left"
	script:setFillColor(0)

	--fade--

	local options =
	{ 
		effect = "crossFade",
    	time = 500
    }

	-- json에서 정보 읽기
	local Data = jsonParse("json/prologue.json")

	-- json에서 읽은 정보 적용하기
	local index = 0

	--json으로 내용 바꾸기--
	local function nextScript( )
		index = index + 1

		if (index > #Data) then
			audio.stop()
 			audio.dispose(BGM)
 			BGM = audio.loadSound("sound/02. 마을_Elemental Forest.mp3")
	    	audio.play(BGM, {channel=1, loops=-1})
			composer.gotoScene('scenario1', options)
			composer.removeScene('prologue')
			return
		end

		if (Data[index].type == "background") then
			background:setFillColor(0)
			script.text = Data[index].content
		elseif (Data[index].type == "narration") then
			script.text = Data[index].content
		end
	end

	--다음 대사--
	local function tap(event)
		nextScript()
	end
	next:addEventListener("tap", tap)

	--처음 대사 자동으로--
	nextScript()

	--layer 정리--

	sceneGroup:insert(background)
	sceneGroup:insert(set)
	sceneGroup:insert(guide)
	sceneGroup:insert(item)
	sceneGroup:insert(lines)
	sceneGroup:insert(script)
	sceneGroup:insert(next)
	--설정창--

	function set:tap( event )
		audio.play(click)
		local option = {
				isModal = true,
				effect = "fade",
				tiem = 400,
				params = {}
		}
 		composer.showOverlay('setting', option)
 	end
 	set:addEventListener("tap", set)

 	function item:tap( event )
 		audio.play(click)
 		local option = {
				isModal = true,
				effect = "fade",
				tiem = 400,
				params = {}
		}
 		composer.showOverlay('items0', option)
 	end
 	item:addEventListener("tap", item)

 	function guide:tap( event )
 		audio.play(click)
 		local option = {
				isModal = true,
				effect = "fade",
				tiem = 400,
				params = {}
		}
 		composer.showOverlay('info', option)
 	end
 	guide:addEventListener("tap", guide)

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