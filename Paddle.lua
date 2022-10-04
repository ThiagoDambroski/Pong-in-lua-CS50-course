
Paddle = Class{}

function Paddle:init(x,y,width,height,keyUp,keyDown)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.keyUp = keyUp
    self.keyDown = keyDown
    
end




function Paddle:update(dt)
    if love.keyboard.isDown(self.keyDown) then
       self.y = math.min(VIRTUAL_HEIGHT -20,self.y + PADDLE_SPEED * dt)
    elseif love.keyboard.isDown(self.keyUp) then
       self.y = math.max(0, self.y + -PADDLE_SPEED * dt)
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    
end