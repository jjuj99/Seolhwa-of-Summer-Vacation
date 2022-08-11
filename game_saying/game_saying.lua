-----------------------------------------------------------------------------------------
--
-- saying_game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
   local sceneGroup = self.view
   
   local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)


   -- 본격 게임화면

   --local subBackground = display.newRect(display.contentCenterX, display.contentCenterY, 800, 450)
   local subBackground = display.newImage("image/saying_game/보드.png", 800, 450)
   subBackground.x, subBackground.y = display.contentWidth*0.15 + 450, display.contentHeight*0.15 + 240
   subBackground.alpha = 0.6
   subBackground:scale(1.3, 1.3)
   --subBackground:setFillColor(0.67,0.509,0)

   -- 문제번호 배경
   --local bg1 = display.newRect(display.contentCenterX, display.contentCenterY, 100, 100)
   local bg1 = display.newImage("image/saying_game/문제번호.png", 100, 100)
   bg1.x, bg1.y = display.contentWidth*0.25, display.contentHeight*0.265
   --bg1.alpha = 0.4
   --bg1:setFillColor(1, 1, 0.8313)
   bg1:scale(1.35, 1.35)

   -- 문제번호
   local queNum = display.newText(0, display.contentWidth * 0.25, display.contentHeight * 0.265, "font/경기천년바탕_Regular.ttf")
   queNum.font = "경기청년바탕_Regular"
   queNum.size = 60
   queNum:setFillColor(1) 
   queNum:toFront()
   

   -- 문제내용 배경
   --local bg2 = display.newRect(display.contentCenterX, display.contentCenterY, 250, 100)
   local bg2 = display.newImage("image/saying_game/문제.png", 250, 100)
   bg2.x, bg2.y = display.contentWidth*0.4, display.contentHeight*0.265
   bg2:scale(1.2, 1.35)
   --bg2.alpha = 0.4
   --bg2:setFillColor(1, 1, 0.8313)


   -- 문제내용
   local queCtn = display.newText("문제 내용", display.contentWidth * 0.4, display.contentHeight * 0.265, "font/경기천년바탕_Regular.ttf")
   queCtn.size = 20
   queCtn:setFillColor(0) 
   queCtn:toFront()
   queCtn.align = "middle"

   -- 보기 배경
   --local ex = display.newRect(display.contentCenterX, display.contentCenterY, 370, 300)
   local ex = display.newImage("image/saying_game/보기.png", 368, 290)
   ex.x, ex.y = display.contentWidth * 0.355, display.contentHeight * 0.547
   ex:scale(1.27, 1.085)
   --ex.alpha = 0.4
   --ex:setFillColor(1, 1, 0.8313)

   -- 보기
   local exCtn = display.newText("보기", display.contentWidth * 0.35, display.contentHeight * 0.53, "font/경기천년바탕_Regular.ttf")
   exCtn.size = 30
   exCtn:setFillColor(0)
   exCtn:toFront()
   exCtn.align = "middle"

   local qbg = {}

 
   qbg[1] = display.newImage("image/saying_game/문항.png", 370, 100)
   qbg[1].x, qbg[1].y = display.contentWidth * 0.65, display.contentHeight * 0.265
   qbg[1]:scale(1.24, 1.35)

   qbg[2] = display.newImage("image/saying_game/문항.png", 370, 100)
   qbg[2].x, qbg[2].y = display.contentWidth * 0.65, display.contentHeight * 0.407
   qbg[2]:scale(1.24, 1.35)

   qbg[3] = display.newImage("image/saying_game/문항.png", 370, 100)
   qbg[3].x, qbg[3].y = display.contentWidth * 0.65, display.contentHeight * 0.549
   qbg[3]:scale(1.24, 1.35)

   qbg[4] = display.newImage("image/saying_game/문항.png", 370, 100)
   qbg[4].x, qbg[4].y = display.contentWidth * 0.65, display.contentHeight * 0.690
   qbg[4]:scale(1.24, 1.35)



   

   local set = display.newImage("image/public/설정.png") -- 고정
   set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

   local guide = display.newImage("image/public/지천.png") -- 고정
   guide.x, guide.y = display.contentWidth * 0.853, display.contentHeight * 0.09

   local item = display.newImage("image/public/아이템.png") -- 고정
   item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

-----------------------------------------------------------------------------------------------일부러 유영, 차영 앞에(백그라운드)
   
   local commentBackground = display.newRect(display.contentCenterX, display.contentCenterY + 300, display.contentWidth, 200)
   commentBackground:setFillColor(0.2)
   commentBackground.alpha = 0
   

   function makeGround()
      commentBackground = display.newRect(display.contentCenterX, display.contentCenterY + 300, display.contentWidth, 200)
      commentBackground:setFillColor(0.2)
      commentBackground.alpha = 0.3
   end


   local yycha = display.newImage("image/public/인물1.png") --청자는 어둡게 할 필요 있음
   yycha.x, yycha.y = display.contentWidth * 0.1, display.contentHeight * 0.95 
   yycha:toFront()

   local chongyoung = display.newImage("image/character/총영_일반.png") --청자는 어둡게 할 필요 있음
   chongyoung.x, chongyoung.y = display.contentWidth * 0.9, display.contentHeight * 0.95 
   chongyoung:toFront()

   local saying1 = display.newText(" ", display.contentWidth * 0.65, display.contentHeight * 0.265, "font/경기천년바탕_Regular.ttf")
   saying1:setFillColor(0)
   saying1.size = 16
   saying1:toFront()
   saying1.align = "middle"

   local saying2 = display.newText(" ", display.contentWidth * 0.65, display.contentHeight * 0.407, "font/경기천년바탕_Regular.ttf")
   saying2:setFillColor(0)
   saying2.size = 16
   saying2:toFront()
   saying2.align = "middle"

   local saying3 =  display.newText(" ", display.contentWidth * 0.65, display.contentHeight * 0.549, "font/경기천년바탕_Regular.ttf")
   saying3:setFillColor(0)
   saying3.size = 16
   saying3:toFront()
   saying3.align = "middle"

   local saying4 = display.newText(" ", display.contentWidth * 0.65, display.contentHeight * 0.690, "font/경기천년바탕_Regular.ttf")
   saying4:setFillColor(0)
   saying4.size = 16
   saying4:toFront()
   saying4.align = "middle"

   local options =
   { 
      effect = "fade",
      time = 1000
    }

   --json에서 정보 읽기
   local Data = jsonParse( "json/saying_example.json" )

   local index = 0
   local score = 0
  

   local comment = display.newText(" ", display.contentWidth * 0.5, display.contentHeight * 0.9, "font/경기천년바탕_Regular.ttf")
   comment:setFillColor(0)
   comment.size = 50


   local function nextScript( )
      --문제번호, index 각각 +1
      
      index = index + 1
      queNum.text = queNum.text + 1

      if(index >= #Data) then 

         if(score >= 7) then
            audio.stop()
            BGM = audio.loadSound("sound/10. 총영 성공 후_My home.mp3")
            audio.play(BGM, {channel=1, loops=-1})
            composer.gotoScene('scenario9', option)
            composer.removeScene('game_saying', option)
            return

         else
            composer.gotoScene('fail', option)
            composer.removeScene('game_saying')   
            return   
         end
      end


      if(Data[index].type == "sayings") then

         queCtn.text = Data[index].question
         exCtn.text = Data[index].exCtn
         
         saying1.text = Data[index].saying1
         saying2.text = Data[index].saying2
         saying3.text = Data[index].saying3
         saying4.text = Data[index].saying4
  
      end
      
      --

   
   end

   local function tap(event)

     --
           nextScript()
   end


-- 미완,, (클릭 시 코멘트 부분) (점수 카운트는 됨)

   function selectAnswer1() 

      chongyoung.alpha = 0
      myAnswer = 1

      if(index == 1 or index == 8 or index == 10) then
         if(myAnswer == Data[index].answer) then
            score = score + 1

            commentBackground.alpha = 0 

            chongyoung = display.newImage("image/character/총영_반짝눈.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
            makeGround()
            comment.text = "후후, 제법 똑똑한 걸?"

           
         else
            
            chongyoung = display.newImage("image/character/총영_화내는.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
            comment.text = "다시 한 번 생각해보자"
         end


      end


      nextScript()
   end

   function selectAnswer2() 

      chongyoung.alpha = 0

      if(index == 3 or index == 6) then
         if(Data[index].answer == 2) then

            score = score + 1

            commentBackground.alpha = 0
            makeGround()
            chongyoung = display.newImage("image/character/총영_반짝눈.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
            
            comment.text = "그런 의미였구나!"

         

         elseif(Data[index].answer ~= 2) then
            comment.text = "정말 그게 맞을까?"
         end 
            
      end
      nextScript()
   end

   function selectAnswer3() 

      chongyoung.alpha = 0

      if(index == 2 or index == 4 or index == 7 or index == 9) then
         if(Data[index].answer == 3) then
            score = score + 1

            commentBackground.alpha = 0
            makeGround()
            chongyoung = display.newImage("image/character/총영_반짝눈.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
            comment.text = "어머, 그렇구나!"
         

         elseif(Data[index].answer ~= 3) then
            comment.text = "... ... 글쎄다" 
            chongyoung = display.newImage("image/character/총영_화내는.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
  
         end
           
      end
      nextScript()
   end

   function selectAnswer4() 

      chongyoung.alpha = 0

      if(index == 5) then
         if(Data[index].answer == 4) then
            score = score + 1

            commentBackground.alpha = 0
            makeGround(options)
            chongyoung = display.newImage("image/character/총영_반짝눈.png", display.contentWidth * 0.9, display.contentHeight * 0.95)
            comment.text = "새로운 걸 알았네"
         end

         if(Data[index].answer ~= 4) then
            comment.text = "음.. 어린이는 역시 어린인가" 
         end 
            
      end
      nextScript()
   end
   


   qbg[1]:addEventListener("tap", selectAnswer1)
   qbg[2]:addEventListener("tap", selectAnswer2)
   qbg[3]:addEventListener("tap", selectAnswer3)
   qbg[4]:addEventListener("tap", selectAnswer4)

   nextScript()


   --layer 정리--

   sceneGroup:insert(background) 
   sceneGroup:insert(subBackground) 
   sceneGroup:insert(bg1) 
   sceneGroup:insert(queNum) 
   sceneGroup:insert(bg2) 
   sceneGroup:insert(queCtn) 
   sceneGroup:insert(ex) 
   sceneGroup:insert(exCtn) 


   sceneGroup:insert(qbg[1])
   sceneGroup:insert(qbg[2])
   sceneGroup:insert(qbg[3])
   sceneGroup:insert(qbg[4])

   sceneGroup:insert(saying1)
   sceneGroup:insert(saying2)
   sceneGroup:insert(saying3)
   sceneGroup:insert(saying4)

   --sceneGroup:insert(score)
   sceneGroup:insert(set)
   sceneGroup:insert(guide)
   sceneGroup:insert(item)
   sceneGroup:insert(yycha)
   sceneGroup:insert(chongyoung)
   

----------------------------------------------------setting 기본 설정 

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
      composer.showOverlay('items', option)
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
--
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
      composer.removeScene("saying_game")
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