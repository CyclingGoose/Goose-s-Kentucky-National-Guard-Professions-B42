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

-- Module-level loadout configuration and helpers to avoid recreating tables per-call
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

local professionConfig = {
    infantryman = {
        gear = true,
        backpack = "standard",
        weapons = true,
        ifak = true,
        chestrig = true,
    },
    combatmedic = {
        gear = true,
        backpack = "traumabag",
        weapons = true,
        satchel = true,
        ifak = true,
        chestrig = true,
    },
    combatengineer = {
        gear = true,
        backpack = "engineer",
        weapons = true,
        ifak = true,
        chestrig = true,
    },
    militarypolice = {
        gear = true,
        backpack = "militarypolice",
        weapons = true,
        ifak = true,
        chestrig = true,
        extraHelmet = true,
    },
    motortransportoperator = {
        gear = true,
        backpack = "standard",
        weapons = true,
        ifak = true,
        toolbox = true,
        webbing = true,
        extraHelmet = true,
    },
}

local function loadoutByConfig(inventory, playername, prof)
    local config = professionConfig[prof]
    if not config then return end

    if config.gear then AddToInventory:addStandardGearToInventory(inventory, playername) end
    if config.backpack and backpackSetups[config.backpack] then backpackSetups[config.backpack](inventory) end
    if config.weapons then AddToInventory:addStandardWeaponsToInventory(inventory) end
    if config.ifak then AddToInventory:addStandardIFAKToInventory(inventory) end
    if config.chestrig then AddToInventory:addStandardChestrigToInventory(inventory) end
    if config.toolbox then AddToInventory:addToolboxToInventory(inventory) end
    if config.satchel then AddToInventory:addStandardSatchelToInventory(inventory) end
    if config.webbing then AddToInventory:addMechanicWebbingToInventory(inventory) end
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
            -- using  a centralized, module-level config-driven loader to avoid recreating tables every time the function is called
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

