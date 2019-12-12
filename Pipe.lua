Pipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('assets/pipe.png');
local SCROLL_SPEED = -60



function Pipe:init(x, y, orientation)

  self.orientation = orientation;
  self.width = PIPE_IMAGE:getWidth()
  self.height = PIPE_IMAGE:getHeight()

  self.x = x
  self.y = y 

end


function Pipe:render()
  local yScale = self.orientation == 'top' and -1 or 1
  love.graphics.draw(PIPE_IMAGE, self.x, self.y, 0, 1, yScale)
end