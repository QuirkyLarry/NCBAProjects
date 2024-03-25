--resource.AddWorkshop( '448184984' ) --Note, particle effects on workshop are semi-broken. One here is fixed.
--[[
resource.AddFile("materials/swb/bullet.vmt")
resource.AddFile("materials/swb/clumpspread_ring.vmt")
resource.AddFile("materials/swb/scope_rifle.vmt")
resource.AddFile("materials/swb_muzzle/flash.vmt")
resource.AddFile("materials/swb_muzzle/flash_rif.vmt")
resource.AddFile("materials/swb_muzzle/flash_spark.vmt")
resource.AddFile("particles/swb_muzzle.pcf")
resource.AddWorkshop( '1573478786' ) -- Fixed an issue with particle system
--]]

local _table_GetKeys = table.GetKeys
local _table_insert = table.insert
local _table_sort = table.sort
local _pairs = pairs
local _hook_Add = hook.Add
local _ipairs = ipairs
local _type = type
local _table_SortByMember = table.SortByMember

local npcWepList = list.GetForEdit("NPCUsableWeapons")

_hook_Add("PlayerSpawnNPC", "NPCOptions_SWB_Starwars_Republic", function(plyv, npcclassv, wepclassv)
    if _type(wepclassv) ~= "string" or wepclassv == "" then return end

    if not npcWepList[wepclassv] then -- do not copy the table
        local wep = weapons.GetStored(wepclassv)

        if wep and (wep.Spawnable and not wep.AdminOnly) and not wep.Akimbo and weapons.IsBasedOn(wep.ClassName, "swb_base") then
            npcWepList[wepclassv] = {
                ["class"] = wep.ClassName,
                ["title"] = wep.PrintName or wep.ClassName
            }
        end
    end
end)