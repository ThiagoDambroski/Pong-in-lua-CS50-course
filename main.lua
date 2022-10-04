
push = require 'push'
Class = require 'class'

require 'Paddle'
require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720 

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200


function love.load()

    love.graphics.setDefaultFilter("nearest","nearest")

    love.window.setTitle("Pong")

    math.randomseed(os.time())

    newFont = love.graphics.newFont('font.ttf',8)

    love.graphics.setFont(newFont)

    newFontBigger = love.graphics.newFont('font.ttf',32) 

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,
    {fullscreen = false, resizable= false, vsync = true})

    player1Score = 0
    player2Score = 0

    player1 = Paddle(10,30,5,20,'w','s')

    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30,5,20,'up','down')

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    

    gameState = 'start'
    
end

function love.update(dt)
     if gameState == 'play' then


        if ball:collides(player1) then
            ball.dx = -ball.dx * 1.03
            ball.x = player1.x + 5

            if ball.dy < 0 then
                ball.dy = -math.random(10,150)
            else
                ball.dy = math.random(10,150)
            end
        end


        if ball:collides(player2) then
            ball.dx = -ball.dx * 1.03
            ball.x = player2.x -4 
            
            if ball.dy < 0 then
                ball.dy = -math.random(10,150)
            else
                ball.dy = math.random(10,150)
            end
        end

        if ball.y <= 0 then
            ball.y = 0
            ball.dy = -ball.dy
        end

        if ball.y >= VIRTUAL_HEIGHT - 4 then
            ball.y = VIRTUAL_HEIGHT - 4
            ball.dy = -ball.dy
        end


     end


--- player 1
    player1:update(dt)
--- player 2
    player2:update(dt)

    if gameState == 'play' then
        ball:update(dt)
        
    end

end


function love.keypressed(key)
    
    if key == 'escape' then
        
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ball:reset()

        end
    end
    
end

function love.draw()
   
    push:apply('start')
    
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.setFont(newFont)
    
    if gameState == 'start' then 
        love.graphics.printf('gamestate start', 0, 20, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('gamestate play', 0, 20, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(newFontBigger)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score),VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    
---left
   player1:render()

---right
    player2:render()

---ball
    ball:render()

    displayFPS()

    push:apply('end')
end

function displayFPS()
    love.graphics.setFont(newFont)
    love.graphics.setColor(0,255,0,255)
    love.graphics.print('FPS: '.. tostring(love.timer.getFPS()),10,10)
end