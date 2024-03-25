local _table_HasValue = table.HasValue
local _is_group_user              = {"user"}
local _is_group_supporter         = {"supporter"}
local _is_group_supporterplus     = {"supporterplus"}
local _is_group_memester          = {"memester"}
local _is_group_memelord_or_higer = {"memelord","staffhelper","trialmoderator","moderator","seniormoderator","headmoderator","trialadministrator","administrator","headadministrator","humanresources","superadmin","superadministrator","humanresources","assistantstaffmanager","staffmanager","communitymanager","director","founder"}
local _bitcoin_miner_entities     = {TEAM_BITCOINMINER}
local _gun_dealer_entities        = {TEAM_GUNDEALER,TEAM_HEAVYGUNDEALER,TEAM_BLACKMARKETDEALER}
local _printer_restriction        = ({TEAM_CITIZEN, TEAM_MEDIC, TEAM_BODYGUARD, TEAM_BANKMANAGER, TEAM_HOTELMANAGER, TEAM_FIGHTCLUBMANAGER, TEAM_FIGHTCLUBMEMBER, TEAM_GUNDEALER, TEAM_HEAVYGUNDEALER, TEAM_BLACKMARKETDEALER, TEAM_MAYOR, TEAM_POLICECHIEF, TEAM_POLICEOFFICER, TEAM_SWATCOMMANDER, TEAM_SWATMEDIC, TEAM_SWATSOLDIER, TEAM_JUGGERNAUT, TEAM_SUPERHERO, TEAM_HITMAN, TEAM_ELITEHITMAN, TEAM_THIEF, TEAM_PROTHIEF, TEAM_ELITETHIEF, TEAM_ARMOREDTHIEF, TEAM_COMBATMEDIC, TEAM_CULTIST, TEAM_CULTLEADER, TEAM_ANARCHIST, TEAM_ANARCHISTLEADER, TEAM_CRIP, TEAM_CRIPOG, TEAM_BLOOD, TEAM_BLOODOG, TEAM_MOBSTER, TEAM_MOBBOSS, TEAM_PSYCHOPATH, TEAM_SUPERVILLAIN, TEAM_GOD, TEAM_SATAN, TEAM_TRASHTALKER, TEAM_BULLYHUNTER, TEAM_PIRATE, TEAM_RAPIST, TEAM_BILLCOSBY, TEAM_HENTAILOVER, TEAM_SKELETONDWELLER, TEAM_SKELETONLORD, TEAM_OUTLAW, TEAM_SAMURAI, TEAM_JEDIMASTER, TEAM_CLONETROOPER, TEAM_SITHLORD, TEAM_BATTLEDROID, TEAM_MANDALORIAN, TEAM_JYST3R, TEAM_RIGHTSHARK, TEAM_MURDERER, TEAM_FREEMAN, TEAM_THECOURIER, TEAM_KINGBRAD, TEAM_MASTERTHIEF, TEAM_76561198145516251_MAXIMUM_ZAG, TEAM_76561198197223407_CATERCUCK, TEAM_76561198129204679_GENDER_52, TEAM_76561198138942074_SPEC_OPS_ASSASSIN, TEAM_76561198099470051_THE_MEMELORD, TEAM_76561198069743371_PROFESSIONAL_FUCKBOY, TEAM_76561198166240593_LONGSHLONG, TEAM_76561198082762979_FRENCH_REVOLUTIONIST_LEADER, TEAM_76561198093270134_MERCENARY, TEAM_76561198275873901_VENGEFUL, TEAM_76561198132347869_ART, TEAM_76561198016942578_THE_GOOD_FOX, TEAM_76561198104522064_GOD_KILLER, TEAM_76561198332451030_SHOOTER, TEAM_76561198182810469_BADASS, TEAM_76561198057075412_MASH_CLASS, TEAM_76561198270931964_BOOOOOOOOOOOOOOOOOOOOOB, TEAM_76561198392559702_BILLY_MAYES, TEAM_76561198264628482_MEMER, TEAM_76561198170047450_FAGGOT, TEAM_THATONEGUY, TEAM_76561198148928205_CRAZY_IDIOT, TEAM_76561198215246625_SOULOFTHEBACON, TEAM_76561198087281946_JJRG97, TEAM_76561198205566121_SPONGEBOB, TEAM_76561198087281946_JJRG97_V2, TEAM_76561198215246625_POPOPOPOPO, TEAM_76561198317764308_OP_ROBBER, TEAM_76561198211486524_WEEB, TEAM_76561198239584288_MRSTEVE, TEAM_76561198470806544_STUPIDROBBER, TEAM_76561198221641060_MRKRABS, TEAM_76561198320521182_ROGUE_AGENT, TEAM_76561198405705805_MEGA_FAGGOT, TEAM_76561198087202827_LIL_PUMP, TEAM_76561198076103665_KIM_JONG_UN, TEAM_76561198052906445_PROFESSIONAL, TEAM_76561198147995883_DRUG_KINGPIN, TEAM_76561198134825082_ITS_YA_BOI, TEAM_76561198082612280_REAPERS, TEAM_76561198284892908_OP_SCHOOL_SHOOTER, TEAM_76561198284892908_SPOOKY_BOY, TEAM_76561198392559702_COMMUNIST, TEAM_76561198149713097_ANGRY_CHICKEN, TEAM_76561198082571460_THE_CRANE, TEAM_76561198057588757_ELITEBADASSPRO_THIEF, TEAM_76561198018620455_VIKING, TEAM_76561198140995609_BENDER_RODRIGUEZ, TEAM_76561198317664746_SLAVIC_BORIS, TEAM_76561198107204883_ORIGINAL_GANGSTERS, TEAM_76561198254840516_XXSPIKERAPERXX, TEAM_76561198354432038_NORWAY, TEAM_76561198332451030_ADVANCED_SHOOTER, TEAM_REDACTED, TEAM_76561198056801485_SOLUTION_SPECIALIST, TEAM_76561198282840856_LOL, TEAM_76561198450932148_SUPREME_NIBBA, TEAM_76561198145874030_MIDNIGHT, TEAM_76561198379783024_SCHOOL_SHOOTER, TEAM_76561198148260571_NICKS_CUSTOM_JOB, TEAM_76561198450017678_HACKER, TEAM_76561198118034251_TOPTIER_ASSHOLE, TEAM_76561198346816279_DEMIGOD, TEAM_76561198272353357_ROMAN, TEAM_76561198401339953_CUSTOMCITIZEN, TEAM_76561198401339953_ME, TEAM_76561198411994846_LANDOS_BITMINING_INC, TEAM_76561198151910627_SMITS_TWITS, TEAM_76561198154660043_THE_CULTIST_NIGGERS, TEAM_76561198130521428_SQUEAKER_CONTROL, TEAM_76561198146702235_SAUCY, TEAM_76561198206740131_MAGIC, TEAM_76561198034957436_TOMMY_VERCETTI, TEAM_76561198120486421_BIG_BOI, TEAM_7656119808909363233_THOT_EXTERMINATOR, TEAM_76561197991654304_HITO, TEAM_76561198143096469_MEME_LORD, TEAM_76561197994808897_THOT_PATROL, TEAM_76561198440630939_IF_SHE_BREATHES_SHES_A_THOT, TEAM_76561198053734271_KING_SIZE_GANGSTER, TEAM_76561198278323701_GAMER_GIRL, TEAM_76561198156491596_KENTUCKY_FRIED_CAPITALIST, TEAM_76561198174182945_THE_PUNISHER, TEAM_76561198367989510_STEAMS_BITCH, TEAM_76561198211395485_SOLDIER_OF_FORTUNE, TEAM_76561198061257407_HEKKA_UNIT, TEAM_76561198272382186_TAILS, TEAM_76561198089093632_KNUCKLES, TEAM_76561198118084363_SONIC_THE_HEDGEHOG, TEAM_76561198201845667_GAY_BANDITS, TEAM_76561198218502560_THECRIMSONFUCKR, TEAM_76561198820905659_SNEAKY_BOI, TEAM_76561198081531999_SPYRO, TEAM_76561198216317827_CORVO, TEAM_76561198088944638_BAKER_HOMOSEXUAL, TEAM_76561198148260571_LINK, TEAM_76561198051568308_THE_GEORGONATOR, TEAM_76561198292593031_SNEKY_BOYOS, TEAM_76561198833774184_DAS_SCOOPS, TEAM_76561198117623897_SUPREME_THIEF, TEAM_76561198180001323_DEEZ_NUTS_GUY, TEAM_76561198062924385_SALT_BROTHER, TEAM_76561198205391788_ALEKPOOL, TEAM_76561198070773323_007, TEAM_76561198338565916_KAT, TEAM_76561198286214496_THEFLERFFYBURR, TEAM_76561197967886474_HARRY_STYLES, TEAM_76561198331879260_PASTAFARIAN, TEAM_76561198073862110_OMEGA, TEAM_76561198042186082_GARY_BUSEY, TEAM_76561198098413786_LIKE_A_BOSS, TEAM_76561198088681353_BOUTY_HUNTER, TEAM_76561198167055634_DEAD_POOL, TEAM_76561198141540656_THE_BEAN, TEAM_76561198069131995_BABY_CHEF, TEAM_76561198253043856_DEQUAVIS, TEAM_76561198193751094_ANGRY_JOHN_STAMOS, TEAM_76561198176541530_SOLID_SNAKE, TEAM_76561198068474103_FIRE_N_ICE, TEAM_76561198305787535_BJ_STEVEN, TEAM_76561198085339439_PAPST_JOHANNES, TEAM_76561198166097211_ANGEL, TEAM_76561198069815558_THE_KING, TEAM_ELITEWEEB, TEAM_FFLEETHUNTER, TEAM_HYPEBEAST, TEAM_PLAGUEDOCTOR, TEAM_PLAGUEDOCTOR, TEAM_DARKANGEL, TEAM_STARLORD, TEAM_THEIRS, TEAM_ANDROIDXVJ, TEAM_THEEXOTICTHIEF, TEAM_SIMPLEGAMER, TEAM_FAT, TEAM_DONCHEADLE, TEAM_BAD, TEAM_ACEGAMING})
-----------------------------------------------------------
-- Vending Machine
-----------------------------------------------------------
DarkRP.createEntity("Vending Machine", {
    ent = "zvm_machine",
    model = "models/zerochain/props_vendingmachine/zvm_machine.mdl",
    price = 5000,
    max = 1,
    cmd = "vendingmachine",
    category = "Other",
    allowed = _gun_dealer_entities
})
-----------------------------------------------------------
-- Gas Mask (Mustard Gas)
-----------------------------------------------------------
DarkRP.createEntity("Gas Mask", {
    ent = "item_sh_gasmask",
    model = "models/Items/BoxMRounds.mdl",
    price = 25000,
    max = 1,
    cmd = "gasmask",
    category = "Other",
    allowed = _gun_dealer_entities
})
-----------------------------------------------------------
-- Money Clickers (User)
-----------------------------------------------------------
DarkRP.createEntity("Bronze Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 5000,
    max = 1,
    cmd = "bronzeclicker",
    category = "Money Clickers",
    allowed = TEAM_MONEYPRINTER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 35,
        maxPoints = 500,
        maxMoney = 25000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = {10,12,14,16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(205, 127, 50),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Silver Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 7500,
    max = 1,
    cmd = "silverclicker",
    category = "Money Clickers",
    allowed = TEAM_MONEYPRINTER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 40,
        maxPoints = 500,
        maxMoney = 55000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(169, 169, 169),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Gold Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 9500,
    max = 1,
    cmd = "goldclicker",
    category = "Money Clickers",
    allowed = TEAM_MONEYPRINTER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 45,
        maxPoints = 500,
        maxMoney = 60000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(197, 179, 88),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Diamond Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 11500,
    max = 1,
    cmd = "diamondclicker",
    category = "Money Clickers",
    allowed = TEAM_MONEYPRINTER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 50,
        maxPoints = 500,
        maxMoney = 65000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,
        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(154, 197, 219),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
local NoMiners = {
"Prostitute",
"Trashman",
"Fake-Admin On Duty",
"Hobo",
"Hobo King",
"Fight Club Member",
"God",
"Satan",
"Trash Talker",
"Bully Hunter",
"Skeleton Lord",
"Skeleton Dweller",
"AFK - Away From Keyboard",
"Businessman",
"Fruit Slicer",
"Fuel Refiner",
"Miner",
"Moonshine Distiller",
"Pizza Chef",
"Weed Grower",
"Money Printer Professional",
"Fight Club Manager",
"Mayor",
"Police Chief",
"Police Officer",
"S.W.A.T. Commander",
"S.W.A.T. Medic",
"S.W.A.T. Soldier",
"Juggernaut",
"Batman",
"Spiderman",
"Chicken",
"Elmo",
"Kermit The Frog",
"Penguin",
"Pet Baby-Shark",
"Pet Cat",
"Pet Dog",
"Pet Mouse",
"Pet Raccoon",
"Pet Shark",
"Pet Tiger",
"Pet Ugandan-Knuckles",
"Staff On Dooty"}
-- Bitminer Entities
DarkRP.createEntity("Power Cable", {
    ent = "ch_bitminer_power_cable",
    model = "models/craphead_scripts/bitminers/utility/plug.mdl",
    price = 1,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 15 else return 5 end end,
    category = "Bitminer Equipment",
    cmd = "buypowercable",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Generator", {
    ent = "ch_bitminer_power_generator",
    model = "models/craphead_scripts/bitminers/power/generator.mdl",
    price = 3000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buypowergenerator",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Solar Panel", {
    ent = "ch_bitminer_power_solar",
    model = "models/craphead_scripts/bitminers/power/solar_panel.mdl",
    price = 10000,
    max = 12,
    allowed = {TEAM_BITCOINMINER,TEAM_BANKMANAGER},
    category = "Bitminer Equipment",
    cmd = "buysolarpanel",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,})

DarkRP.createEntity("Power Combiner", {
    ent = "ch_bitminer_power_combiner",
    model = "models/craphead_scripts/bitminers/power/power_combiner.mdl",
    price = 500,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buypowercombiner",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,})

DarkRP.createEntity("Radioisotope Thermoelectric Generator", {
    ent = "ch_bitminer_power_rtg",
    model = "models/craphead_scripts/bitminers/power/rtg.mdl",
    price = 100000,
    max = 4,
    allowed = {TEAM_BITCOINMINER},
    category = "Bitminer Equipment",
    cmd = "buynucleargenerator",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,})

DarkRP.createEntity("Bitmining Shelf", {
    ent = "ch_bitminer_shelf",
    model = "models/craphead_scripts/bitminers/rack/rack.mdl",
    price = 750,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buyminingshelf",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Cooling Upgrade 1", {
    ent = "ch_bitminer_upgrade_cooling1",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_1.mdl",
    price = 10000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buycooling1",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Cooling Upgrade 2", {
    ent = "ch_bitminer_upgrade_cooling2",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_2.mdl",
    price = 15000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buycooling2",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Cooling Upgrade 3", {
    ent = "ch_bitminer_upgrade_cooling3",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_3.mdl",
    price = 25000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buycooling3",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Single Miner", {
    ent = "ch_bitminer_upgrade_miner",
    model = "models/craphead_scripts/bitminers/utility/miner_solo.mdl",
    price = 3000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 48 else return 16 end end,
    category = "Bitminer Equipment",
    cmd = "buysingleminer",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("RGB Kit Upgrade", {
    ent = "ch_bitminer_upgrade_rgb",
    model = "models/craphead_scripts/bitminers/utility/rgb_kit.mdl",
    price = 1000000,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 3 else return 1 end end,
    category = "Bitminer Equipment",
    cmd = "buyrgbkit",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Power Supply Upgrade", {
    ent = "ch_bitminer_upgrade_ups",
    model = "models/craphead_scripts/bitminers/utility/ups_solo.mdl",
    price = 900,
    getMax = function(ply) if tostring(team.GetName(ply:Team())) == "Bitcoin Miner Professional" or tostring(team.GetName(ply:Team())) == "Bank Manager" then return 12 else return 4 end end,
    category = "Bitminer Equipment",
    cmd = "buyupsupgrade",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Fuel - Small", {
    ent = "ch_bitminer_power_generator_fuel_small",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 75,
    max = 5,
    category = "Bitminer Equipment",
    cmd = "buygeneratorfuelsmall",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Fuel - Medium", {
    ent = "ch_bitminer_power_generator_fuel_medium",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 100,
    max = 5,
    category = "Bitminer Equipment",
    cmd = "buygeneratorfuelmedium",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Fuel - Large", {
    ent = "ch_bitminer_power_generator_fuel_large",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 500,
    max = 5,
    category = "Bitminer Equipment",
    cmd = "buygeneratorfuellarge",
    customCheck = function(ply) return !table.HasValue(NoMiners, team.GetName(ply:Team())) end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})

DarkRP.createEntity("Specialty Cleaning Fluid", {
    ent = "ch_bitminer_upgrade_clean_dirt",
    model = "models/craphead_scripts/bitminers/cleaning/spraybottle.mdl",
    price = 3000,
    max = 5,
    category = "Bitminer Equipment",
    cmd = "buydirtcleanfluid",
    customCheck = function(ply) return team.GetName(ply:Team()) == "Bitcoin Miner Professional" end,
    CustomCheckFailMsg = function(ply, entTable) return "You're not the correct team to spawn this item!" end,
})


-- Bank Manager
DarkRP.createEntity("Bronze Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 5000,
    max = 3,
    cmd = "bankbronzeclicker",
    category = "Money Clickers",
    allowed = TEAM_BANKMANAGER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 12,
        maxPoints = 500,
        maxMoney = 25000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = {10,12,14,16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(205, 127, 50),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Silver Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 7500,
    max = 3,
    cmd = "banksilverclicker",
    category = "Money Clickers",
    allowed = TEAM_BANKMANAGER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 14,
        maxPoints = 500,
        maxMoney = 55000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(169, 169, 169),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Gold Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 9500,
    max = 3,
    cmd = "bankgoldclicker",
    category = "Money Clickers",
    allowed = TEAM_BANKMANAGER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 15,
        maxPoints = 500,
        maxMoney = 60000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,

        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(197, 179, 88),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})
-----------------------------------------------------------
DarkRP.createEntity("Diamond Clicker", {
    ent =  "money_clicker",
    model = "models/props_c17/consolebox01a.mdl",
    price = 11500,
    max = 3,
    cmd = "bankdiamondclicker",
    category = "Money Clickers",
    allowed = TEAM_BANKMANAGER,
    mClickerInfo = {
        pointsPerCycle = 25,
        moneyPerCycle = 20,
        maxPoints = 500,
        maxMoney = 65000,
        health = 100,
        indestructible = false,
        repairHealthCost = 100,
        maxCycles = 2000,
        repairBrokenCost = 25000,
        upgrades = {
            autoClick = {
                name = "Professional Idler",
                stats = {0,1,2,4,6,8,10},
                prices = {200,400,600,800,1000,1500},
            },
            clickPower = {
                name = "Power Clicker",
                stats = { 10, 12, 14, 16,18,20,25,50},
                prices = {200,400,600,800,1000,3000,10000},
            },
            cooling = {
                name = "Cooler Master",
                stats = {3, 4, 5, 6 },
                prices = {200,300,400},
            },
            storage = {
                name = "Hardcore Hoarder",
                stats = {1,2,4,8,16,24 },
                prices = {200,400,600,800,1000},
            },
        },

        enableHeat = false,
        heatPerClick = 20,

    	colorPrimary = Color(154, 197, 219),
    	colorSecondary = Color(40, 40, 40),
        colorText = Color(255, 255, 255),
        colorHealth = Color(255, 100, 100),
    }
})