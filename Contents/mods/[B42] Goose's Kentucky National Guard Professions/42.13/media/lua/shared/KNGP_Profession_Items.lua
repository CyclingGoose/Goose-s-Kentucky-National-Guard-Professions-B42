-- SPDX-License-Identifier: MIT
--
-- Copyright © 2025 CyclingGoose
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
local backpackSetups = {
    standard = function(inventory)
        AddToInventory:addStandardBackpackToInventory(inventory)
    end,
    engineer = function(inventory)
        AddToInventory:addCombatEngineerBackpackToInventory(inventory)
    end,
    traumabag = function(inventory)
        AddToInventory:addStandardTraumaBagToInventory(inventory)
    end,
    militarypolice = function(inventory)
        AddToInventory:addMilitaryPoliceBackpackToInventory(inventory)
    end,
}

local webbingSetups = {
    standard = function(inventory)
        AddToInventory:addStandardWebbingToInventory(inventory)
    end,
}

local satchelSetups = {
    standard = function(inventory)
        AddToInventory:addStandardSatchelToInventory(inventory)
    end,
}

local chestrigSetups = {
    standard = function(inventory)
        AddToInventory:addStandardChestrigToInventory(inventory)
    end,
}

local weaponSetups = {
    standard = function(inventory)
        AddToInventory:addStandardWeaponsToInventory(inventory)
    end,
}

local toolboxSetups = {
    standard = function(inventory)
        AddToInventory:addToolboxToInventory(inventory)
    end,
}

-- this table defines the loadout configuration for each profession, used in the loadoutByConfig function and defined outside of it to avoid recreating the table each time
local professionConfig = {
    infantryman = {
        gear = true,
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
    },
    combatmedic = {
        gear = true,
        backpack = "traumabag",
        weapons = "standard",
        satchel = "standard",
        ifak = true,
        chestrig = "standard",
    },
    combatengineer = {
        gear = true,
        backpack = "engineer",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
    },
    militarypolice = {
        gear = true,
        backpack = "militarypolice",
        weapons = "standard",
        ifak = true,
        chestrig = "standard",
        extraHelmet = true,
    },
    motortransportoperator = {
        gear = true,
        backpack = "standard",
        weapons = "standard",
        ifak = true,
        toolbox = "standard",
        webbing = "standard",
        extraHelmet = true,
    },
}

-- centralized function to add items to inventory based on profession configuration
local function loadoutByConfig(inventory, playername, prof)
    local config = professionConfig[prof]
    if not config then return end

    if config.gear then AddToInventory:addStandardGearToInventory(inventory, playername) end

    -- looks up the backpack setup function from the backpackSetups table and call it if it exists
    -- looks more complex than it is, but cleaner than a bunch of if-else statements
    -- we need two checks here: one to see if a backpack is defined in the config, and another to see if that backpack setup exists in the backpackSetups table
    -- then the specific backpack setup function is called, with the inventory as parameter as is usual
    if config.backpack and backpackSetups[config.backpack] then backpackSetups[config.backpack](inventory) end
    if config.weapons and weaponSetups[config.weapons] then weaponSetups[config.weapons](inventory) end
    if config.ifak then AddToInventory:addStandardIFAKToInventory(inventory) end
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
            
            local inventory = player:getInventory();
            local professionCategories = {"inventory","equip"}

            -- iterates though the professionCategories table and adds items to inventory or equips them based on the professionDictionary table
            -- i wouldn't touch this if you don't know what you're doing
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

        professionDictionary = {
            
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
                    "Base.WristWatch_Left_DigitalBlack",
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
                    "Base.WristWatch_Left_DigitalBlack",
                    "Base.Socks_Heavy",
                    "Base.Boxers_White",
                    "Base.HolsterSimple_Green",
                    "Base.Vest_DefaultTEXTURE"},
            },

            combatengineer= {
                
                inventory = {"Base.Axe"},

                equip = {"Base.Vest_BulletArmy",
                    "Base.Trousers_CamoGreen",
                    "Base.Jacket_ArmyCamoGreen",
                    "Base.Hat_Army",
                    "Base.Tshirt_OliveDrab",
                    "Base.Shoes_ArmyBoots",
                    "Base.Gloves_FingerlessLeatherGloves_Black",
                    "Base.WristWatch_Left_DigitalBlack",
                    "Base.Socks_Heavy",
                    "Base.Boxers_White",
                    "Base.HolsterSimple_Green",
                    "Base.Vest_DefaultTEXTURE"},
            },

            militarypolice = {
                
                inventory = {"Base.Nightstick"},

                equip = {"Base.Vest_BulletPolice",
                    "Base.Trousers_CamoGreen",
                    "Base.Jacket_ArmyCamoGreen",
                    "Base.Hat_BeretArmy",
                    "Base.Hat_GasMask",
                    "Base.Tshirt_OliveDrab",
                    "Base.Shoes_ArmyBoots",
                    "Base.Gloves_FingerlessLeatherGloves_Black",
                    "Base.WristWatch_Left_DigitalBlack",
                    "Base.Socks_Heavy",
                    "Base.Boxers_White",
                    "Base.HolsterSimple_Green",
                    "Base.Vest_DefaultTEXTURE"},
            },

            motortransportoperator = {
                
                inventory = {"Base.Wrench"},

                equip = {"Base.Trousers_CamoGreen",
                    "Base.Shirt_CamoGreen",
                    "Base.Tshirt_OliveDrab",
                    "Base.Shoes_ArmyBoots",
                    "Base.Gloves_FingerlessLeatherGloves_Black",
                    "Base.WristWatch_Left_DigitalBlack",
                    "Base.Socks_Heavy",
                    "Base.Boxers_White",
                    "Base.HolsterSimple_Green",
                    "Base.Vest_DefaultTEXTURE"},
            },

        }


        if activate_loadouts then
            setupGear(prof);
        end

end

Events.OnNewGame.Add(kngpGearPlayer)
