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

function AddToInventory:addStandardGearToInventory(inventory, playername, prof)
    local activate_miscgear = GeneralFunctions:getSandboxVarByProfessionMiscGear(prof);
    if activate_miscgear then
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
end

function AddToInventory:addToolboxToInventory(inventory, toolbox)
        local activate_toolbox = SandboxVars.KNGPMotorTransportOperator.MotorTransportToolbox;
        if activate_toolbox then
        toolbox = inventory:AddItem("Base.Toolbox_Mechanic");
        AddToContainer:addToolsToContainer(inventory, toolbox);
        end
end

function AddToInventory:addMilitaryPoliceBackpackToInventory(inventory, backpack)
        local activate_militarypolicebackpack = SandboxVars.KNGPMilitaryPolice.MilitaryPoliceBackpack;
        if activate_militarypolicebackpack then
        backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
        AddToContainer:addStandardRationsToContainer(inventory, backpack);
        AddToContainer:addStandardGearToContainer(inventory, backpack);
        AddToContainer:addStandardMilitaryPoliceGearToContainer(inventory, backpack);
        end
end

function AddToInventory:addCombatEngineerBackpackToInventory(inventory, backpack)
        local activate_combatengineerbackpack = SandboxVars.KNGPEngineer.EngineerBackpack;
        if activate_combatengineerbackpack then
        backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
        AddToContainer:addStandardRationsToContainer(inventory, backpack);
        AddToContainer:addStandardGearToContainer(inventory, backpack);
        AddToContainer:addCombatEngineerGearToContainer(inventory, backpack);
    end
end

function AddToInventory:addStandardBackpackToInventory(inventory, backpack)
        -- note: the backpack parameter is reassigned here, this is intentional for container population
        backpack = inventory:AddItem("Base.Bag_ALICEpack_Army");
        AddToContainer:addStandardRationsToContainer(inventory, backpack);
        AddToContainer:addStandardGearToContainer(inventory, backpack);
end

function AddToInventory:addStandardChestrigToInventory(inventory, chestrig, prof)
        local activate_webbing = GeneralFunctions:getSandboxVarByProfessionWebbing(prof);
        if activate_webbing then
        chestrig = inventory:AddItem("Base.Bag_ChestRig");
        end
end

function AddToInventory:addStandardTraumaBagToInventory(inventory, traumabag)
    local activate_traumabag = SandboxVars.KNGPMedic.MedicTraumabag;
    if activate_traumabag then
        traumabag = inventory:AddItem("Base.Bag_MedicalBag");
        AddToContainer:addAdvancedFirstAidToContainer(inventory, traumabag);
        traumabag:setName("Unit One Pack");
    end
end

function AddToInventory:addStandardIFAKToInventory(inventory, firstaidkit, prof)
        local activate_ifak = GeneralFunctions:getSandboxVarByProfessionIFAK(prof);
        if activate_ifak then
        firstaidkit = inventory:AddItem("Base.FirstAidKit_Military");
        AddToContainer:addStandardFirstAidToContainer(inventory, firstaidkit);
        end
end

function AddToInventory:addStandardAssaultRifleToInventory(inventory, prof)
    local activate_assaultrifle = GeneralFunctions:getSandboxVarByProfessionAssaultRifle(prof);
    local amount_assaultriflemags = GeneralFunctions:getSandboxVarByProfessionAssaultRifleMags(prof);

    if activate_assaultrifle then
        inventory:AddItem("Base.AssaultRifle"); -- M16 Assault Rifle
        if amount_assaultriflemags and amount_assaultriflemags > 0 then
            for x = 1, amount_assaultriflemags do
                inventory:AddItem("Base.556Clip"):setCurrentAmmoCount(30);
            end
        end
    end
end

function AddToInventory:addStandardPistolToInventory(inventory, prof)
    local activate_pistol = GeneralFunctions:getSandboxVarByProfessionPistol(prof);
    local amount_pistolmags = GeneralFunctions:getSandboxVarByProfessionPistolMags(prof);
    if activate_pistol then
        inventory:AddItem("Base.Pistol"); -- M9 Pistol
        if amount_pistolmags and amount_pistolmags > 0 then
            for x = 1, amount_pistolmags do
                inventory:AddItem("Base.9mmClip"):setCurrentAmmoCount(15);
            end
        end
    end
end

function AddToInventory:addStandardSatchelToInventory(inventory, satchel)
        local activate_medicsatchel = SandboxVars.KNGPMedic.MedicSatchel;
        if activate_medicsatchel then
        satchel = inventory:AddItem("Base.Bag_Satchel_Military");
        AddToContainer:addStandardRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        end
end

function AddToInventory:addCBRNSatchelToInventory(inventory, satchel)
        local activate_cbrnsatchel = SandboxVars.KNGPCBRNSpecialist.CBRNSatchel;
        if activate_cbrnsatchel then
        satchel = inventory:AddItem("Base.Bag_Satchel_Military");
        AddToContainer:addStandardRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        AddToContainer:addCBRNItemsToContainer(inventory, satchel);
        end
end

function AddToInventory:addSCROSatchelToInventory(inventory, satchel)
        local activate_scrosatchel = SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioSatchel;
        if activate_scrosatchel then
        satchel = inventory:AddItem("Base.Bag_Satchel_Military");
        AddToContainer:addStandardRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        AddToContainer:addSCROItemsToContainer(inventory, satchel);
        end
end
--
-- VANILLA ITEMS ONLY
--

--
-- MOD FUNCTIONS: Alice Belts
--

function AddToInventory:addABGearToInventory(inventory, playername, prof)
    local activate_miscgear = GeneralFunctions:getSandboxVarByProfessionMiscGear(prof);
    if activate_miscgear then
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
end

function AddToInventory:addABWebbingToInventory(inventory, webbing, prof)
        local activate_webbing = GeneralFunctions:getSandboxVarByProfessionWebbing(prof);
        if activate_webbing then
        webbing = inventory:AddItem("ALICE.AliceVest4P1C1ETight");
        end
end

function AddToInventory:addABSatchelToInventory(inventory, satchel)
        local activate_satchel = SandboxVars.KNGPMedic.MedicSatchel;
        if activate_satchel then
        satchel = inventory:AddItem("ALICE.AliceFieldpack");
        AddToContainer:addABRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        end
end

function AddToInventory:addABCBRNSatchelToInventory(inventory, satchel)
        local activate_cbrn_satchel = SandboxVars.KNGPCBRNSpecialist.CBRNSatchel;
        if activate_cbrn_satchel then
        satchel = inventory:AddItem("ALICE.AliceFieldpack");
        AddToContainer:addABRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        AddToContainer:addCBRNItemsToContainer(inventory, satchel);
        end
end

function AddToInventory:addABSCROSatchelToInventory(inventory, satchel)
        local activate_scro_satchel = SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioSatchel
        if activate_scro_satchel then
        satchel = inventory:AddItem("ALICE.AliceFieldpack");
        AddToContainer:addABRationsToContainer(inventory, satchel);
        AddToContainer:addStandardGearToContainer(inventory, satchel);
        AddToContainer:addSCROItemsToContainer(inventory, satchel);
        end
end

function AddToInventory:addABMaskPouchToInventory(inventory, maskpouch, player)
    maskpouch = inventory:AddItem("ALICE.GasMaskPouchThigh");
    AddToContainer:addGasmaskToContainer(inventory, maskpouch, player);
end

--
-- MOD FUNCTIONS: Alice Belts
--