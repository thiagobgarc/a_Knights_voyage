local DynamicBackground = {}

function DynamicBackground.load(imagePath)
    -- Load background
    DynamicBackground.backgroundImage = love.graphics.newImage(imagePath)
    if not DynamicBackground.backgroundImage then
        error("Failed to load background image: " .. imagePath)
    end
    DynamicBackground.bgX = 0
    DynamicBackground.bgY = 0
end

function DynamicBackground.update(playerX, playerY)
    -- Update background based on player position
    DynamicBackground.bgX = playerX
    DynamicBackground.bgY = playerY
end

function DynamicBackground.draw()
    -- Draw background
    love.graphics.draw(DynamicBackground.backgroundImage, DynamicBackground.bgX, DynamicBackground.bgY)
end

return DynamicBackground