Block = Class {}

function Block:init(x, w, m, v)
    self.x = x*2;
    self.y = love.graphics.getHeight() - w - 80;
    self.w = w;
    self.v = v*.150;
    self.m = m;
end

--[[
    returns True if the block has hit the edge of the screen.
]]
function Block:HitWall()
    return self.x <= 0
end

--[[
    Change the direction of the block.
]]
function Block:Reverse()
    self.v = self.v * -1
end

--[[
    returns true if there is collision between the block and the other block
]]
function Block:Collides(other)
    return not ((self.x + self.w < other.x) or self.x > other.x + other.w)
end

--[[
    Bounce the blocks Formula
]]
function Block:Bounce(other)
    local sumM = self.m + other.m
    local newV = ((self.m - other.m) / sumM) * self.v
    local newV = newV + ((2 * other.m) / sumM) * other.v
    return newV
end

--[[
    set X to x + velocity
]]
function Block:Update()
    self.x = self.x + self.v
end

function Block:Render()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.w)
end
