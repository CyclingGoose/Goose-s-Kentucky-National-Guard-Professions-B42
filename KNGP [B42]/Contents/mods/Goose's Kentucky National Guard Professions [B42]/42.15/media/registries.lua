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
-- registries.lua

-- registers the lua classes and professions

KNGProfessions = {}
AddToInventory = {}
AddToContainer = {}
KNGProfessions.CharacterProfession = {}
KNGProfessions.CharacterTrait = {}

KNGProfessions.CharacterProfession.KNG_Infantryman = CharacterProfession.register("kngprofessions:infantryman")
KNGProfessions.CharacterProfession.KNG_CombatMedic = CharacterProfession.register("kngprofessions:combatmedic")
KNGProfessions.CharacterProfession.KNG_MilitaryPolice = CharacterProfession.register("kngprofessions:militarypolice")
KNGProfessions.CharacterProfession.KNG_CombatEngineer = CharacterProfession.register("kngprofessions:combatengineer")
KNGProfessions.CharacterProfession.KNG_MotorTransportOperator = CharacterProfession.register("kngprofessions:motortransportoperator")
KNGProfessions.CharacterProfession.KNG_SingleChannelRadioOperator = CharacterProfession.register("kngprofessions:singlechannelradiooperator")
KNGProfessions.CharacterProfession.KNG_CBRNSpecialist = CharacterProfession.register("kngprofessions:cbrnspecialist")
