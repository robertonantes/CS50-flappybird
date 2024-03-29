push = require 'push'

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 450

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

Class = require 'class'
require 'states/BaseState'
require 'Bird'
require 'PipePair'
require 'states/TitleScreenState'
require 'states/CountdownState'
require 'states/PlayState'
require 'states/GameOverState'
require 'StateMachine'

-- images
local background = love.graphics.newImage('assets/background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('assets/ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60
local BACKGROUND_LOOPING_POINT = 413
local SPAWN_INTERVAL = 2.5

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle('Flappy Bird')

  smallFont = love.graphics.newFont('assets/font.ttf', 16)
  bigFont = love.graphics.newFont('assets/font.ttf', 48)
  love.graphics.setFont(smallFont)

  sounds = {
    ['flap'] = love.audio.newSource('assets/flap.wav', 'static'),
    ['scored'] = love.audio.newSource('assets/scored.wav', 'static'),
    ['collision'] = love.audio.newSource('assets/collision.wav', 'static'),
    ['music'] = love.audio.newSource('assets/marios_way.mp3', 'static')
  }

  sounds['music']:setLooping(true)
  sounds['music']:play()



  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizabe = true
  })

  gStateMachine = StateMachine{
    ['titleScreen'] = function() return TitleScreenState() end,
    ['countdown'] = function() return CountdownState() end,
    ['play'] = function() return PlayState() end,
    ['gameOver'] = function() return GameOverState() end
  }

  gStateMachine:change('titleScreen')

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

  gStateMachine:update(dt);

  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

  love.graphics.draw(background, -backgroundScroll, 0)

  gStateMachine:render()

  love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)


  push:finish()
end
