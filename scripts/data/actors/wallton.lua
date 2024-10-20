local actor, super = Class(Actor, "wallt")

function actor:init()
    self.name = "Walter white"

    -- Width and height of the actor (if unsure, just use sprite size)
    self.width = 26
    self.height = 34

    -- In-world hitbox, relative to the actor's topleft
    -- (these numbers are based on the actual deltarune hitbox)
    self.hitbox = {2, 18, 22, 18}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to the actor's sprites
    self.path = "enemies/wallton"
    -- Default animation or sprite relative to the path
    self.default = "idle"

    self.voice = "spamton"

    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- a
    self.flip_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["punch"] = {"punch", 0.25, false},
        ["hurt"] = {"hurt", 0.25, true},
        ["armsup"] = {"armsup", 0.06, false},
        ["grabby"]  = {"grabby", 0.2, true},
        ["handsnotdown"]   = {"handsnotdown", 0.2, true}
    }

    self.offsets = {
        ["idle"] = {0, 0},
        ["handsnotdown"] = {0, 0},
        ["hurt"] = {0, -1},
        ["armsup"] = {0, 0},
        ["grabby"] = {0, 0},
        ["punch"] = {1, 2} -- one pixel above
    }
end

return actor