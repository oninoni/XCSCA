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
	scanPosition = scanPosition + 1 
	return true
end

function EFFECT:Render()
	local normal = self.Entity:GetUp()
	local position = normal:Dot( self.Entity:GetPos() + Vector(0,0,scanPosition))
	self.Entity:SetRenderClipPlaneEnabled( true )
	self.Entity:SetRenderClipPlane( normal, position)
	self.Entity:DrawModel();
end
