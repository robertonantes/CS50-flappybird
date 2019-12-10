require 'Pipe'

PipePair = Class{}

local PIPE_GAP = 80
local SCROLL_SPEED = -60 

function PipePair:init()

  local upperPipeY = math.random(40, VIRTUAL_HEIGHT / 2);
  self.x = VIRTUAL_WIDTH
  self.pipes = {
    ['upper'] = Pipe(self.x, upperPipeY, 'top'),
    ['lower'] = Pipe(self.x, upperPipeY + PIPE_GAP, 'bottom')
  }
  self.remove = false;
  self.scored = false;
  
end

function PipePair:update(dt)
  if self.x + self.pipes['upper'].width > 0 then 
    self.x = self.x + SCROLL_SPEED * dt
    self.pipes['upper'].x = self.x
    self.pipes['lower'].x = self.x
  else
    self.remove = true
  end
end 


function PipePair:render()
  for k, pipe in pairs(self.pipes) do
    pipe:render()
  end
end