return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `WorldCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene WorldCutscene

    meet = function(cutscene, event)

    local scamtonneo = cutscene:getCharacter("scamtonneo")

    cutscene:setSpeaker(scamtonneo)

    cutscene:text("* IS THAT A    |_\nIG|-|NEr ???? // ///??\n   [[I spy with my little eye]]")

    Game.world.music:play("scamton")


    cutscene:panTo("scamstart")


    local x = event.x + event.width/2
    local y = event.y + event.height/2

    cutscene:text("* what a [[peasant.]][wait:5] \n    surpri$!! !11 !")
    cutscene:text("* NOW i [can] fin[wait:1]n[wait:2]n[wait:3]il[wait:5]i . ....    .]")
    cutscene:text("[[BIG SHOT]].")
    cutscene:text("* [proceed with] out cuatioon")
    cutscene:walkTo(scamtonneo, x, y, 0.75, "left")
    cutscene:text("* lemme at yer [[culmination of your very being]]")
    
    cutscene:text("* ... ")
    cutscene:text("* where is it??? ")
    cutscene:text("* [color:purple]don't see that heart??\n[wait:5][color:green] no[color:purple]\n[wait:5][[shit!!]] !!11 11")
    cutscene:text("* [Buh-bye!!!!]")
    cutscene:walkTo(scamtonneo, x+320, y, 2, "right")
    scamtonneo:shake(4)
    cutscene:walkTo(scamtonneo, x+20, y, 1, "left")
    cutscene:text("* OH R1gHt!!!       I\n4lmost [forgor]")
    cutscene:text("* [here, have fun.]")
    cutscene:walkTo(scamtonneo, x+640, y, 0.5, "right")




    end

}


--[[return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `WorldCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    --@param cutscene WorldCutscene
    wall = function(cutscene, event)
        -- Open textbox and wait for completion
        cutscene:text("* The wall seems cracked.")

        -- If we have Susie, play a cutscene
        local susie = cutscene:getCharacter("susie")
        if susie then
            -- Detach camera and followers (since characters will be moved)
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- All text from now is spoken by Susie
            cutscene:setSpeaker(susie)
            cutscene:text("* Hey,[wait:5] think I can break\nthis wall?", "smile")

            -- Get the bottom-center of the broken wall
            local x = event.x + event.width/2
            local y = event.y + event.height/2

            -- Move Susie up to the wall over 0.75 seconds
            cutscene:walkTo(susie, x, y + 40, 0.75, "up")
            -- Move other party members behind Susie
            cutscene:walkTo(Game.world.player, x, y + 100, 0.75, "up")
            if cutscene:getCharacter("ralsei") then
                cutscene:walkTo("ralsei", x + 60, y + 100, 0.75, "up")
            end
            if cutscene:getCharacter("noelle") then
                cutscene:walkTo("noelle", x - 60, y + 100, 0.75, "up")
            end

            -- Wait 1.5 seconds
            cutscene:wait(1.5)

            -- Walk back,
            cutscene:wait(cutscene:walkTo(susie, x, y + 60, 0.5, "up", true))
            -- and run forward!
            cutscene:wait(cutscene:walkTo(susie, x, y + 20, 0.2))

            -- Slam!!
            Assets.playSound("impact")
            susie:shake(4)
            susie:setSprite("shock_up")

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)

            -- owie
            susie:setAnimation({"away_scratch", 0.25, true})
            susie:shake(4)
            Assets.playSound("wing")

            cutscene:wait(1)
            cutscene:text("* Guess not.", "nervous")

            -- Reset Susie's sprite
            susie:resetSprite()

            -- Reattach the camera
            cutscene:attachCamera()

            -- Align the follower positions behind Kris's current position
            cutscene:alignFollowers()
            -- And reattach them, making them return to their target positions
            cutscene:attachFollowers()
            Game:setFlag("wall_hit", true)
        end
    end

    

}]]