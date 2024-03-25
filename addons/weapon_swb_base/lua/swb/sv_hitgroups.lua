local _IsValid = IsValid
local _hook_Add = hook.Add

--Ur welcome -nicecream
--[[hook.Add("ScalePlayerDamage","SWB_HitGroups",function( ply, hitgroup, dmginfo )

	local attacker = dmginfo:GetInflictor()

	if attacker:IsPlayer() then
		SWEP = attacker:GetActiveWeapon()

		if IsValid(SWEP) && SWEP.SWBWeapon then

			if ( hitgroup == HITGROUP_HEAD ) then
				dmginfo:ScaleDamage( 0.5 )
				dmginfo:ScaleDamage( SWEP.HeadMulti )

			end

			if ( hitgroup == HITGROUP_LEFTARM ||
				hitgroup == HITGROUP_RIGHTARM ||
				hitgroup == HITGROUP_LEFTLEG ||
				hitgroup == HITGROUP_RIGHTLEG ) then
				dmginfo:ScaleDamage( 4 )
				dmginfo:ScaleDamage( SWEP.AppendageMulti )

			end
		end
	end

end)

hook.Add("ScaleNPCDamage","SWB_HitGroups",function( npc, hitgroup, dmginfo )

	local attacker = dmginfo:GetInflictor()

	if attacker:IsPlayer() then
		SWEP = attacker:GetActiveWeapon()

		if IsValid(SWEP) && SWEP.SWBWeapon then

			if ( hitgroup == HITGROUP_HEAD ) then
				dmginfo:ScaleDamage( 0.5 )
				dmginfo:ScaleDamage( SWEP.HeadMulti )

			end

			if ( hitgroup == HITGROUP_LEFTARM ||
				hitgroup == HITGROUP_RIGHTARM ||
				hitgroup == HITGROUP_LEFTLEG ||
				hitgroup == HITGROUP_RIGHTLEG ) then
				dmginfo:ScaleDamage( 4 )
				dmginfo:ScaleDamage( SWEP.AppendageMulti )

			end
		end
	end

end)]]

--Detours are always better :) -nice
_hook_Add("OnGamemodeLoaded","SWB_DetourDamage",function()
    local SWEP, attacker

    local GM_ScalePlayerDamage = GAMEMODE.ScalePlayerDamage
    function GAMEMODE:ScalePlayerDamage( ply, hitgroup, dmginfo )
        attacker = dmginfo:GetInflictor()

        if attacker:IsPlayer() then
            SWEP = attacker:GetActiveWeapon()

            if _IsValid(SWEP) && SWEP.SWBWeapon then
            
                if ( hitgroup == HITGROUP_HEAD ) then
                    dmginfo:ScaleDamage( SWEP.HeadMulti )

                end

                if ( hitgroup == HITGROUP_LEFTARM ||
                    hitgroup == HITGROUP_RIGHTARM ||
                    hitgroup == HITGROUP_LEFTLEG ||
                    hitgroup == HITGROUP_RIGHTLEG ) then
                    dmginfo:ScaleDamage( SWEP.AppendageMulti )

                end
            else
                GM_ScalePlayerDamage( self, ply, hitgroup, dmginfo )
            end
        else
            GM_ScalePlayerDamage( self, ply, hitgroup, dmginfo )
        end
        
    end

    local GM_ScaleNPCDamage = GAMEMODE.ScaleNPCDamage
    function GAMEMODE:ScaleNPCDamage( npc, hitgroup, dmginfo )
        attacker = dmginfo:GetInflictor()

        if attacker:IsPlayer() then
            SWEP = attacker:GetActiveWeapon()

            if _IsValid(SWEP) && SWEP.SWBWeapon then

                if ( hitgroup == HITGROUP_HEAD ) then
                    dmginfo:ScaleDamage( SWEP.HeadMulti )

                end

                if ( hitgroup == HITGROUP_LEFTARM ||
                    hitgroup == HITGROUP_RIGHTARM ||
                    hitgroup == HITGROUP_LEFTLEG ||
                    hitgroup == HITGROUP_RIGHTLEG ) then
                    dmginfo:ScaleDamage( SWEP.AppendageMulti )

                end
            else
                GM_ScaleNPCDamage( self, npc, hitgroup, dmginfo )
            end
        else
            GM_ScaleNPCDamage( self, npc, hitgroup, dmginfo )
        end
        
    end
end)