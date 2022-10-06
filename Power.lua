Power =  Class{}

function Power:init(player1,player2)
    self.player1 = player1
    self.player2 = player2
    self.x = 0
    self.widht = 3
    self.height = 3
    self.can_apper = false
    self.lucky_player = 0
    self.y = math.random(0,100)
    self.frame = 0

    
end


function Power:chance_of_appering()
    self.compartive_number = 0
    self.number = math.random(1,200)
    self.compartive_number = math.random(1,100)
    self.chance = 15
    if self.number > 100 then
       self.lucky_player = 2
       self.x = self.player2.x
       self.number = self.number - 100
    else
        self.lucky_player = 1
        self.x = self.player1.x
   end
    
  if self.chance >= self.compartive_number then
        self.can_apper = true
  else
    self.can_apper = false
    end

    
end

function Power:collides(paddle)
    if self.can_apper then
        if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
            return false
           else 
            return true
           end
    end
   
        
end




function Power:update(dt)
    
   if self.can_apper then
        self.frame = self.frame + 1
       self.seconds = self.frame/60 
        if self.seconds >= 4 then
            self.can_apper = false
            self.frame = 0
            self.seconds = 0
   end
 end 
end

function Power:render()
    
    if self.can_apper then
       
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle('fill',self.x,self.y,3,3)
        
    end
    
    
end