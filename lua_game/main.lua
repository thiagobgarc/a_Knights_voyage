local Button = require("components.mainScreenbutton")

local button
local scaleX, scaleY
local currentPage = 1
local totalPages = 3

local pageContent = {
    "A Knights voyage",
    "Page 2 content",
    "Page 3 content",
}


function love.load()
    -- Load font to 32
    love.graphics.setFont(love.graphics.newFont(60, "mono"))
    
    -- Load image
    background = love.graphics.newImage("assets/background.jpg")
    if not background then
        error("Failed to load background image")
    end

    -- Create button instance
    button = Button.new(300, 400, 200, 75, function()
        currentPage = (currentPage % totalPages) + 1
    end)
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
    if pageContent[currentPage] then
        love.graphics.print(pageContent[currentPage], 100, 200)
    end

     -- Draw button
     button:draw()

    
end
