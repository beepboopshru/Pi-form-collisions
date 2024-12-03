Class = require "class"
require "block"
-- Count is the number of collisions
count = 0
-- digits is the number of digits of PI to be calculated
digits = 5
-- Time step is used to avoid the block going of screen
timeSteps = 7 ^ (digits - 1)
function love.load()
    clack = love.audio.newSource('clack.wav', 'static')
    love.window.setMode(1280, 720)
    block1 = Block(100, 50, 1, 0)
    --m2 = 1
    m2 = 100^ (digits-1);
    block2 = Block(160, 200, m2, -1 / timeSteps)
    font0 = love.graphics.newFont("font0.ttf", 20)
    font1 = love.graphics.newFont("font1.ttf", 50)
    love.graphics.setLineWidth(10)
end

function love.update(dt)
    -- Only play clacksound when finish the loop
    clackSound = false
    for i = 1, timeSteps do
        -- If the two Blocks collide then calculate the new V and increase the count
        if block1:Collides(block2) then
            v1 = block1:Bounce(block2)
            v2 = block2:Bounce(block1)
            block1.v = v1 
            block2.v = v2
            clackSound = true
            count = count + 1
        end
        -- if it hits the wall then change its direction and increase the count
        if block1:HitWall() then
            block1:Reverse()
            clackSound = true
            count = count + 1
        end
        -- Calling the update function to change the X positions
        block1:Update();
        block2:Update();
    end

    if clackSound then
        clack:stop()
        clack:play()
    end
    clackSound = false
end

function love.draw()
    love.graphics.clear(40 / 255, 48 / 255, 51 / 255)

    -- Ground
    love.graphics.setColor(105 / 255, 105 / 255, 105 / 255)
    love.graphics.rectangle("fill", 0, 640, 1280, 80)

    -- First Block
    love.graphics.setColor(245 / 255, 245 / 255, 245 / 255)
    block1:Render()

    -- Second Block
    love.graphics.setColor(128/225, 128/225, 128/225)
    block2:Render()

    --[[
        Display details
    ]]
    love.graphics.setColor(0.9, 0.9, 0.9, 1)
    love.graphics.setFont(font0)
    love.graphics.print("FPS :" .. tostring(love.timer.getFPS()) .. "\n" .. "V1 :" .. tostring(block1.v * timeSteps) ..
                            "\n" .. "V2 :" .. tostring(block2.v * timeSteps) .. "\n" .. "m2/m1 :" ..
                            tostring(block2.m / block1.m) .. "\n" .. "m2V1/m1v2 = " ..
                            tostring(
            tostring((block1.m * block2.v) / (block1.m * block2.v)) == "nan" and "One Of Them Stopped (v = 0)" or
                tostring((block1.m * block2.v) / (block1.m * block2.v))))
    love.graphics.setFont(font1)
    love.graphics.printf("Calculated Pi = " .. tostring(count), 0, 200, 1920, 'center')
    love.graphics.printf("m2 = (100 ^ " .. tostring(digits ) .. ")*m1", 0, 100, 1920, 'center')
        --in Keypressed
    
end
