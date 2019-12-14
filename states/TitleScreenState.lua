TitleScreenState = Class{__includes = BaseState}


function TitleScreenState:update(dt)
  if love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end

function TitleScreenState:render()
  love.graphics.setFont(bigFont)
  love.graphics.printf('Clone bird', 0, 100, VIRTUAL_WIDTH, 'center')
  love.graphics.setFont(smallFont)
  love.graphics.printf('Press enter no play', 0, 150, VIRTUAL_WIDTH, 'center')
end