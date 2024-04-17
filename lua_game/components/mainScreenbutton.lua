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
    
    setmetatable(self, { __index = Button })
    
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
    local cornerRadius = 10
    love.graphics.setColor(150 / 255, 75 / 255, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, cornerRadius, cornerRadius)
    love.graphics.setColor(.9, .9, .9)
    love.graphics.printf("Play", self.x, self.y + self.height / 23, self.width, "center")
end

return Button