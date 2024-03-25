-----------------------------------------------------------
local _Color = Color
local _ipairs = ipairs
local _pizza_chef_categories = {TEAM_CHEF}
local _gun_dealer_categories = {TEAM_GUNDEALER, TEAM_BLACKMARKETDEALER}
-----------------------------------------------------------
-- Categories
-----------------------------------------------------------
categories = {
    -- Job Categories
    [1] = {name = "Citizens", cat = "jobs", color = _Color(0, 255, 0), canSee = true},
    [2] = {name = "Business Owners", cat = "jobs", color = _Color(0, 200, 255), canSee = true},
    [3] = {name = "Government", cat = "jobs", color = _Color(0,19,85), canSee = true},
    [4] = {name = "Criminals", cat = "jobs", color = _Color(255, 0, 0), canSee = true},
    [5] = {name = "Pets", cat = "jobs", color = _Color(133,84,57), canSee = true},
    [6] = {name = "Staff",  cat = "jobs", color = _Color(255, 255, 255), canSee = true},
    -- Entity Categories
    [7] = {name = "Bitminer Equipment", cat = "entities", color = _Color(255,255,255), canSee = true},
    [8] = {name = "Money Clickers", cat = "entities", color = _Color(255,255,255), canSee = true},
    [9] = {name = "Food", cat = "entities", color = _Color(255,255,255), canSee = "table.HasValue({_pizza_chef_categories}, ply:Team())"},
    [10] = {name = "Others", cat = "entities", color = _Color(255,255,255), canSee = true},
    -- Ammo Categories
    [11] = {name = "Ammo", cat = "ammo", color = _Color(255, 255, 255), canSee = true},
    -- Weapon Categories
    [12] = {name = "Raiding Tools", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [13] = {name = "Pistols", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [14] = {name = "Shotguns", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [15] = {name = "Sub-Machine Guns", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [16] = {name = "Rifles", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [17] = {name = "Light-Machine Guns", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [18] = {name = "Sniper Rifles", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
    [19] = {name = "Specialties", cat = "shipments", color = _Color(255,0,0), canSee = "table.HasValue(_gun_dealer_categories, ply:Team())"},
}

for i, v in _ipairs(categories) do
    DarkRP.createCategory{
        name = v.name,
        categorises = v.cat,
        startExpanded = true,
        color = v.color,
        canSee = function(ply) return v.canSee end,
        sortOrder = i
    }
end