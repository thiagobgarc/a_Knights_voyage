local Button = require("components.mainScreenbutton")

local button
local scaleX, scaleY

function love.load()
    -- Load font to 32
    love.graphics.setFont(love.graphics.newFont(50))
    
    -- Load image
    background = love.graphics.newImage("assets/background.jpg")
    if not background then
        error("Failed to load background image")
    end

    -- Create button instance
    button = Button.new(300, 400, 200, 75, function() love.event.quit() end)
end 

function love.update(dt)
    -- Calculate scale factors
    local screenWidth, screenHeight = love.graphics.getDimensions()
    scaleX = screenWidth / background:getWidth()
    scaleY = screenHeight / background:getHeight()

    -- Update button
    if button then
        button:update(dt)
    end
end 

function love.draw()
   
    -- Draw background
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)

    -- Draw text
    love.graphics.print("A Knights Voyage", 175, 100)

    -- Draw button
    button:draw()

    
end
