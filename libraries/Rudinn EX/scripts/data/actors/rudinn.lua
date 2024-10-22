local actor, super = Class(Actor, "rudinnex")

function actor:init()
    super.init(self)

    self.name = "Rudinn EX"

    self.width = 35
    self.height = 40

    self.hitbox = {3, 24, 24, 16}

    self.flip = "right"

    self.path = "enemies/rudinn"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", 0.25, true},

        ["hurt"] = {"hurt", 0, false}
    }

    self.offsets = {
        ["idle"] = {-6, 5},

        ["hurt"] = {-1, -1},
    }
end

return actor