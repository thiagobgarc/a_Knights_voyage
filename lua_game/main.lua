local Button = require("components.mainScreenbutton")

local button
local scaleX, scaleY

function love.load()
    -- Load font to 32
    love.graphics.setFont(love.graphics.newFont(50))
    
    -- Load image
    background = love.graphics.newImage("assets/background.jpg")

    -- Create button instance
    button = Button.new(100, 100, 200, 50, function() love.event.quit() end)
end 

function love.update(dt)
    -- Calculate scale factors
    local screenWidth, screenHeight = love.graphics.getDimensions()
    scaleX = screenWidth / background:getWidth()
    scaleY = screenHeight / background:getHeight()

    -- Update button
    button:update(dt)
end 

function love.draw()
    -- Draw background
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)

    -- Draw text
    love.graphics.print("A Knights Voyage", 175, 100)

    -- Draw button
    button:draw()
end
