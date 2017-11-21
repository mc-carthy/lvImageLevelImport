cellSize = 16

tileMapDictionary = {}
tileMapDictionary['black'] = '0,0,0,255'

mapData = {}

function love.load()
    importImageData('maps/testMap0.png')
end

function love.update(dt)

end

function love.draw()
    for x = 0, imageWidth do
        for y = 0, imageHeight do
            if mapData[x][y] == tileMapDictionary['black'] then
                love.graphics.setColor(0, 0, 0, 255)
            else
                love.graphics.setColor(0, 191, 191, 255)
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
            r, g, b, a = imageData:getPixel(x, y)
            mapData[x][y] = r .. ',' .. g .. ',' .. b .. ',' .. a
        end
    end
end