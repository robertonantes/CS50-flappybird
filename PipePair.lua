require 'Pipe'

PipePair = Class{}

local PIPE_GAP = 80

function PipePair:init()

  local upperPipeY = math.random(40, VIRTUAL_HEIGHT / 2);
  self.pipes = {
    ['upper'] = Pipe('top', upperPipeY),
    ['lower'] = Pipe('bottom', upperPipeY + PIPE_GAP)
  }
  self.remove = false;
end

function PipePair:update(dt)
  
  for k, pipe in pairs(self.pipes) do
    pipe:update(dt)
    if(pipe.x + pipe.width < 0) then
      self.remove = true
    end
  end
end 


function PipePair:render()
  for k, pipe in pairs(self.pipes) do
    pipe:render()
  end
end