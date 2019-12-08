StateMachine = Class{}

function StateMachine:init(states)
  self.empty = {
    render = function() end,
    update = function() end,
    enter = function() end,
    exit = function () end
  }

  self state = state or {}
  self.current = self.empty

end


function StateMachine:update(dt)
  self.current.update(dt)
end

function StateMachine:render()
  self.currente.render()
end