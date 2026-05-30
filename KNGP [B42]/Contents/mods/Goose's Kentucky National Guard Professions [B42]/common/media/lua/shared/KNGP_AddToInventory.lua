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
-- KNGP_AddToInventory.lua

-- serves as a utils class

--
-- VANILLA ITEMS ONLY
--

function AddToInventory:addNormalPhotographToInventory(inventory)
    local activate_loreitems = SandboxVars.KNGP.Lore;
    if activate_loreitems then
    GeneralFunctions:returnPhotographObjectByTypeInv(inventory, "normal", normalPhotographNames)
    end
end

function AddToInventory:addKnoxEventPhotographToInventory(inventory)
    local activate_loreitems = SandboxVars.KNGP.Lore;
    if activate_loreitems then
        GeneralFunctions:returnPhotographObjectByTypeInv(inventory, "knoxEvent", knoxEventPhotographNames)
    else end
end

function AddToInventory:addStandardWebbingToInventory(inventory, webbing)
    webbing = inventory:AddItem("Base.Bag_ALICE_BeltSus_Camo");
end

function AddToInventory:addStandardGearToInventory(inventory, playername)
    local activate_loreitems = SandboxVars.KNGP.Lore;
    inventory:AddItem("Base.KnifePocket");
    inventory:AddItem("Base.Necklace_DogTag"):setName("Dog Tags: " .. playername);
    inventory:AddItem("KNGP.MilitaryIDCard"):setName("Military ID Card: " .. playername);
    inventory:AddItem("Base.EntrenchingTool");
    for x=1, 2 do 
        inventory:AddItem("Base.WaterBottle");
    end

    for x=1, 2 do
        AddToInventory:addKnoxEventPhotographToInventory(inventory);
    end

    AddToInventory:addNormalPhotographToInventory(inventory);
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
    inventory:AddItem("Base.Pistol"); -- M9 Pistol

    for x = 1, 3 do
    inventory:AddItem("Base.556Clip"):setCurrentAmmoCount(30);
    end

    for x = 1, 2 do
       inventory:AddItem("Base.9mmClip"):setCurrentAmmoCount(15);
    end
end

function AddToInventory:addLightWeaponsToInventory(inventory)
    inventory:AddItem("Base.Pistol"); -- M9 Pistol
    
    for x = 1, 3 do
       inventory:AddItem("Base.9mmClip"):setCurrentAmmoCount(15);
    end
end

function AddToInventory:addStandardSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("Base.Bag_Satchel_Military");
    AddToContainer:addStandardRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
end

function AddToInventory:addCBRNSatchelToInventory(inventory, satchel)
    local activate_loreitems = SandboxVars.KNGP.Lore;
    satchel = inventory:AddItem("Base.Bag_Satchel_Military");
    AddToContainer:addStandardRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
    AddToContainer:addCBRNItemsToContainer(inventory, satchel);
end

function AddToInventory:addSCROSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("Base.Bag_Satchel_Military");
    AddToContainer:addStandardRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
    AddToContainer:addSCROItemsToContainer(inventory, satchel);
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
    local activate_loreitems = SandboxVars.KNGP.Lore;
    inventory:AddItem("ALICE.M9Bayonet");
    inventory:AddItem("ALICE.M9BayonetSheath");
    inventory:AddItem("ALICE.AliceCanteen")
    inventory:AddItem("Base.Necklace_DogTag"):setName("Dog Tags: " .. playername);
    inventory:AddItem("KNGP.MilitaryIDCard"):setName("Military ID Card: " .. playername);
    inventory:AddItem("Base.EntrenchingTool");
    
    for x=1, 2 do
        AddToInventory:addKnoxEventPhotographToInventory(inventory);
    end

    AddToInventory:addNormalPhotographToInventory(inventory);
end

function AddToInventory:addABWebbingToInventory(inventory, webbing)
    webbing = inventory:AddItem("ALICE.AliceVest4P1C1ETight");
end

function AddToInventory:addABSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("ALICE.AliceFieldpack");
    AddToContainer:addABRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
end

function AddToInventory:addABCBRNSatchelToInventory(inventory, satchel)
    local activate_loreitems = SandboxVars.KNGP.Lore;
    satchel = inventory:AddItem("ALICE.AliceFieldpack");
    AddToContainer:addABRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
    AddToContainer:addCBRNItemsToContainer(inventory, satchel);
end

function AddToInventory:addABSCROSatchelToInventory(inventory, satchel)
    satchel = inventory:AddItem("ALICE.AliceFieldpack");
    AddToContainer:addABRationsToContainer(inventory, satchel);
    AddToContainer:addStandardGearToContainer(inventory, satchel);
    AddToContainer:addSCROItemsToContainer(inventory, satchel);
end

function AddToInventory:addABMaskPouchToInventory(inventory, maskpouch, player)
    maskpouch = inventory:AddItem("ALICE.GasMaskPouchThigh");
    AddToContainer:addGasmaskToContainer(inventory, maskpouch, player);
end

--
-- MOD FUNCTIONS: Alice Belts
--