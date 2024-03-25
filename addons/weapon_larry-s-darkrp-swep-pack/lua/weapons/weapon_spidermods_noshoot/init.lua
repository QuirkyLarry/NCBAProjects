local l_ACSLF = AddCSLuaFile
local l_ie = include
local l_CCV = CreateConVar
l_ACSLF( "cl_init.lua" )
l_ACSLF( "shared.lua" )
l_ie("shared.lua")
l_CCV("rope_distance", 10000, false)