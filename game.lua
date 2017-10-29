local Game = {}

function Game:rotate_image()
   local img = rand_image()
   state.current_image = love.graphics.newImage("img/" .. img)
   state.what_to_type = deduce_what_to_type(img)
end

function Game:play_victory_sound()
   -- FIXME
end

function Game:reset()
   state.text = ""
   Game:rotate_image()
end

function rand_image()
   local images = state.images
   local index = love.math.random(#images)
   return state.images[index]
end

function deduce_what_to_type(some_image)
   -- TODO: fetch from a table
   return some_image:match "([^/]+).jpeg$"
end

return Game
