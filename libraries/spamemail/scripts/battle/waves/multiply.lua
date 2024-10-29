local Basic, super = Class(Wave)

function Basic:onStart()
    Game.battle.encounter:addEnemy("spamemail")
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic