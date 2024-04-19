local DynamicBackground = require("components.dynamicSecScreen")
local Button = require("components.mainScreenbutton") -- Assuming the file is named mainScreenbutton.lua

local button
local scaleX, scaleY
local currentPage = 1
local totalPages = 3
local smoothTransition = 0
local speedTransition = 0.5
local currentBackgroundImage = "assets/background.jpg" -- Default background image

local pageContent = {
    [1] = {content = "A Knights Voyage", fontSize = 60},
    [2] = {content = "Page 2 content", fontSize = 32},
    [3] = {content = "Page 3 content", fontSize = 32},
}

local titleFont
local bodyFont = love.graphics.newFont(32, "mono") -- Set default body font

function love.load()
    -- Load default background
    DynamicBackground.load(currentBackgroundImage)

    -- Load title font
    titleFont = love.graphics.newFont(pageContent[currentPage].fontSize, "mono")

    -- Create button instance
    button = Button.new(10, 10, 140, 30, function()
        currentPage = (currentPage % totalPages) + 1
        smoothTransition = 0
        titleFont = love.graphics.newFont(pageContent[currentPage].fontSize, "mono") -- Update title font

        -- Toggle background image when button is clicked
        if currentBackgroundImage == "assets/background.jpg" then
            currentBackgroundImage = "assets/forest.jpg"
        else
            currentBackgroundImage = "assets/background.jpg"
        end

        -- Load new background image
        DynamicBackground.load(currentBackgroundImage)
    end)
end

function love.update(dt)
    -- Calculate scale factors
    local screenWidth, screenHeight = love.graphics.getDimensions()
    scaleX = screenWidth / DynamicBackground.backgroundImage:getWidth()
    scaleY = screenHeight / DynamicBackground.backgroundImage:getHeight()

    -- Update transition effect
    if smoothTransition < 1 then 
        smoothTransition = smoothTransition - speedTransition * dt
    end

    -- Update button
    button:update(dt)

    -- Update dynamic background
    DynamicBackground.update(playerX, playerY)
end 

function love.draw()
    -- Debug: Print draw function call
    print("Draw function called")

    -- Draw dynamic background
    DynamicBackground.draw()
    love.graphics.scale(scaleX, scaleY) -- Apply scaling
    DynamicBackground.draw()
    love.graphics.scale(1/scaleX, 1/scaleY) -- Undo scaling

    -- Draw title and text
    if pageContent[currentPage] then
        love.graphics.setFont(titleFont) -- Set the title font
        love.graphics.print(pageContent[currentPage].content, 150, 100)
    else
        love.graphics.setFont(bodyFont) -- Set the body font for the text
        love.graphics.print(pageContent[currentPage].content, 150, 150)
    end

    -- Draw button
    button:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 and x >= 10 and x <= 150 and y >= 10 and y <= 30 then
        -- Toggle background image when button is clicked
        if currentBackgroundImage == "assets/background.jpg" then
            currentBackgroundImage = "assets/forest.jpg"
        else
            currentBackgroundImage = "assets/background.jpg"
        end
     
        -- Load new background image
        DynamicBackground.load(currentBackgroundImage)
    elseif button == 1 and button:isHovered() then
        -- Button click logic
        if button.onClick then
            button.onClick()
        end
    end
end