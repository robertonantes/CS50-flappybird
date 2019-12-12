PlayState = Class{__includes = BaseState}

local SPAWN_INTERVAL = 2.5
local PIPE_WIDTH = 70

function PlayState:init()
  self.bird = Bird()
  self.pipePairs = {}
  self.spawnTimer = 0
  self.score = 0
end

function PlayState:update(dt)

  self.spawnTimer = self.spawnTimer + dt

  if(self.spawnTimer > SPAWN_INTERVAL) then
    table.insert(self.pipePairs, PipePair())
    self.spawnTimer = 0
  end

  for k, pipe in pairs(self.pipePairs) do
    pipe:update(dt)
    self:checkForScore(pipe)
  end

  self.bird:update(dt)

  for k, pipe in pairs(self.pipePairs) do
    if pipe.remove then
      table.remove(self.pipePairs, k)
    end
  end
end

function PlayState:checkForScore(pipe)
  if(pipe.x + PIPE_WIDTH < self.bird.x and not pipe.scored) then
    self.score = self.score + 1
    pipe.scored = true
  end
end

function PlayState:render()
  
  for k, pipe in pairs(self.pipePairs) do 
    pipe:render()
  end
  self.bird:render()
  love.graphics.print('Score: ' .. tostring(self.score), 30, 30)


end

