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
-- KNGP_Profession_Items.lua

require "Items_AddToContainer";
require "Items_AddToInventory";
require "registries";

-- all these tables serve to modularize the loadout functions, making it easier to add or remove specific setups without touching the main loadout function
-- all of them are created outside of the main loadout function to avoid recreating them each time the function is called
-- each table contains functions that correspond to specific setups defined in the profession configuration tables below
local backpackSetups = {
    standard = function(inventory)
        AddToInventory:addStandardBackpackToInventory(inventory, backpack)
    end,
    engineer = function(inventory)
        AddToInventory:addCombatEngineerBackpackToInventory(inventory, backpack)
    end,
    traumabag = function(inventory)
        AddToInventory:addStandardTraumaBagToInventory(inventory, traumabag)
    end,
    militarypolice = function(inventory)
        AddToInventory:addMilitaryPoliceBackpackToInventory(inventory, backpack)
    end,
}

local webbingSetups = {
    standard = function(inventory)
        AddToInventory:addStandardWebbingToInventory(inventory, webbing)
    end,
    alice = function(inventory)
        AddToInventory:addABWebbingToInventory(inventory, webbing)
    end,
}

local satchelSetups = {
    standard = function(inventory)
        AddToInventory:addStandardSatchelToInventory(inventory, satchel)
    end,
    alice = function(inventory)
        AddToInventory:addABSatchelToInventory(inventory, satchel)
    end,
}

local chestrigSetups = {
    standard = function(inventory)
        AddToInventory:addStandardChestrigToInventory(inventory, chestrig)
    end,
}

local weaponSetups = {
    standard = function(inventory)
        AddToInventory:addStandardWeaponsToInventory(inventory)
    end,
}

local toolboxSetups = {
    standard = function(inventory)
        AddToInventory:addToolboxToInventory(inventory, toolbox)
    end,
}

local gearSetups = {
    standard = function(inventory, playername)
        AddToInventory:addStandardGearToInventory(inventory, playername)
    end,
    alice = function(inventory, playername)
        AddToInventory:addABGearToInventory(inventory, playername)
        AddToInventory:addABMaskPouchToInventory(inventory, maskpouch)
    end,
}


-- these tables define the loadout configurations for each mod, if a certain mod is loaded a different config gets returned in getConfigForProfession().
-- defined outside of the main function to avoid recreating the table each time a player spawns
-- this allows compatibility with both vanilla and AliceGear mod loadouts
--
-- to load a certain loadout confguaration define local config = getConfigForProfession(prof) in the main function
-- this will automatically return the correct configuration based on whether AliceGear is activated or not
--
-- AliceGear suffix = AB
local professionConfigAB = {
    infantryman = {
        gear = "alice",
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        webbing = "alice",
    },
    combatmedic = {
        gear = "alice",
        backpack = "traumabag",
        weapons = "standard",
        satchel = "alice",
        ifak = true,
        webbing = "alice",
    },
    combatengineer = {
        gear = "alice",
        backpack = "engineer",
        weapons = "standard",
        ifak = true,
        webbing = "alice",
    },
    militarypolice = {
        gear = "alice",
        backpack = "militarypolice",
        weapons = "standard",
        ifak = true,
        webbing = "alice",
        extraHelmet = true,
    },
    motortransportoperator = {
        gear = "alice",
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        toolbox = "standard",
        webbing = "alice",
        extraHelmet = true,
    },
}

local professionConfigVanilla = {
    infantryman = {
        gear = "standard",
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
    },
    combatmedic = {
        gear = "standard",
        backpack = "traumabag",
        weapons = "standard",
        satchel = "standard",
        ifak = true,
        chestrig = "standard",
    },
    combatengineer = {
        gear = "standard",
        backpack = "engineer",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
    },
    militarypolice = {
        gear = "standard",
        backpack = "militarypolice",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
        extraHelmet = true,
    },
    motortransportoperator = {
        gear = "standard",
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        toolbox = "standard",
        webbing = "standard",
        extraHelmet = true,
    },
}

