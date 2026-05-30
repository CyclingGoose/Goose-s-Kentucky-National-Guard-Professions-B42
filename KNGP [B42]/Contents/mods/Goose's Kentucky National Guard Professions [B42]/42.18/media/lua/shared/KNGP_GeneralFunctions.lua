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
