-- "An idiot admires complexity, a genius admires simplicity. An idiot, the more complicated something is, the more he will admire it.
-- If you make something so clusterfucked he can't understand it, he's gonna think you're a god because you made it so complicated, nobody can understand it.
-- That's how they write academic journals. They try to make it so complicated people think they're a genius."
-- - Terry A. Davis
--
-- (even tho I don't always follow his advice myself I admire terry's wisdom)
--
-- SPDX-License-Identifier: MIT
--
-- Copyright © 2026 CyclingGoose
--
-- see LICENSE.txt for full license text.
--
-- code commented by CyclingGoose for clarity and personal reference.
--
-- KNGP_Main.lua

require "KNGP_Data";
require "Items_AddToContainer";
require "Items_AddToInventory";
require "registries";

local function getConfigForProfession(professionName)
    if getActivatedMods():contains("AliceGear") then
        return professionConfigAB[professionName]
    else
        return professionConfigVanilla[professionName]
    end
end

-- function to add items to inventory based on profession configuration
local function loadoutByConfig(inventory, playername, prof)

    local config = getConfigForProfession(prof)

    if not config then return end

    -- looks up the gear setup function from the gearSetups table and call it if it exists
    -- looks more complex than it is, but cleaner than a bunch of if-else statements
    -- we need two checks here: one to see what gear is defined in the config, and another to see if that gear setup exists in the gearSetups table
    -- then the specific gear setup function is called, with the inventory and playername as parameters
    if config.gear and gearSetups[config.gear] then gearSetups[config.gear](inventory, playername) end
    if config.backpack and backpackSetups[config.backpack] then backpackSetups[config.backpack](inventory) end
    if config.weapons and weaponSetups[config.weapons] then weaponSetups[config.weapons](inventory) end
    if config.ifak then AddToInventory:addStandardIFAKToInventory(inventory, firstaidkit) end
    if config.chestrig then chestrigSetups[config.chestrig](inventory) end
    if config.toolbox then toolboxSetups[config.toolbox](inventory) end
    if config.satchel then satchelSetups[config.satchel](inventory) end
    if config.webbing then webbingSetups[config.webbing](inventory) end
    if config.extraHelmet then inventory:AddItem("Base.Hat_Army") end
end

local function kngpGearPlayer(_player)
    
        local activate_loadouts = SandboxVars.KNGP.Loadouts;
        local player = _player
        local prof = player:getDescriptor():getCharacterProfession():getName(); -- gets the profession name of the player 
        local playername = player:getFullName() -- gets the player characters full name

        local function setupGear(prof)
            
            if not professionDictionary[prof] then return end

            local inventory = player:getInventory();
            local professionCategories = {"inventory","equip"}

            -- iterates though the professionCategories table and adds items to inventory or equips them based on if they are in the inventory or equip table
            -- i wouldn't touch this if you don't know what you're doing, horrible way to do it (nesting if statements inside loops) but it works and is modular enough for my needs
            -- might optimize eventually but not a priority right now
            for i,v in ipairs(professionCategories) do
                for index, value in ipairs(professionDictionary[prof][v]) do
                    if v == "inventory" then
                        inventory:AddItem(value)
                    end
                    if v == "equip" then
                        itemToEquip = inventory:AddItem(value);
                        player:setWornItem(itemToEquip:getBodyLocation(), itemToEquip);
                    end   
                end
            end
            
            -- this is where the items get added to the inventory base on the profession
            -- using  a centralized, module-level and config-driven loader to avoid recreating tables every time the function is called
            loadoutByConfig(inventory, playername, prof)
             
        end

        if activate_loadouts then
            setupGear(prof);
        end
end

-- OnNewGame is triggered when you create a new character and click on the "Click to Start", NOT when you load a save
if not isClient() then
Events.OnNewGame.Add(kngpGearPlayer)
end
