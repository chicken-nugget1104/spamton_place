local MovingArena, super = Class(Wave)

function MovingArena:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0
    self.siner2 = 0.5
    iii=0
end

function MovingArena:onStart()
    -- Get the arena object
    arena = Game.battle.arena

    self.timer:every(1/3, function()
        iii=iii+0.02
        local x=arena.width/2+love.math.random(50,500)
        local y=arena.height/2+love.math.random(50,500)
        local rott=love.math.random(0,360)

        self:spawnBullet("arenahazardf", x, y, Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y), 8+iii, Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y))
 
    end)

    -- Spawn spikes on top of arena


    -- Spawn spikes on bottom of arena (rotated 180 degrees)


    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y
end

function MovingArena:update()
    
    -- Increment timer for arena movement
    self.siner = self.siner + DT
    self.siner2 = self.siner2 + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 60
    local offset2 = math.sin(self.siner2 * 1.5) * 60

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x + offset2, self.arena_start_y + offset)

    super.update(self)
end

return MovingArena