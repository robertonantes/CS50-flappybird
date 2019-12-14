CountdownState = Class { __includes = BaseState }

local COUNTDOWN_TIME = 3.5

function CountdownState:enter()
  love.graphics.setFont(bigFont) 
  self.timer = COUNTDOWN_TIME
end

function CountdownState:update(dt)
  self.timer = self.timer - dt 
  if(self.timer <= 0.5) then
    gStateMachine:change('play')
  end
end

function CountdownState:render()
  love.graphics.printf(tostring(math.floor(self.timer + 0.5)), 0, 100, VIRTUAL_WIDTH, 'center')
end