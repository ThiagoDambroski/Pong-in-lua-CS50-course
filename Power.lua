Power =  Class{}

function Power:init(player1,player2)
    self.x1 = player1.x
    self.x2 = player2.x
    self.widht = 3
    self.height = 3
    self.can_apper = false
    self.lucky_player = 0
    self.random_number = math.random(0,100)
    self.frame = 0

    
end


function Power:chance_of_appering()
    self.number = math.random(1,200)
    self.chance = 15
    if self.number > 100 then
       self.lucky_player = 2
       self.number = self.number - 100
    else
        self.lucky_player = 1
   end
        
  if self.chance >= self.compartive_number then
        self.can_apper = true
  else
    self.can_apper = false
    end

    
end

function Power:update(dt)
    self.compartive_number = math.random(1,100)
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
        if self.lucky_player == 1 then
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle('fill',self.x1,self.random_number,3,3)
        else
            love.graphics.setColor(255,0,0)
            love.graphics.rectangle('fill',self.x2,self.random_number,3,3)
        end
    end
    
    
end