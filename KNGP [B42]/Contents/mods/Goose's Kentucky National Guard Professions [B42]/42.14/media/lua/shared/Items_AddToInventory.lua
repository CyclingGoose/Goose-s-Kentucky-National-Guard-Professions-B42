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
-- Items_AddToInventory.lua

-- serves as a utils class

--
-- VANILLA ITEMS ONLY
--
function AddToInventory:addStandardWebbingToInventory(inventory, webbing)
    webbing = inventory:AddItem("Base.Bag_ALICE_BeltSus_Camo");
    AddToContainer:addStandardMagazinesToContainer(inventory, webbing);
end

function AddToInventory:addStandardGearToInventory(inventory, playername)
    inventory:AddItem("Base.KnifePocket");
    inventory:AddItem("Base.Necklace_DogTag"):setName("Dog Tags: " .. playername);
    inventory:AddItem("KNGP.MilitaryIDCard"):setName("Military ID Card: " .. playername);
    inventory:AddItem("Base.EntrenchingTool");
    for x=1, 2 do 
        inventory:AddItem("Base.WaterBottle");
    end
end

function AddToInventory:addToolboxToInventory(inventory, toolbox)
    toolbox = inventory:AddItem("Base.Toolbox_Mechanic");
    AddToContainer:addToolsToContainer(inventory, toolbox);
end

function AddToInventory:addMilitaryPoliceBackpackToInventory(inventory, backpack)
    backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
    AddToContainer:addStandardRationsToContainer(inventory, backpack);
    AddToContainer:addStandardGearToContainer(inventory, backpack);
    AddToContainer:addStandardMilitaryPoliceGearToContainer(inventory, backpack);
end

function AddToInventory:addCombatEngineerBackpackToInventory(inventory, backpack)
    backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
    AddToContainer:addStandardRationsToContainer(inventory, backpack);
    AddToContainer:addStandardGearToContainer(inventory, backpack);
    AddToContainer:addCombatEngineerGearToContainer(inventory, backpack);
end

function AddToInventory:addStandardBackpackToInventory(inventory, backpack)
    -- note: the backpack parameter is reassigned here, this is intentional for container population
    backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
    AddToContainer:addStandardRationsToContainer(inventory, backpack);
    AddToContainer:addStandardGearToContainer(inventory, backpack);
end

function AddToInventory:addStandardChestrigToInventory(inventory, chestrig)
    chestrig = inventory:AddItem("Base.Bag_ChestRig");
    AddToContainer:addStandardMagazinesToContainer(inventory, chestrig);
end

function AddToInventory:addStandardTraumaBagToInventory(inventory, traumabag)
    traumabag = inventory:AddItem("Base.Bag_MedicalBag");
    AddToContainer:addAdvancedFirstAidToContainer(inventory, traumabag);
    traumabag:setName("Unit One Pack");
end

function AddToInventory:addStandardIFAKToInventory(inventory, firstaidkit)
    firstaidkit = inventory:AddItem("Base.FirstAidKit_Military");
    AddToContainer:addStandardFirstAidToContainer(inventory, firstaidkit);
end

function AddToInventory:addStandardWeaponsToInventory(inventory)
    inventory:AddItem("Base.AssaultRifle"); -- M16 Assault Rifle
    inventory:AddItem("Base.556Clip"):setCurrentAmmoCount(30);

    inventory:AddItem("Base.Pistol"); -- M9 Pistol
    inventory:AddItem("Base.9mmClip"):setCurrentAmmoCount(15);
end

function AddToInventory:addStandardSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("Base.Bag_Satchel_Military");
    AddToContainer:addStandardRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
end

function AddToInventory:addStandardRationsToInventory(inventory)
    for x=1, 5 do
        inventory:AddItem("Base.Crackers");
    end

    for x=1, 2 do
        inventory:AddItem("Base.GranolaBar");
        inventory:AddItem("Base.CannedCornedBeef");
        inventory:AddItem("Base.WaterBottle");
        inventory:AddItem("Base.BreadSlices");
    end
             
    inventory:AddItem("Base.TeaBag2");
    inventory:AddItem("Base.Chocolate");
    inventory:AddItem("CandyFruitSlices");
end
--
-- VANILLA ITEMS ONLY
--

--
-- MOD FUNCTIONS: Alice Belts
--

function AddToInventory:addABRationsToInventory(inventory)
    for x=1, 5 do
        inventory:AddItem("Base.Crackers");
    end

    for x=1, 2 do
        inventory:AddItem("Base.GranolaBar");
        inventory:AddItem("Base.CannedCornedBeef");
         -- removed water bottles from AB rations to reflect the use of canteens
        inventory:AddItem("Base.BreadSlices");
    end
             
    inventory:AddItem("Base.Teabag2");
    inventory:AddItem("Base.Chocolate");
    inventory:AddItem("CandyFruitSlices");
end

function AddToInventory:addABGearToInventory(inventory, playername)
    inventory:AddItem("ALICE.M9Bayonet");
    inventory:AddItem("ALICE.M9BayonetSheath");
    inventory:AddItem("ALICE.AliceCanteen")
    inventory:AddItem("Base.Necklace_DogTag"):setName("Dog Tags: " .. playername);
    inventory:AddItem("KNGP.MilitaryIDCard"):setName("Military ID Card: " .. playername);
    inventory:AddItem("Base.EntrenchingTool");
end

function AddToInventory:addABWebbingToInventory(inventory, webbing)
    webbing = inventory:AddItem("ALICE.AliceVest4P1C1ETight");
    AddToContainer:addStandardMagazinesToContainer(inventory, webbing);
end

function AddToInventory:addABSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("ALICE.AliceFieldpack");
    AddToContainer:addABRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
end

--
-- MOD FUNCTIONS: Alice Belts
--