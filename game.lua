local Game = {}
local Cards = require("cards")
local state = {}

function Game:initialize()
   state.what_to_type = nil
   state.text = ""
end

function Game:state()
   return state
end

function Game:rotate_image()
   local card = Cards:random()
   state.current_image = love.graphics.newImage(card.file)
   state.what_to_type = card.word
end

function Game:handle_input(input)
    state.text = state.text .. input
end

function Game:is_won()
   return state.text == state.what_to_type
end

function Game:is_closer()
   index, length = string.find(state.what_to_type, state.text)
   return index == 1 and length == #state.text
end

function Game:play_victory_sound()
   -- FIXME
end

function Game:reset()
   state.text = ""
end

return Game
