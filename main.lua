local Game = require("game")
state = {}

function love.load()
   -- all images on rotation
   state.images = love.filesystem.getDirectoryItems("img")

   state.what_to_type = "exit"
   state.text = ""

   Game:rotate_image()

   love.graphics.setNewFont(22)
end

function love.textinput(t)
    state.text = state.text .. t
    if state.text == state.what_to_type then
       Game:reset()
       Game:play_victory_sound()
    end
end

function love.update(dt)
   if love.keyboard.isDown("backspace") then
      Game:reset()
   end
end

function love.draw()
   love.graphics.draw(state.current_image, 10, 10)
   love.graphics.print(state.text, 10, 500)
   love.graphics.print(state.what_to_type, 10, 400)
end
