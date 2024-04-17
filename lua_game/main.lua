local Button = require("components.mainScreenbutton")

local button
local scaleX, scaleY
local currentPage = 1
local totalPages = 4


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
      if currentPage == 1 then
        currentPage = currentPage + 1
      elseif currentPage == 2 then
        currentPage = currentPage + 2
      elseif currentPage == 3 then
        love.event.quit()  
      end 
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
    -- love.graphics.print("Page " .. currentPage .. " of " .. totalPages, 175, 100)

   

    -- Draw additional content for the current page
    -- Draw text
    if currentPage == 1 then
        love.graphics.print("A Knights Voyage", 145, 100)
    elseif currentPage == 2 then
        love.graphics.print("Page 2 content", 100, 200)
    elseif currentPage == 3 then
        love.graphics.print("Page 3 content", 100, 200)
    end

     -- Draw button
     button:draw()

    
end
