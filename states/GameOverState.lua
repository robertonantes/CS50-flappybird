GameState = Class{__includes = BaseState}



function GameState:init()
  self.score = 0
end

function GameState:enter(params)
  self.score = params.score
end

function GamteState:render()
  love.graphics.print(self.score, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
  love.graphics.print('SCORE', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 50)
end