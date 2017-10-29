Cards = {}

local cards = {
   -- FIXME figure out how to display ż
   {word = "żyrafa", file = "img/zyrafa.jpeg"},
   {word = "kot",    file = "img/koteg.jpeg"},
   {word = "pies",   file = "img/pieseu.jpeg"}
}

local last_pick = nil

function Cards:random()
  local index = love.math.random(#cards)
  if index == last_pick then
     return Cards:random()
  else
     for i, v in ipairs(cards) do
        if i == index then
           last_pick = index
           return v
        end
     end
  end
end

return Cards
