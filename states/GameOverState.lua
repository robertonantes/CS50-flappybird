GameOverState = Class{__includes = BaseState}




function GameOverState:enter(params)
  self.score = params.score
end

function GameOverState:render()
  love.graphics.print(self.score, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
  love.graphics.print('SCORE', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 50)
end