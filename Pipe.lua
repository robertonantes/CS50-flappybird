Pipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('assets/pipe.png');
local SCROLL_SPEED = -60



function Pipe:init(orientation, y)

  self.orientation = orientation;
  self.width = PIPE_IMAGE:getWidth()

  self.x = VIRTUAL_WIDTH
  self.y = y 

end


function Pipe:update(dt)
  self.x = self.x + SCROLL_SPEED * dt
end

function Pipe:render()
  local yScale = self.orientation == 'top' and -1 or 1
  love.graphics.draw(PIPE_IMAGE, self.x, self.y, 0, 1, yScale)
end