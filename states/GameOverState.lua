GameOverState = Class{__includes = BaseState}

function GameOverState:enter(params)
  self.score = params.score
end

function GameOverState:render()

  love.graphics.setFont(bigFont)
  love.graphics.printf(self.score, 0, 100, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(smallFont)
  love.graphics.printf('Press Enter to play again', 0, 150, VIRTUAL_WIDTH, 'center')
end