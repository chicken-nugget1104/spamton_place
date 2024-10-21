local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "SpamDummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 5454
    self.health = 5453
    -- Enemy attack (determines bullet damage)
    self.attack = 8
    -- Enemy defense (usually 0)
    self.defense = 2
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "TRANSMIT [Kromer]",
        "MEET [Hot singles] STRAIGHT FROM [My]",
        "BE A [Big shot!]",
        "TAKE THE DEAL [[Deer]] [[Customer]]!!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "NOWS YOUR CHANCE TO BE A [[Skyblock]]"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* NOTHINGS WRONG WITH A\nLITTLE [[Splurge]]\n[Once in a while]!",
        "* BE [Big shot]",
        "* SLIDE THAT [Kromer] INTO THE SLOT!",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* THIS ISNT VERY [Big shot]!!!\nI'LL BE IN MY [[Trailer]]"

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Tell Story", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "Smile" then
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "..."
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The dummy does nothing.",
            "* Sadness."
        }

    elseif name == "Tell Story" then
        return "* You and Ralsei told the dummy\na bedtime story.\n* The enemies became [color:blue]NOT TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy did nothing."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy