AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

SWEP.Weight = 8
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

function SWEP:Initialize()
	
end

function SWEP:Equip( newOwner )
	
end

function SWEP:PrimaryAttack()
	Target = self.Owner:GetEyeTraceNoCursor()
	TargetEntity = Target["Entity"]
	if(TargetEntity:IsWorld())then
		print("World!")
	else
		TargetEntity:SetMaterial("models/wireframe", true)
	end
end

function SWEP:SecondaryAttack()
	Target = self.Owner:GetEyeTraceNoCursor()
	TargetEntity = Target["Entity"]
	if(TargetEntity:IsWorld())then
		print("World!")
	else
		TargetEntity:SetMaterial(TargetEntity:getMaterial(), true)
	end
end

function SWEP:Think()
	if(Self)
end
