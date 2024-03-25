resource.AddWorkshop("1527403485")
local workShopContent = {
    "1527403485", -- RP Downtown Tits V2
    "2215998262", -- M9k Remastered: Plus
    "2205783122", -- M9k Remastered: Throwables
    "2169649722", -- M9k Remastered
    "111412589", -- Star Wars Lightsabers
    "673698301", -- Vape SWEP
    "506283460", -- CS:GO Knives SWEPs
    "1229178079", -- Larry's DarkRP Swep Pack
    "150455514", -- Hoverboards
    "862383919", -- Mewtwo's Karambit Pack #2
    "860877285", -- Mewtwo's CS:GO Karambit Pack
    "1573451927", -- CS:GO Knives SWEPs Compressed
    "1690762222", -- FX Gaming - Custom Knives #1
    "2072136134", -- Bitminers Content
    "3001394726", -- Prop Counter - Feature Rich
    "1300407557", -- Executioner [Content Only]
    "685912753", -- Money Clickers Content
    "2136421687", -- Brick's Server Framework
    "2078529432", -- VoidLib
    "2391722065", -- ItemStore: Workshop Content
    "2072136134", -- CH Bitminers - Content
    "760288402", -- GTA 5 Money props
    -- Zeros Content
    "1741741175", -- Zero´s Grow OP - Contentpack
    "1272277353", -- Zeros FruitSlicer - Contentpack
    "1393715099", -- Zeros OilRush - Contentpack
    "1228585060", -- Zero´s MethLab - Contentpack
    "1332778012", -- Zeros PizzaMaker - Contentpack
    "1626509911", -- Zero´s Yeastbeast - Contentpack
    "1795813904", -- Zero´s Trashman - Contentpack
    "1311178246", -- Zeros RetroMiner - Contentpack
    "2734306160", -- Zeros Vendingmachines - Contentpack 3.0.0
    -- Server Player Models
    "722374307", -- Donald Trump Playermodel
    "1182053993", -- Miner Playermodels
    "775344741", -- Snoop Dogg
    "2579682437", -- DarkRP: Mayor [PM + Ragdoll]
    "2099916698", -- Homeless Hobo Playermodel [Fixed]
    "1153529187", -- King Penguin
    "104538509", -- Skeleton Playermodel
    "906534410", -- Deadpool Playermodel & NPC
    "1286986406", -- Hitman Absolution Agent 47 Classic Playermodel & NPC
    "182758912", -- Thief Player Model
    "446122159", -- Chicken Player Model
    "549723093", -- The Flash, The Reverse Flash, and Zoom - Playermodels and NPCs
    "113834524", -- Fully Functional Vaas Montenegro Player Model and Ragdoll
    "2048488045", -- DC Superhero Playermodels
    "1154384700", -- Spiderman Playermodel
    "159269477", -- Corvo playermodel
    "1899345304", -- Joker (Joaquin Phoenix) [ PM / NPC / Ragdoll ]
    "315394811", -- Demon Violinist Playermodel
    "1512211167", -- Hobbes the Tiger - ( PM / Ragdoll )
    "141049673", -- Batman Playermodel
    "2430887482", -- MW3 Juggernauts Playermodels
    "2501351698", -- Grand Theft Auto: Online Playermodel Pack -- Thief Playermodels
    "952118754", -- Cat Playermodel & Ragdoll
    "654384195", -- Rocket Raccoon Player Model
    "528587737", -- Elmo
    "485879458", -- Kermit The Frog Player Model & NPC
    "1275255548", -- Knuckles playermodel/prop
    "1320927875", -- Left Shark Fixed Playermodel
    "2801750344", -- Chilean Skeleton Playermodel (Esqueleto Loquendo)
    "2691974423", -- Jerma985 Playermodel
    "332506201", -- Walter White Player Model Fix
    "2792578010", -- Breaking Bad - Jesse Pinkman (PM/RAGDOLL)
    "2810132455", -- Captain Jack Sparrow SoT [PM]
    "2800621336", -- Playermodel - Jesus (TWD)
    "1489734036", -- ADIDAS GIRL GOPNIK [ML] pm
    "330044046", -- MS13 Gang Members Playermodels
    "949554190", -- Groove Street Gang PlayerModels
    "1573306444", -- Acoustic Guitar Swep
    "548792844", -- Bully Playermodel Jimmy
    "374399521", -- TF2 Spy Player Model
    "906345372", -- Batman Arkham Knight: Commissioner Gordon Playermodel
    "812610473", -- Police Officers (Playermodels)
    "786297028", -- Jaray The Rat V2
    "1418525979", -- Fallout 4 - Dogmeat [Player Model]
    "1983122259", -- VoidCases | Content
    "2925952159", -- CH Mayor - Content
    "273090192", -- GMod Roleplay Pee Swep
    "854872051", -- Stungun Content
    "158061274", -- Angry Hobo SWEP
    "2172708113", -- Brick's Gangs - Content
    "2136144023", -- GlorifiedLeveling Resources
    "2948601382", -- Purge - Content
    "726566288", -- Fine System Content
    "761228248", -- Realistic Handcuffs Content
    "804809965", -- Realistic Kidnap System Content
    "1900873878", -- TBFY Shared Content
    "651345750", -- Fixed chairs
    "2790694511", -- ahudcontent
    "881305303", -- SH Accessories Content
    "1956177393", -- Xenin F4 - Content Package
    "2532060111", -- Zeros Lua Libary
    "2486834214", -- Zero´s Methlab 2 - Contentpack
    "1853618226", -- AWarn3 Server Content
    "111412589", -- Star Wars Lightsabers
    "1573478786", -- SWB Resources
    "2061278828" -- Retro Boombox - Contents
}

local resource_AddWorkshop = resource.AddWorkshop
for i, v in ipairs(workShopContent) do
    resource_AddWorkshop(v)
end
--[[
hook.Add("PlayerInitialSpawn","NCBAWorkshopDownloadOnSpawn", function( ply, command)
    if not IsValid(ply) then return end
    for i, v in ipairs(workShopContent) do
        ply:SendLua("steamworks.DownloadUGC(" .. v .. ", function(path,file) game.MountGMA( path ) end)")
    end
end)--]]

hook.Add("PlayerSay","NCBAWorkshopDownload", function( ply, command)
    if not IsValid(ply) then return end
    if command ~= "!workshop" then return end
    for i, v in ipairs(workShopContent) do
        ply:SendLua("steamworks.DownloadUGC( " .. v .. ", function(path,file) game.MountGMA( path ) end)")
    end
end)