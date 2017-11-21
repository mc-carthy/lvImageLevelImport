cellSize = 16

colours = { ["black"] = {0, 0, 0, 255}, ["blue"] = {0, 0, 255, 255} }

mapData = {}

function love.load()
    importImageData('maps/testMap0.png')
end

function love.update(dt)

end

function love.draw()
    for x = 0, imageWidth do
        for y = 0, imageHeight do
            if compareColourTables(mapData[x][y],colours['black']) == true then
                love.graphics.setColor(colours['black'])
            else
                love.graphics.setColor(colours['blue'])
            end
            love.graphics.rectangle('fill', x * cellSize, y * cellSize, cellSize, cellSize)
        end
    end
end

function importImageData(fileLocation)
    imageData = love.image.newImageData(fileLocation)
    imageWidth = imageData:getWidth() - 1
    imageHeight = imageData:getHeight() - 1

    for x = 0, imageWidth do
        mapData[x] = {}
        for y = 0, imageHeight do
            mapData[x][y] = {imageData:getPixel(x, y)}
        end
    end
end

function compareColourTables(t1, t2)
    -- Compares the r, g, b, a values for two tables
    for i=1, 4, 1 do
        if t1[i] ~= t2[i] then return false end
    end
    return true
end