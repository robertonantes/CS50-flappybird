push = require 'push'

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 450

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

Class = require 'class'
require 'Bird'
require 'PipePair'

-- images
local background = love.graphics.newImage('assets/background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('assets/ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60
local BACKGROUND_LOOPING_POINT = 413
local SPAWN_INTERVAL = 2.5

local bird = Bird()
local pipes = {}
local spawnTimer = 0;


function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Flappy Bird')

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizabe = true
  })

  love.keyboard.keysPressed = {}
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
    return true
  else
    return false
  end
end

function love.update(dt)
  backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
  groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH

  spawnTimer = spawnTimer + dt
  if(spawnTimer > SPAWN_INTERVAL) then
    table.insert(pipes, PipePair())
    spawnTimer = 0
  end
  
  for k, pipe in pairs(pipes) do
    pipe:update(dt)
  end
  
  bird:update(dt)

  for k, pipe in pairs(pipes) do
    if pipe.remove then
      table.remove(pipes, k)
    end
  end

  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

  love.graphics.draw(background, -backgroundScroll, 0)
  
  for k, pipe in pairs(pipes) do 
    pipe:render()
  end

  love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
  
  bird:render()

  push:finish()
end
