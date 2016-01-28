function EFFECT:Init(data)
	local e = data:GetEntity()
	if(not IsValid(e))then return end
	self.Entity:SetModel(e:GetModel())
	self.Entity:SetPos(e:GetPos())
	self.Entity:SetAngles(e:GetAngles())
	self.Entity:SetMaterial("models/wireframe")
	
	self.Entity:SetParent(e)
end

local scanPosition = 0

function EFFECT:Think()
	scanPosition++
	return true
end

function EFFECT:Render()
	self.Entity:SetRenderClipPlaneEnabled( true )
	self.Entity:SetRenderClipPlane( self.Entity:GetUp(), self.Entity:GetPos() + Vector(0,0,scanPosition))
	self.Entity:DrawModel();
end
