local Game = require("game")

function love.load()
   Game:initialize()
   Game:rotate_image()
   love.graphics.setNewFont(22)
end

function love.textinput(t)
   Game:handle_input(t)
end

function love.update(dt)
   if love.keyboard.isDown("backspace") then
      Game:reset()
   end

   if Game:is_won() then
      Game:reset()
      Game:rotate_image()
   elseif Game:is_closer() then
      flash_progress()
   else
      flash_mistake()
   end
end

function flash_mistake()
   -- FIXME
   love.graphics.setBackgroundColor(255, 0, 0)
end

function flash_progress()
   -- FIXME
   love.graphics.setBackgroundColor(0, 255, 0)
end

function love.draw()
   love.graphics.draw(Game:state().current_image, 10, 10)
   love.graphics.print(Game:state().text, 10, 500)
   love.graphics.print(Game:state().what_to_type, 10, 400)
end
