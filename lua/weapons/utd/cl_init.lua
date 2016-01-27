include('shared.lua')
SWEP.PrintName = "Universal Tricorder Device"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

function SWEP:Setup(ply)
	/**if ply.GetViewModel and ply:GetViewModel():IsValid() then
		local attachmentIndex = ply:GetViewModel():LookupAttachment("muzzle")
		if attachmentIndex == 0 then attachmentIndex = ply:GetViewModel():LookupAttachment("1") end
		if LocalPlayer():GetAttachment(attachmentIndex) then
			self.VM = ply:GetViewModel()
			self.Attach = attachmentIndex
		end
	end
	if ply:IsValid() then
		local attachmentIndex = ply:LookupAttachment("anim_attachment_RH")
		if ply:GetAttachment(attachmentIndex) then
			self.WM = ply
			self.WAttach = attachmentIndex
		end
	end*/
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
	//self.Weapon:DrawModel()
end
