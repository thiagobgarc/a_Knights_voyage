-- button.lua

local Button = {}

function Button.new(x, y, width, height, onClick)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        onClick = onClick
    }
    return self
end

function Button:isHovered()
    local mouseX, mouseY = love.mouse.getPosition()
    return mouseX > self.x and mouseX < self.x + self.width and
           mouseY > self.y and mouseY < self.y + self.height
end

function Button:update(dt)
    if self:isHovered() and love.mouse.isDown(1) then
        if self.onClick then
            self.onClick()
        end
    end
end

function Button:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Click Me", self.x, self.y + self.height / 3, self.width, "center")
end

return Button