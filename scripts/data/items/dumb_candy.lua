-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(HealItem, "ultimate_candy")

function item:init()
    super.init(self)

    -- Display name
    self.name = "DumCandy"
    -- Name displayed when used in battle (optional)
    self.use_name = "DUMB CANDY"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Worst\nhealing"
    -- Shop description
    self.shop = "dumb"
    -- Menu description
    self.description = "dum"

    -- Amount healed (HealItem variable)
    self.heal_amount = -50

    -- Default shop price (sell price is halved)
    self.price = 1
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "This sucks.",
        ralsei = "Uhhh, i don't like it?",
        noelle = "...What.",
    }
end

return item