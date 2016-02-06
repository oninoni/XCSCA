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
	if(!TargetEntity:IsWorld())then
		local fx = EffectData()
		fx:SetEntity(TargetEntity)
		util.Effect("scan_effect", fx, true, true)
		util.Effect("scanData_effect", fx, true, true)
	end
	self:SetNextPrimaryFire( CurTime() + 0.5)
end

function SWEP:SecondaryAttack()
	
end

function SWEP:Think()
	if(Self)then
	
	end
end