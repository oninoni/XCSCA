include('shared.lua')
SWEP.PrintName = "Universal Tricorder Device"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

function SWEP:Setup(ply)
	
end

function SWEP:Initialize()
	self:Setup(self:GetOwner())
end

function SWEP:Deploy(ply)
	self:Setup(self:GetOwner())
end

function SWEP:ViewModelDrawn()
	
end

function SWEP:DrawWorldModel()
	self.Weapon:DrawModel()
end
