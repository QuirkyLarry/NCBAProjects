local _Color                        = Color
local _table_HasValue               = table.HasValue
local _math_random                  = math.random
local _is_group_staff               = {"trialmoderator","moderator","seniormoderator","headmoderator","trialadministrator","administrator","admin","headadministrator","superadministrator","superadmin","humanresources","assistantstaffmanager","staffmanager","communitymanager","director","founder"}
local GAMEMODE = GAMEMODE or GM
local _CFG = GAMEMODE.Config
-----------------------------------------------------------
--                      Citizen Jobs
-----------------------------------------------------------
TEAM_CITIZEN = DarkRP.createJob("Citizen", {
    color = _Color(0, 255, 0),
    model = "models/player/Group01/Female_01.mdl",
    description = [[The Citizen is the most basic level of society you can hold besides being a hobo. You have no specific role in city life.]],
    weapons = {},
    command = "citizen",
    max = 0,
    salary = 450,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
    sortOrder = 100,
})

TEAM_FAKEADMIN = DarkRP.createJob("Fake-Admin On Duty", {
    color = _Color(0, 255, 0),
    model = "models/player/superheroes/superman.mdl",
    description = [[You are a fake admin, you must try and trick player(s) into believing you are an admin.You may impersonate staff or (pretend) to be a person that is currently staff.]],
    weapons = {"weapon_spidermods_noshoot"},
    command = "fakeadmin",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 105,
})

TEAM_GUITARIST = DarkRP.createJob("Guitarist", {
    color = _Color(0, 255, 0),
    model = "models/player/group01/male_01.mdl",
    description = [[You are a Guitarist, play some beatiful music.]],
    weapons = {"guitar_1"},
    command = "guitarist",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 110,
})

