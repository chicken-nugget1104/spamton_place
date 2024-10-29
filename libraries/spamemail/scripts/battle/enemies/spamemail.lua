local Spamemail, super = Class(EnemyBattler)

function Spamemail:init()
    super.init(self)

    -- Enemy name
    self.name = "Spam-email"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/Spamemail.lua)
    self:setActor("spamemail")

    -- Enemy health
    self.max_health = 997
    self.health = 997
    -- Enemy attack (determines bullet damage)
    self.attack = 9.97
    -- Enemy defense (usually 0)
    self.defense = 1.997
    -- Enemy reward
    self.money = 1997

    self.auto_spare = true

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 19.97

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basicf",
        "aimingf",
        "movingarenaf"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "CLICK H3R3 0r [[bad time]]",
        "NOW [That] WAS 4 B1G SH0T",
        "T4Ke tH3 DE4L!!11!1"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 19.97 DF 1.997. Looks familiar."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The Spam-email is adverti$ing!!1!!11.",
        "* The.",
        "* Smells like... [wait:5]\nA great deal.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The Spam-email looks like it's\nabout to give up."

    -- Register act called "Smile"
    self:registerAct("Reply", "", {"ralsei"})
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Block")
    self:registerAct("Take Deal")
end

function Spamemail:onAct(battler, name)
    if name == "Reply" then
        -- Give the enemy 100% mercy
        -- Change this enemy's dialogue for 1 turn
        Game.battle.encounter:addEnemy("spamemail")
        self.dialogue_override = "LO0K!11!!1 [a] N3W [[BIG Sh0T]]!!!!1!111"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You Reply to the Spam-email.",
            "* Oh look.",
            "* There's more of them now.",
            "* Good job."
        }

    elseif name == "Block" then
        self:addMercy(100)

        return "* You Block the Spam-email."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
                self.dialogue_override = "[anagram of asriel] \n[[... I remember you're..]]\n G1VinG ME You'rE\n [[WACKY STACKS]]"
            return "* Ralsei gave the Spam-email 20 Dark Dollars out of his personal account."
        elseif battler.chara.id == "susie" then
                self.dialogue_override = "Ouch."
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/Spamemail.lua)
            return {"* Susie Punched the Spam-email.", "* How does that work."}
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." Fraternized with the enemy."
        end
    elseif name == "Take Deal" then
        self:remove()
        self:remove()
        self:remove()
        self:remove()
        self:remove()
        Spamemail:remove()

        return "* You Broke the       fucking \n\n        [color:yellow]game[color:reset]"

    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Spamemail