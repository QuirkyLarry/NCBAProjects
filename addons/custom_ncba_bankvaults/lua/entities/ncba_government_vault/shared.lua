ENT.Base = "base_gmodentity";
ENT.Type = "anim";

ENT.PrintName		= "Bank Vault";
ENT.Category 		= "BR";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

-- The cool down before bank robberies
NCBA_Criminal_CriminalCooldown = 1800
-- Time it takes to rob the bank.
NCBA_Criminal_PayoutCooldown = 180
-- Teams that can rob the bank.
NCBA_Criminal_CriminalJobs = {["Mob Boss"] = true, ["Gangster"] = true, ["Pro Thief"] = true, ["Thief"] = true, ["Hobo Leader"] = true, }
-- Teams that can't rob the bank.
NCBA_Criminal_NoRob = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }
NCBA_Government_Jobs = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }