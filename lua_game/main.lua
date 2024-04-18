local Button = require("components.mainScreenbutton")

local button
local scaleX, scaleY
local currentPage = 1
local totalPages = 3
local smoothTransition = 0
local speedTransition = 0.5

local pageContent = {
    [1] = {content = "A Knights voyage", fontSize = 60},
    [2] = {content = "Page 2 content", fontSize = 32},
    [3] = {content = "Page 3 content", fontSize = 32},
}

local titleFont
local bodyFont = love.graphics.newFont(32, "mono") -- Set default body font

function love.load()
    -- Load background
    background = love.graphics.newImage("assets/background.jpg")
    if not background then
        error("Failed to load background image")
    end

    -- Load title font
    titleFont = love.graphics.newFont(pageContent[currentPage].fontSize, "mono")

    -- Create button instance
    button = Button.new(300, 400, 200, 75, function()
        currentPage = (currentPage % totalPages) + 1
        smoothTransition = 0
        titleFont = love.graphics.newFont(pageContent[currentPage].fontSize, "mono") -- Update title font
    end)
end

function love.update(dt)
    -- Calculate scale factors
    local screenWidth, screenHeight = love.graphics.getDimensions()
    scaleX = screenWidth / background:getWidth()
    scaleY = screenHeight / background:getHeight()

    -- Update transition effect
    if smoothTransition < 1 then 
        smoothTransition = smoothTransition - speedTransition * dt
    end

    -- Update button
    if button then
        button:update(dt)
    end
end 

function love.draw()
    -- Debug: Print draw function call
    print("Draw function called")

    -- Draw background
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)

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