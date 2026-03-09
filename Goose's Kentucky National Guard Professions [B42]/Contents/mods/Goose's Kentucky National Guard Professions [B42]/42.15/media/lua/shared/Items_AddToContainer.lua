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
-- Items_AddToContainer.lua

-- serves as a utils class

--
-- VANILLA ITEMS ONLY
--
function AddToContainer:addStandardRationsToContainer(inventory, container)
    for x=1, 5 do
        container:getItemContainer():AddItem("Base.Crackers");
    end
    
    for x=1, 2 do
        container:getItemContainer():AddItem("Base.GranolaBar");
        container:getItemContainer():AddItem("Base.CannedCornedBeef");
        container:getItemContainer():AddItem("Base.BreadSlices");
    end

    container:getItemContainer():AddItem("Base.Teabag2");
    container:getItemContainer():AddItem("Base.Chocolate");
    container:getItemContainer():AddItem("CandyFruitSlices");
end

function AddToContainer:addStandardInventoryGearToContainer(inventory, container, playername)
    container:getItemContainer():AddItem("Base.KnifePocket");
    container:getItemContainer():AddItem("Base.Necklace_DogTag"):setName("Dog Tags: " .. playername);
    container:getItemContainer():AddItem("KNGP.MilitaryIDCard"):setName("Military ID Card: " .. playername);
    container:getItemContainer():AddItem("Base.EntrenchingTool");
end

function AddToContainer:addCombatEngineerGearToContainer(inventory, container)
    for x=1, 2 do
        container:getItemContainer():AddItem("Base.PipeBombTriggered"); -- Pipe Bomb with Timer
        container:getItemContainer():AddItem("Base.PipeBomb");
    end
end

function AddToContainer:addStandardMilitaryPoliceGearToContainer(inventory, container, playername)
    for x=1, 3 do
        container:getItemContainer():AddItem("Base.SmokeBomb");
    end
end

function AddToContainer:addStandardGearToContainer(inventory, container)
    container:getItemContainer():AddItem("Base.CompassDirectional");
    container:getItemContainer():AddItem("Base.Hat_GasMask");
    container:getItemContainer():AddItem("Base.GasmaskFilter");
end

function AddToContainer:addToolsToContainer(inventory, container)
    -- no Wrench to keep exclusivity with Mechanic profession which spawns with it in its main inventory
    container:getItemContainer():AddItem("Base.Screwdriver");
    container:getItemContainer():AddItem("Base.Jack");
    container:getItemContainer():AddItem("Base.BallPeenHammer");
    container:getItemContainer():AddItem("Base.Saw");
    container:getItemContainer():AddItem("Base.Pliers");
    container:getItemContainer():AddItem("Base.Multitool");
end

function AddToContainer:addStandardFirstAidToContainer(inventory, container)
    for x=1, 3 do 
    container:getItemContainer():AddItem("Base.AlcoholBandage"); -- Sterilized Bandages
    container:getItemContainer():AddItem("Base.SutureNeedle");
    end

    container:getItemContainer():AddItem("Base.SutureNeedleHolder"); -- Forceps
    container:getItemContainer():AddItem("Base.ScissorsBluntMedical"); -- Medical Scissors
    container:getItemContainer():AddItem("Base.Pills"); -- Painkillers
    container:getItemContainer():AddItem("Base.Tweezers");
    container:getItemContainer():AddItem("Base.AlcoholWipes");
    container:getItemContainer():AddItem("Base.Gloves_Surgical");
end

function AddToContainer:addAdvancedFirstAidToContainer(inventory, container)
    for x=1, 12 do
    container:getItemContainer():AddItem("Base.AlcoholBandage"); -- Sterilized Bandages
    container:getItemContainer():AddItem("Base.SutureNeedle");
    end

    for x=1, 3 do
        container:getItemContainer():AddItem("Base.AlcoholWipes");
        container:getItemContainer():AddItem("Base.Pills"); -- Painkillers
        container:getItemContainer():AddItem("Base.PillsBeta"); -- Beta Blockers
        container:getItemContainer():AddItem("Base.PillsVitamins"); -- Caffeine Pills
    end

    for x=1, 2 do
        container:getItemContainer():AddItem("Base.Gloves_Surgical");
        container:getItemContainer():AddItem("Base.ComfreyCataplasm"); -- Cataplasm = Poultice
        container:getItemContainer():AddItem("Base.PlantainCataplasm"); -- Cataplasm = Poultice
        container:getItemContainer():AddItem("WildGarlicCataplasm"); -- Cataplasm = Poultice
        container:getItemContainer():AddItem("Base.Splint");
    end

    container:getItemContainer():AddItem("Base.SutureNeedleHolder"); -- Forceps
    container:getItemContainer():AddItem("Base.ScissorsBluntMedical"); -- Medical Scissors
    container:getItemContainer():AddItem("Base.Tweezers");
end

function AddToContainer:addMechanicToolsToContainer(inventory, container)
    -- TODO: Reserved for future mechanic-specific tool loadouts
end

function AddToContainer:addStandardMagazinesToContainer(inventory, container)
    for x=1,5 do
        container:getItemContainer():AddItem("Base.556Clip"):setCurrentAmmoCount(30);
    end

    for x=1, 2 do
        container:getItemContainer():AddItem("Base.9mmClip"):setCurrentAmmoCount(15);
    end
end
--
-- VANILLA ITEMS ONLY
--

--
-- MOD FUNCTIONS: Alice Belts
--

function AddToContainer:addABRationsToContainer(inventory, container)
    for x=1, 5 do
        container:getItemContainer():AddItem("Base.Crackers");
    end

    for x=1, 2 do
        container:getItemContainer():AddItem("Base.GranolaBar");
        container:getItemContainer():AddItem("Base.CannedCornedBeef");
        -- removed water bottles from AB rations to reflect the use of canteens
        container:getItemContainer():AddItem("Base.BreadSlices");
    end

    container:getItemContainer():AddItem("Base.Teabag2");
    container:getItemContainer():AddItem("Base.Chocolate");
    container:getItemContainer():AddItem("CandyFruitSlices");
end

--
-- MOD FUNCTIONS: Alice Belts
--