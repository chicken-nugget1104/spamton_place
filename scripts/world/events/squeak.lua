local Squeak, super = Class(Event)

function Squeak:init(data)
    super.init(self, data)
end

function Squeak:onInteract(player, dir)
    Assets.playSound("now's your chance to be a big shot")
    return true
end

return Squeak