TEAM_MEDIC = DarkRP.createJob("Medic", {
    color = _Color(0, 255, 0),
    model = "models/player/kleiner.mdl",
    description = [[The Medic is a basic job with a large salary, heal players whenever it's need. Feel free to charge your clients.]],
    weapons = {"weapon_medkit"},
    command = "medic",
    max = 2,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    medic = true,
    category = "Citizens",
    sortOrder = 115,
})

TEAM_HOBO = DarkRP.createJob("Hobo", {
    color = _Color(0, 255, 0),
    model = "models/jessev92/player/l4d/m9-hunter.mdl",
    description = [[The Hobo is as rock bottom as it can get in society, you beg for money whenever possible in efforts to make your life better.]],
    weapons = {"weapon_bugbait", "weapon_angryhobo", "weapon_gpee"},
    command = "hobo",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    hobo = true,
    category = "Citizens",
    sortOrder = 120,
})

TEAM_HOBOKING = DarkRP.createJob("Hobo King", {
    color = _Color(0, 255, 0),
    model = "models/ninja/vaas.mdl",
    description = [[The Hobo is as rock bottom as it can get in society, your job as a hobo king is to lead your fellow hobos to better habbits and potentially create a hobo sanctuary.]],
    weapons = {"weapon_bugbait", "weapon_angryhobo", "weapon_gpee"},
    command = "hoboking",
    max = 0,
    salary = 17,
    admin = 0,
    vote = false,
    hasLicense = false,
    hobo = true,
    category = "Citizens",
    sortOrder = 125,
})

TEAM_BODYGUARD = DarkRP.createJob("Body Guard", {
    color = _Color(0, 255, 0),
    model = "models/player/odessa.mdl",
    description = [[The job of a Bodyguard is to find clients who are in need of protection, charge whatever price you feel is right.]],
    weapons = {"weapon_stunstick"},
    command = "bodyguard",
    max = 2,
    salary = 465,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 130,
})

TEAM_FIGHTCLUBMEMBER = DarkRP.createJob("Fight Club Member", {
    color = _Color(0, 255, 0),
    model = "models/player/odessa.mdl",
    description = [[Listen to your manager and remember, Don't forget rule number one! Never talk about fight club.]],
    weapons = {},
    command = "fightclubmember",
    max = 0,
    salary = 400,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 140,
})

TEAM_GOD = DarkRP.createJob("God", {
    color = _Color(0, 255, 0),
    model = "models/player/wdm_jesus_player.mdl",
    description = [[God is the eternal being who created and preserves all things.]],
    weapons = {"weapon_bible"},
    command = "god",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 145,
})

TEAM_SATAN = DarkRP.createJob("Satan", {
    color = _Color(0, 255, 0),
    model = "models/player/demon_violinist/demon_violinist.mdl",
    description = [[Satan is seen as the objectification of a hostile and destructive force.]],
    weapons = {},
    command = "satan",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 150,
})

TEAM_TRASHTALKER = DarkRP.createJob("Trash Talker", {
    color = _Color(0, 255, 0),
    model = "models/player/bully/jimmy.mdl",
    description = [[
    Walk around and talk trash to people.
    If they kill you, you get a nifty payout from their wallet.
    
    Beware of the Bully Hunter, you will not get paid from them killing you.
    ]],
    weapons = {},
    command = "trashtalker",
    max = 0,
    salary = 140,
    admin = 0,
    vote = false,
    hasLicense = false,
    PlayerDeath = function(ply, weapon, killer)
        if ply == killer then return end
        if tostring(team.GetName(killer:Team())) ~= "Bully Hunter" then return end
        local payoutPerc = (math.random(5, 15) / 100)
        local playerWallet = ply:getDarkRPVar("money")
        local payout = math.Round(playerWallet * payoutPerc)
        if payout >= playerWallet then killer:ChatPrint("[Trash Talker]: You were unable to secure the bag.") return end
        ply:addMoney(-payout)
        killer:addMoney(payout * .90)
        payout = DarkRP.formatMoney(math.Round(payout * .90))
        ply:ChatPrint("[Trash Talker]: Looks like you couldn't handle your shit. You lost " .. payout .. " to the Trash talker.")
        killer:ChatPrint("[Trash Talker]: You did good kid, you got " .. payout .. " from that smuck.")
    end,
    category = "Citizens",
    sortOrder = 155,
})

TEAM_BULLYHUNTER = DarkRP.createJob("Bully Hunter", {
    color = _Color(0, 255, 0),
    model = "models/player/spyplayer/spy.mdl",
    description = [[You may shoot trash talkers when they're talking trash.]],
    weapons = {},
    command = "bullyhunter",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    PlayerDeath = function(ply, weapon, killer)
        if ply == killer then return end
        if tostring(team.GetName(killer:Team())) ~= "Trash Talker" then return end
        local payoutPerc = (math.random(5, 15) / 100)
        local playerWallet = ply:getDarkRPVar("money")
        local payout = math.Round(playerWallet * payoutPerc)
        if payout >= playerWallet then killer:ChatPrint("[Trash Talker]: You were unable to secure the bag.") return end
        ply:addMoney(-payout)
        killer:addMoney(payout * .90)
        payout = DarkRP.formatMoney(math.Round(payout * .90))
        ply:ChatPrint("[Trash Talker]: Looks like you couldn't handle your shit. You lost " .. payout .. " to the Trash talker.")
        killer:ChatPrint("[Trash Talker]: You did good kid, you got " .. payout .. " from that smuck.")
    end,
    category = "Citizens",
    sortOrder = 160,
})

TEAM_SKELETONLORD = DarkRP.createJob("Skeleton Lord", {
    color = _Color(0, 255, 0),
    model = "models/player/spanish_skeleton.mdl",
    description = [[]],
    weapons = {"m9k_damascus"},
    command = "skeletonlord",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 165,
})

TEAM_SKELETONDWELLER = DarkRP.createJob("Skeleton Dweller", {
    color = _Color(0, 255, 0),
    model = "models/player/skeleton.mdl",
    description = [[]],
    weapons = {"m9k_damascus"},
    command = "skeletondweller",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    sortOrder = 170,
})

TEAM_AFK = DarkRP.createJob("AFK - Away From Keyboard", {
    color = _Color(0, 255, 0),
    model = "models/props_c17/doll01.mdl",
    description = [[Become this job if you're planning on going afk for a long period of time!]],
    weapons = {},
    command = "afk",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
    sortOrder = 175,
})
-----------------------------------------------------------
-- Business Owners
-----------------------------------------------------------
TEAM_ARMSDEALER = DarkRP.createJob("Arms Dealer", {
    color = _Color(0, 200, 255),
    model = "models/player/monk.mdl",
    description = [[The job of a Gun Dealer is to create a shop and sell players weapons.]],
    weapons = {},
    command = "armsdealer",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Business Owners",
    sortOrder = 200,
})
TEAM_BLACKMARKETDEALER = DarkRP.createJob("Black Market Dealer", {
    color = _Color(0, 200, 255),
    model = "models/player/eli.mdl",
    description = [[The job of a Black Market Dealer is to create a shop and sell players weapons.]],
    weapons = {},
    command = "blackmarketdealer",
    max = 2,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Business Owners",
    sortOrder = 205,
})

TEAM_BITCOINMINER = DarkRP.createJob("Bitcoin Miner Professional", {
    color = _Color(0, 200, 255),
    model = "models/player/Group01/Female_01.mdl",
    description = [[The Bitcoin Miner's Job is to experiment with cryptocurrency and see which way is the most efficent for mining them.]],
    weapons = {},
    command = "bitcoinminer",
    max = 2,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Business Owners",
    sortOrder = 210,
})
TEAM_HOTELMANAGER = DarkRP.createJob("Hotel Manager", {
    color = _Color(0, 200, 255),
    model = "models/player/donald_trump.mdl",
    description = [[The Hotel Manager's job is to create a living place for other players to live in. Best way to make money is to charge for rent!]],
    weapons = {},
    command = "hotelmanager",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Business Owners",
    sortOrder = 215,
})

TEAM_FIGHTCLUBMANAGER = DarkRP.createJob("Fight Club Manager", {
    color = _Color(0, 200, 255),
    model = "models/player/barney.mdl",
    description = [[The job of Fight Club Manager is to create a fight club, simple as that.. Don't forget rule number one, never talk about fight club.]],
    weapons = {},
    command = "fightclubmanager",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Business Owners",
    sortOrder = 220,
})
TEAM_BANKMANAGER = DarkRP.createJob("Bank Manager", {
    color = _Color(0, 200, 255),
    model = "models/player/Group01/Female_01.mdl",
    description = [[The Bank Manager's job is to create a bank and offer people of their choice or everybody an option to store their things with that bank.]],
    weapons = {},
    command = "bankmanager",
    max = 1,
    salary = 450,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Business Owners",
    sortOrder = 230,
})
-----------------------------------------------------------
-- Governemnt Jobs
-----------------------------------------------------------
TEAM_MAYOR = DarkRP.createJob("Mayor", {
    color = _Color(0,19,85),
    model = "models/mayor.mdl",
    description = [[Your job as the Mayor is to keep the city running and stable. You may change laws and manage your law enforcement.

    Commands:
    /lottery (starts a lottery)
    /placelaws (spawns a Law Board)
    /addlaws (adds laws to the Law Board)
    /lockdown (initiates a lockdown)
    /unlockdown (cancels the lockdown)
    /wanted name reason (arrest warrant)
    /unwanted name reason (unarrest warrant)
    /warrant name reason (search warrant)]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_model500"},
    command = "mayor",
    max = 1,
    salary = 1750,
    admin = 0,
    vote = true,
    hasLicense = true,
    mayor = true,
    PlayerDeath = function(ply, weapon, killer)
        if ply == killer then return end
        local hitmen = {"Hitman","Elite-Hitman"}
        if table.HasValue(hitmen,team.GetName(killer:Team())) then return CH_Purge.StartPurge() end
        ply:teamBan()
        ply:changeTeam(GAMEMODE.DefaultTeam, true)
        DarkRP.notifyAll(0, 4, "The Mayor has become too much of a liability and is therefore demoted.")
    end,
    category = "Government",
    sortOrder = 305,
})

TEAM_POLICECHIEF = DarkRP.createJob("Police Chief", {
    color = _Color(0,19,85),
    model = "models/player/valley/jim_gordon.mdl",
    description = [[Your job as the Police Chief is to keep track of your officers and their behaviors. Keep them in line and don't forget to check up on the mayor about new or changing laws.

    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house
    ]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_mossberg590"},
    command = "policechief",
    max = 1,
    salary = 1000,
    admin = 0,
    vote = true,
    hasLicense = true,
    chief = true,
    category = "Government",
    sortOrder = 310,
})

TEAM_POLICEOFFICER = DarkRP.createJob("Police Officer", {
    color = _Color(0,19,85),
    model = "models/player/clannypolice/male_09.mdl",
    description = [[Your job as the Police Officer is to enforce the mayor's laws and keep the city safe from thieves and marauders.

    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_colt1911"},
    command = "policeofficer",
    max = 6,
    salary = 500,
    admin = 0,
    vote = true,
    hasLicense = true,
    PlayerSpawn = function(ply)
        local level = GlorifiedLeveling.GetPlayerLevel(ply)
        if level < 2 then
            ply:SetSkin( 0 )
        elseif level < 4 then
            ply:SetSkin( 1 )
        elseif level < 6 then
            ply:SetSkin( 2 )
        elseif level < 8 then
            ply:SetSkin( 3 )
        elseif level < 10 then
            ply:SetSkin( 4 )
        elseif level < 12 then
            ply:SetSkin( 5 )
        elseif level < 14 then
            ply:SetSkin( 6 )
        elseif level < 16 then
            ply:SetSkin( 7 )
        elseif level < 18 then
            ply:SetSkin( 8 )
        elseif level < 20 then
            ply:SetSkin( 9 )
        elseif level < 22 then
            ply:SetSkin( 10 )
        elseif level < 24 then
            ply:SetSkin( 11 )
        elseif level < 26 then
            ply:SetSkin( 12 )
        elseif level < 28 then
            ply:SetSkin( 13 )
        end
    end,
    category = "Government",
    sortOrder = 315,
})

TEAM_SWATCOMMANDER = DarkRP.createJob("S.W.A.T. Commander", {
    color = _Color(0,19,85),
    model = "models/player/combine_soldier.mdl",
    description = [[The job of a S.W.AT. Commander is to keep your swat officers in line and make sure to keep in close communication with your police chief to aid in raids against criminals.

    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house
    ]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_m416","door_ram"},
    command = "swatcommander",
    max = 1,
    salary = 650,
    admin = 0,
    vote = true,
    hasLicense = true,
    category = "Government",
    sortOrder = 320,
})

TEAM_SWATMEDIC = DarkRP.createJob("S.W.A.T. Medic", {
    color = _Color(0,19,85),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = [[The job of a S.W.AT. Medic is to heal any law enforcement in need of it. Keep your fellow officers safe and healthy!

    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house
    ]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_mossberg590","weapon_medkit","door_ram"},
    command = "swatmedic",
    max = 2,
    salary = 600,
    admin = 0,
    vote = true,
    hasLicense = true,
    category = "Government",
    sortOrder = 325,
})

TEAM_SWATSOLDIER = DarkRP.createJob("S.W.A.T. Soldier", {
    color = _Color(0,19,85),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = [[The job of a S.W.AT. Soldier is to follow your commanders orders and strategies to take down the advanced criminals of the society.

    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house
    ]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_g36","door_ram"},
    command = "swatsoldier",
    max = 3,
    salary = 600,
    admin = 0,
    vote = true,
    hasLicense = true,
    category = "Government",
    sortOrder = 330,
})

TEAM_JUGGERNAUT = DarkRP.createJob("Juggernaut", {
    color = _Color(0,19,85),
    model = "models/tfusion/playermodels/mw3/juggernaut_c.mdl",
    description = [[The job of a Juggernaut is to follow your the S.W.A.T. Commanders orders and strategies to take down the advanced criminals of the society.
    Commands:
    /wanted (name) (reason) - Requests a player wanted for a specific reason
    /unwanted (name) (reason) - Requests the player unwanted for a reason
    /warrant (name) (reason) (search warrant) - Requests the search of a players house
    ]],
    weapons = {"weapon_stunstick","arrest_stick","unarrest_stick","weapon_r_handcuffs","stungun","zwf_sniffer","m9k_m249lmg","door_ram"},
    command = "juggernaut",
    max = 1,
    salary = 700,
    admin = 0,
    vote = true,
    hasLicense = true,
    category = "Government",
    sortOrder = 335,
})

TEAM_BATMAN = DarkRP.createJob("Batman", {
    color = _Color(0,19,85),
    model = "models/batman/slow/jamis/mkvsdcu/batman/slow_pub_v2.mdl",
    description = [[You are Batman!]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","fine_list","weapon_r_handcuffs","swep_batclaw","stungun","zwf_sniffer"},
    command = "batman",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = true,
    PlayerDeath = function(ply, weapon, killer)
        if ply == killer then return end
        if tostring(team.GetName(killer:Team())) ~= "The Joker" then return end
        local payoutPerc = (math.random(5, 15) / 100)
        local playerWallet = ply:getDarkRPVar("money")
        local payout = math.Round(playerWallet * payoutPerc)
        if payout >= playerWallet then killer:ChatPrint("[Trash Talker]: You were unable to secure the bag.") return end
        ply:addMoney(-payout)
        killer:addMoney(payout * .90)
        payout = DarkRP.formatMoney(math.Round(payout * .90))
        ply:ChatPrint("[Trash Talker]: Looks like you couldn't handle your shit. You lost " .. payout .. " to the Trash talker.")
        killer:ChatPrint("[Trash Talker]: You did good kid, you got " .. payout .. " from that smuck.")
    end,
    category = "Government",
    sortOrder = 340,
})
TEAM_SPIDERMAN = DarkRP.createJob("Spiderman", {
    color = _Color(0,19,85),
    model = "models/kryptonite/spiderman_2/spiderman_2.mdl",
    description = [[You are the crime fighting ass-kicker! You work for the Police Department, and take orders from the Police Chief.]],
    weapons = {"arrest_stick","unarrest_stick","stunstick","door_ram","fine_list","weapon_r_handcuffs","weapon_spidermods","stungun","zwf_sniffer"},
    command = "spiderman",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Government",
    sortOrder = 345,
})
-----------------------------------------------------------
-- Criminal Jobs
-----------------------------------------------------------
TEAM_HITMAN = DarkRP.createJob("Hitman", {
    color = _Color(255, 0, 0),
    model = "models/player/hitman_absolution_47_classic.mdl",
    description = [[The Hitman's job is to take hired murders or hits on other players by players.]],
    weapons = {},
    command = "hitman",
    max = 2,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 405,
})
TEAM_ELITEHITMAN = DarkRP.createJob("Elite-Hitman", {
    color = _Color(255, 0, 0),
    model = "models/player/valley/deadpool.mdl",
    description = [[The Elite Hitman's job is to take hired murders or hits on other players by players.]],
    weapons = {"m9k_barret_m82","m9k_machete"},
    command = "elitehitman",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 410,
})
TEAM_THIEF = DarkRP.createJob("Thief", {
    color = _Color(255, 0, 0),
    model = "models/player/phoenix.mdl",
    description = [[The Thief's job is to attempt to steal from others or raid others in order to gain or profit.]],
    weapons = {"lockpick_noob", "swep_pickpocket","csgo_bayonet"},
    command = "thief",
    max = 8,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 415,
})

TEAM_PROTHIEF = DarkRP.createJob("Pro Thief", {
    color = _Color(255, 0, 0),
    model = "models/dodylicious/gta5/el_rubio.mdl",
    description = [[The Pro-Thief's job is to attempt to steal from others or raid others in order to gain or profit.]],
    weapons = {"lockpick_pro", "swep_pickpocket","csgo_butterfly"},
    command = "prothief",
    max = 8,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 420,
})

TEAM_ELITETHIEF = DarkRP.createJob("Elite Thief", {
    color = _Color(255, 0, 0),
    model = "models/dodylicious/gta5/maxim_rashkovsky.mdl",
    description = [[The Elite-Thief's job is to attempt to steal from others or raid others in order to gain or profit.]],
    weapons = {"lockpick_elite", "swep_pickpocket","csgo_falchion"},
    command = "elitethief",
    max = 8,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 425,
})

TEAM_ARMOREDTHIEF = DarkRP.createJob("Armored Thief", {
    color = _Color(255, 0, 0),
    model = "models/dodylicious/gta5/el_rubio.mdl",
    description = [[The Armored-Thief's job is to attempt to steal from others or raid others in order to gain or profit. Help your fellow thiefs out in raids!]],
    weapons = {"lockpick_elite", "swep_pickpocket","csgo_flip"},
    command = "armoredthief",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 430,
})
TEAM_COMBATMEDIC = DarkRP.createJob("Combat Medic", {
    color = _Color(255, 0, 0),
    model = "models/dodylicious/gta5/miguel_madrazo.mdl",
    description = [[The Combat Medic's job is to heal and assist criminals in their work.]],
    weapons = {"swep_pickpocket", "med_kit"},
    command = "combatmedic",
    max = 2,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 435,
})

TEAM_CULTLEADER = DarkRP.createJob("Cult Leader", {
    color = _Color(255, 0, 0),
    model = "models/player/corvo.mdl",
    description = [[The Cult Leader's job is to teach your ideals to your cultists and encourage them to push it.]],
    weapons = {"weapon_r_restrains", "weapon_r_baton"},
    command = "cultleader",
    max = 1,
    salary = 0,
    admin = 0,
    vote = true,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 440,
})
TEAM_CULTIST = DarkRP.createJob("Cultist", {
    color = _Color(255, 0, 0),
    model = "models/player/corvo.mdl",
    description = [[The Cultist's job is to push their leaders ideals and kidnap people players to do rituals or ransom.]],
    weapons = {"weapon_r_restrains", "weapon_r_baton"},
    command = "cultist",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 445,
})
TEAM_CRIPOG = DarkRP.createJob("Crip Gang Leader", {
    color = _Color(255, 0, 0),
    model = "models/gta_peds/fam2.mdl",
    description = [[The Crip's Leaders responsibility is to represent his gang and be loyal to his OGs. Lead your Crips and give teach them your knowledge of the gang life.]],
    weapons = {"lockpick_noob", "swep_pickpocket", "m9k_tec9"},
    command = "cripleader",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 450,
})
TEAM_CRIP = DarkRP.createJob("Crip", {
    color = _Color(255, 0, 0),
    model = "models/gta_peds/fam1.mdl","models/gta_peds/fam3.mdl",
    description = [[The Crip's responsibility is to represent his gang and be loyal to his OGs.]],
    weapons = {"lockpick_noob", "swep_pickpocket"},
    command = "crip",
    max = 3,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 455,
})
TEAM_BLOODOG = DarkRP.createJob("Blood Gang Leader", {
    color = _Color(255, 0, 0),
    model = "models/ms13/slow_3.mdl",
    description = [[The Blood's Leaders responsibility is to represent his gang and be loyal to his OGs. Lead your fellow Bloods teach them your knowledge of the gang life.]],
    weapons = {"lockpick_noob", "swep_pickpocket","m9k_tec9"},
    command = "bloodleader",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 460,
})
TEAM_BLOOD = DarkRP.createJob("Blood", {
    color = _Color(255, 0, 0),
    model = "models/ms13/slow_2.mdl",
    description = [[The Blood's responsibility is to represent his gang and be loyal to his OGs.]],
    weapons = {"lockpick_noob", "swep_pickpocket"},
    command = "blood",
    max = 3,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 465,
})
TEAM_PSYCHOPATH = DarkRP.createJob("Psychopath", {
    color = _Color(255, 0, 0),
    model = "models/player/giwake/jermaregular.mdl",
    description = [[The Psychopath's Job is to cause havoc and unrest within the city leaving people scared for their lives.]],
    weapons = {"csgo_m9"},
    command = "psychopath",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 470,
})
TEAM_JOKER = DarkRP.createJob("The Joker", {
   color = _Color(255, 0, 0),
   model = "models/kemot44/models/joker_pm.mdl",
   description = [[You are the Joker, your arch-nemesis is Batman!]],
   weapons = {},
   command = "joker",
   max = 1,
   salary = 0,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   PlayerDeath = function(ply, weapon, killer)
        if ply == killer then return end
        if tostring(team.GetName(killer:Team())) ~= "Batman" then return end
        local payoutPerc = (math.random(5, 15) / 100)
        local playerWallet = ply:getDarkRPVar("money")
        local payout = math.Round(playerWallet * payoutPerc)
        if payout >= playerWallet then killer:ChatPrint("[The-Joker]: You were unable to secure the bag.") return end
        ply:addMoney(-payout)
        killer:addMoney(payout * .90)
        payout = DarkRP.formatMoney(math.Round(payout * .90))
        ply:ChatPrint("[The-Joker]: Looks like you couldn't handle your shit. You lost " .. payout .. " to the Joker.")
        killer:ChatPrint("[The-Joker]: You did good kid, you got " .. payout .. " from that smuck.")
    end,
    category = "Criminals",
    sortOrder = 475,
})
TEAM_CAPTAIN = DarkRP.createJob("Modern Captain Jack Sparrow", {
    color = _Color(255, 0, 0),
    model = "models/models/sot_jack_sparrow/sot_jack_sparrow.mdl",
    description = [[You are a pirate! Must speak in a pirates voice, Err matey!]],
    weapons = {"m9k_ruger"},
    command = "jacksparrow",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    sortOrder = 480,
})
TEAM_MONEYPRINTER = DarkRP.createJob("Money Printer Professional", {
    color = _Color(255, 0, 0),
    model = "models/player/Group01/Female_01.mdl",
    description = [[You create money out of thin air, becareful this may be illegal.]],
    weapons = {},
    command = "moneyprinter",
    max = 4,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Criminals",
    sortOrder = 200,
})
-----------------------------------------------------------
-- Pet Jobs
-----------------------------------------------------------
TEAM_PETCHICKEN = DarkRP.createJob("Chicken", {
    color = _Color(133,84,57),
    model = "models/player/chicken.mdl",
    description = [[You are a Chicken! Nothing special here :/]],
    weapons = {},
    command = "chicken",
    max = 0,
    salary = 10,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_PETPENGUIN = DarkRP.createJob("Penguin", {
    color = _Color(133,84,57),
    model = "models/tsbb/animals/king_penguin.mdl",
    description = [[You are a Penguin! Nothing special here :/]],
    weapons = {},
    command = "penguin",
    max = 0,
    salary = 10,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})

TEAM_ELMO = DarkRP.createJob("Elmo", {
    color = _Color(133,84,57),
    model = "models/elmo_hostile.mdl",
    description = [[Elmo, you are allowed to use sounds boards. (Must be Elmo sounds)]],
    weapons = {"weapon_elmo"},
    command = "elmo",
    max = 0,
    salary = 15,
    admin = 0,
    modelScale = 0.75,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_KERMIT = DarkRP.createJob("Kermit The Frog", {
    color = _Color(133,84,57),
    model = "models/player/kermit.mdl",
    description = [[You are kermit, you are allowed to use sounds boards. (Must be Kermit sounds)]],
    weapons = {"weapon_kermitswep"},
    command = "kermit",
    max = 0,
    salary = 20,
    admin = 0,
    modelScale = 0.50,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_PETCAT = DarkRP.createJob("Pet Cat", {
    color = _Color(133,84,57),
    model = "models/yevocore/cat/cat.mdl",
    description = [[Cat, you are allowed to use sound boards. (Must be Cat sounds)]],
    weapons = {},
    command = "cat",
    max = 0,
    salary = 25,
    admin = 0,
    vote = false,
    hasLicense = true,
    modelScale = 0.5,
    category = "Pets",
    sortOrder = 500,
})
TEAM_DOG = DarkRP.createJob("Pet Dog", {
    color = _Color(133,84,57),
    model = "models/falloutdog/falloutdog.mdl",
    description = [[Dog, you are allowed to use sound boards. (Must be Dog sounds)]],
    weapons = {"weapon_dogswep"},
    command = "dog",
    max = 0,
    salary = 25,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_MOUSE = DarkRP.createJob("Pet Mouse", {
    color = _Color(133,84,57),
    model = "models/player/jaray.mdl",
    description = [[Mouse, you are allowed to use sounds boards. (Must be Mouse sounds)]],
    weapons = {},
    command = "mouse",
    max = 0,
    salary = 35,
    admin = 0,
    vote = false,
    hasLicense = true,
    modelScale = .5,
    category = "Pets",
    sortOrder = 500,
})
TEAM_RACCOON = DarkRP.createJob("Pet Raccoon", {
    color = _Color(133,84,57),
    model = "models/zambie/rocket/rocket_raccoon.mdl",
    description = [[Raccoon, you are allowed to use sounds boards. (Must be Raccoon sounds)]],
    weapons = {},
    command = "raccoon",
    max = 0,
    salary = 40,
    admin = 0,
    vote = false,
    hasLicense = true,
    modelScale = 0.5,
    category = "Pets",
    sortOrder = 500,
})
TEAM_PETTIGER = DarkRP.createJob("Pet Tiger", {
    color = _Color(133,84,57),
    model = "models/kaesar/hobbs/hobbs.mdl",
    description = [[You are a Pet Tiger, you are allowed to use sounds boards. (Must be Tiger sounds)]],
    weapons = {},
    command = "tiger",
    max = 0,
    salary = 45,
    admin = 0,
    modelScale = 0.75,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_KNUCKLES = DarkRP.createJob("Pet Ugandan-Knuckles", {
    color = _Color(133,84,57),
    model = "models/knuck/model/knuckles.mdl",
    description = [[You are a Ugandan-Knuckles, you are allowed to use sounds boards. (You can use Ugandan Knuckle sound snippets.)]],
    weapons = {"weapon_knuckles"},
    command = "ugandanknuckles",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_PETSHARK = DarkRP.createJob("Pet Shark", {
    color = _Color(133,84,57),
    model = "models/player/left_shark.mdl",
    description = [[You are a Pet Shark and you rule the waters.]],
    weapons = {"csgo_bayonet","csgo_bowie","csgo_butterfly","csgo_falchion","csgo_flip","csgo_gut","csgo_huntsman","csgo_karambit","csgo_m9","csgo_daggers"},
    command = "shark",
    max = 0,
    salary = 75,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})
TEAM_BABYSHARK = DarkRP.createJob("Pet Baby-Shark", {
    color = _Color(133,84,57),
    model = "models/player/left_shark.mdl",
    description = [[You are a Pet Baby-shark and you rule the waters.]],
    weapons = {"csgo_bayonet","csgo_bowie","csgo_butterfly","csgo_falchion","csgo_flip","csgo_gut","csgo_huntsman","csgo_karambit","csgo_m9","csgo_daggers"},
    command = "babyshark",
    max = 0,
    salary = 70,
    admin = 0,
    modelScale = 0.50,
    vote = false,
    hasLicense = true,
    category = "Pets",
    sortOrder = 500,
})

-----------------------------------------------------------
-- Staff Jobs
-----------------------------------------------------------
TEAM_STAFFONDUTY = DarkRP.createJob("Staff On Dooty", {
    color = _Color(255, 255, 255, 255),
    model = "models/player/superheroes/superman.mdl",
    description = [[Hehe Dooty]],
    weapons = {"unarrest_stick","stunstick","weapon_r_handcuffs","weapon_r_restrains","weapon_keypadchecker"},
    command = "staffonduty",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,

    category = "Staff",
    PlayerSpawn = function(ply)
        ply:GodEnable()
        ply:SetMoveType(MOVETYPE_NOCLIP)
    end,
    PlayerChangedTeam = function(ply, oldTeam, newTeam)
        ply:SetMoveType(MOVETYPE_WALK)
        ply:GodDisable()
    end,
    customCheck = function(ply) return
    _table_HasValue(_is_group_staff,ply:sam_getrank()) end,
    CustomCheckFailMsg = "This job is for Staff Only!",
})
-------------------------------------------------------------------------------
GAMEMODE.DefaultTeam = TEAM_CITIZEN -- Default Job
--[[---------------------------------------------------------------------------
Civil Protections/Government Jobs
-------------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_MAYOR] = true,
    [TEAM_POLICECHIEF] = true,
    [TEAM_POLICEOFFICER] = true,
    [TEAM_SWATCOMMANDER] = true,
    [TEAM_SWATMEDIC] = true,
    [TEAM_SWATSOLDIER] = true,
    [TEAM_JUGGERNAUT] = true,
}
--[[---------------------------------------------------------------------------
Hitman Jobs (Not Used)
-------------------------------------------------------------------------------]]
--DarkRP.addHitmanTeam(TEAM_MOB)