function EFFECT:Init(data)
	local e = data:GetEntity()
	if(not IsValid(e))then return end
	
	self.Entity:SetModel(e:GetModel())
	self.Entity:SetPos(e:GetPos())
	self.Entity:SetAngles(e:GetAngles())
	//self.Entity:SetSize(e:Size())
	self.Entity:SetMaterial("models/wireframe")
	
	//dself.Entity:SetColor(Color(math.random() *255,math.random() *255,math.random() *255,255))	//Rainbow Scan
	
	self.Entity:SetParent(e)
	
	self.min, self.max = e:GetModelBounds()
	
	self.originOffset = (math.abs(self.max.z) - math.abs(self.min.z)) / 2
	
	self.height = self.max.z - self.min.z
	self.heightExcact = self.height
	
	self.offset = self.height / 20
	
	self.heightWithSpacers = self.height + self.offset * 2
	
	self.scanPosition = 0
end

function EFFECT:Think()
	self.scanPosition = self.scanPosition + self.heightWithSpacers/300
	if(self.scanPosition > self.heightWithSpacers) then return false end
	
	//Removes the Effect when Target gets Deleted
	
	if(self.Entity:GetParent() == NULL)then
		return false
	end
	
	return true
end

function EFFECT:Render()
	local normal = self.Entity:GetUp()
	local position = normal:Dot(self.Entity:GetPos() + Vector(0, 0, self.originOffset))
	cam.Start3D(EyePos() + normal*0.01,EyeAngles())
		render.EnableClipping(true)
		render.PushCustomClipPlane( normal, position - self.heightWithSpacers/2 + (self.scanPosition - self.offset))
		render.PushCustomClipPlane(-normal,-position + self.heightWithSpacers/2 - (self.scanPosition + self.offset))
		self.Entity:DrawModel();
		render.PopCustomClipPlane()
		render.PopCustomClipPlane()
		render.EnableClipping(false)
	cam.End3D()
end
