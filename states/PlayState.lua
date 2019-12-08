PlayState = Class{__includes = BaseState}

local SPAWN_INTERVAL = 2.5

function PlayState:init()
  self.bird = Bird()
  self.pipePairs = {}
  self.spawnTimer = 0
end

function PlayState:update(dt)
  self.spawnTimer = self.spawnTimer + dt

  if(self.spawnTimer > SPAWN_INTERVAL) then
    table.insert(self.pipePairs, PipePair())
    self.spawnTimer = 0
  end

  for k, pipe in pairs(self.pipePairs) do
    pipe:update(dt)
  end

  self.bird:update(dt)

  for k, pipe in pairs(self.pipePairs) do
    if pipe.remove then
      table.remove(self.pipePairs, k)
    end
  end

end

function PlayState:render()
  
  for k, pipe in pairs(pipePairs) do 
    pipe:render()
  end
  self.bird:render()

end