local function getConfigForProfession(professionName)
    if getActivatedMods():contains("AliceGear") then
        return professionConfigAB[professionName]
    else
        return professionConfigVanilla[professionName]
    end
end

-- initalized outside of main function to avoid recreating the table each time
-- used in setupGear(prof) to add items to inventory and equip certain clothing based on profession
local professionDictionary = {

    infantryman = {
        -- essentially their "special" item, just gets added to the inventory
        inventory = {"Base.Screwdriver"},

        -- what they will wear once they spawn
        -- it does add it to the inventory first, then equips it
        equip = {"Base.Vest_BulletArmy",
            "Base.Trousers_CamoGreen",
            "Base.Jacket_ArmyCamoGreen",
            "Base.Hat_Army",
            "Base.Tshirt_OliveDrab",
            "Base.Shoes_ArmyBoots",
            "Base.Gloves_FingerlessLeatherGloves_Black",
            "Base.WristWatch_Right_DigitalBlack",
            "Base.Socks_Heavy",
            "Base.Boxers_White",
            "Base.HolsterSimple_Green",
            "Base.Vest_DefaultTEXTURE"},

    },

    combatmedic = {
                
        inventory = {"Base.Scalpel"},

        equip = {"Base.Vest_BulletArmy",
            "Base.Trousers_CamoGreen",
            "Base.Jacket_ArmyCamoGreen",
            "Base.Hat_Army",
            "Base.Tshirt_OliveDrab",
            "Base.Shoes_ArmyBoots",
            "Base.Gloves_Surgical",
            "Base.WristWatch_Right_DigitalBlack",
            "Base.Socks_Heavy",
            "Base.Boxers_White",
            "Base.HolsterSimple_Green",
            "Base.Vest_DefaultTEXTURE",
            "KNGP.NGMedicArmband"},
    },

    combatengineer= {
                
        inventory = {"Base.Axe"}, -- Fire Axe

        equip = {"Base.Vest_BulletArmy",
            "Base.Trousers_CamoGreen",
            "Base.Jacket_ArmyCamoGreen",
            "Base.Hat_Army",
            "Base.Tshirt_OliveDrab",
            "Base.Shoes_ArmyBoots",
            "Base.Gloves_FingerlessLeatherGloves_Black",
            "Base.WristWatch_Right_DigitalBlack",
            "Base.Socks_Heavy",
            "Base.Boxers_White",
            "Base.HolsterSimple_Green",
            "Base.Vest_DefaultTEXTURE",
            "KNGP.NGEngineerArmband"},
    },

    militarypolice = {
                
        inventory = {"Base.Nightstick"},

        equip = {"Base.Vest_BulletArmy",
            "Base.Trousers_CamoGreen",
            "Base.Jacket_ArmyCamoGreen",
            "Base.Hat_BeretArmy",
            "Base.Hat_GasMask",
            "Base.Tshirt_OliveDrab",
            "Base.Shoes_ArmyBoots",
            "Base.Gloves_FingerlessLeatherGloves_Black",
            "Base.WristWatch_Right_DigitalBlack",
            "Base.Socks_Heavy",
            "Base.Boxers_White",
            "Base.HolsterSimple_Green",
            "Base.Vest_DefaultTEXTURE",
            "KNGP.NGMPBrassardLeft"},
    },

    motortransportoperator = {
                
        inventory = {"Base.Wrench"},

        equip = {"Base.Trousers_CamoGreen",
            "Base.Shirt_CamoGreen",
            "Base.Tshirt_OliveDrab",
            "Base.Shoes_ArmyBoots",
            "Base.Gloves_FingerlessLeatherGloves_Black",
            "Base.WristWatch_Right_DigitalBlack",
            "Base.Socks_Heavy",
            "Base.Boxers_White",
            "Base.HolsterSimple_Green",
            "Base.Vest_DefaultTEXTURE"},
    },

}

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

        
        print("kentuckynationalguardprofessionsgoose - Loadout Activated: ", activate_loadouts);
        print("kentuckynationalguardprofessionsgoose - Profession Chosen: ", prof);

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
