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
-- KNGP_GeneralFunctions.lua

-- holds general utility functions that don't fit in the other utility classes but are still used by multiple functions across the mod, to avoid code duplication and for better organization

function GeneralFunctions:randomNumberTableIndex(table)
    local tablelength = #table;
    return ZombRand(tablelength)+1;
end

function GeneralFunctions:getSandboxVarByProfessionAssaultRifle(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNAssaultRifle;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerAssaultRifle;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicAssaultRifle;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryAssaultRifle;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPoliceAssaultRifle;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportAssaultRifle;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioAssaultRifle;
    end
end

function GeneralFunctions:getSandboxVarByProfessionAssaultRifleMags(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNAssaultRifleMagazines;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerAssaultRifleMagazines;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicAssaultRifleMagazines;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryAssaultRifleMagazines;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPoliceAssaultRifleMagazines;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportAssaultRifleMagazines;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioAssaultRifleMagazines;
    end
end

function GeneralFunctions:getSandboxVarByProfessionPistol(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNPistol;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerPistol;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicPistol;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryPistol;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPolicePistol;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportPistol;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioPistol;
    end
end

function GeneralFunctions:getSandboxVarByProfessionPistolMags(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNPistolMagazines;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerPistolMagazines;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicPistolMagazines;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryPistolMagazines;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPolicePistolMagazines;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportPistolMagazines;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioPistolMagazines;
    end
end

function GeneralFunctions:getSandboxVarByProfessionWebbing(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNWebbing;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerChestrig;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicWebbing;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryChestrig;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPoliceChestrig;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportWebbing;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioWebbing;
    end
end

function GeneralFunctions:getSandboxVarByProfessionMiscGear(prof)

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNSpecialistMiscGear;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerMiscGear;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicMiscGear;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryMiscGear;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPoliceMiscGear;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportOperatorMiscGear;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioOperatorMiscGear;
    end
end

function GeneralFunctions:getSandboxVarByProfessionIFAK()

    if prof == "cbrnspecialist" then
        return SandboxVars.KNGPCBRNSpecialist.CBRNIFAK;
    elseif prof == "combatengineer" then
        return SandboxVars.KNGPEngineer.EngineerIFAK;
    elseif prof == "combatmedic" then
        return SandboxVars.KNGPMedic.MedicIFAK;
    elseif prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryIFAK;
    elseif prof == "militarypolice" then
        return SandboxVars.KNGPMilitaryPolice.MilitaryPoliceIFAK;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportIFAK;
    elseif prof == "singlechannelradiooperator" then
        return SandboxVars.KNGPSingleChannelRadioOperator.SingleChannelRadioIFAK;
    end
end

function GeneralFunctions:getSandboxVarByProfessionBackpacks()
    if prof == "infantryman" then
        return SandboxVars.KNGPInfantry.InfantryBackpack;
    elseif prof == "motortransportoperator" then
        return SandboxVars.KNGPMotorTransportOperator.MotorTransportBackpack;
    end
end

function GeneralFunctions:randomNumber(range)
    return ZombRand(range)+1;
end

function GeneralFunctions:getPhotographByTypeInventory(type, inventory)
    if type == "normal" then
        return inventory:AddItem("KNGP.NormalLorePhotograph");
    elseif type == "knoxEvent" then
        return inventory:AddItem("KNGP.KnoxEventPhotograph");
    else
        return "Photograph";
    end
end

function GeneralFunctions:returnPhotographObjectByTypeInv(inventory, photographType, nameList)
    if not inventory or not photographType or not nameList or #nameList == 0 then
        return nil
    end

    local photograph = GeneralFunctions:getPhotographByTypeInventory(photographType, inventory)
    if not photograph then
        return nil
    end

    local name = nameList[GeneralFunctions:randomNumberTableIndex(nameList)]
    if name then
        photograph:setName(name)
    end

    return photograph
end
