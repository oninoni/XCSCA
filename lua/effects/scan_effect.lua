function EFFECT:Init(data)
	local e = data:GetEntity()
	if(not IsValid(e))then return end
	self.Entity:SetModel(e:GetModel())
	self.Entity:SetPos(e:GetPos())
	self.Entity:SetAngles(e:GetAngles())
	self.Entity:SetMaterial("models/wireframe")
	
	self.Entity:SetParent(e)
	
	self.min, self.max = e:GetModelBounds()
	self.height = self.max.z - self.min.z
	
	
	self.offset = self.height / 20
	
	self.height = self.height + self.offset * 2
	
	self.scanPosition = 0
	renderClip = true
end

function EFFECT:Think()
	self.scanPosition = self.scanPosition + self.height/500
	if(self.scanPosition > self.height) then self.scanPosition = 0 end
	
	//Removes the Effect when Target gets Deleted
	
	if(self.Entity:GetParent() == NULL)then
		print("Entity deleted")
		return false
	end
	
	return true
end

function EFFECT:Render()
	local normal = self.Entity:GetParent():GetUp()
	local position = normal:Dot(self.Entity:GetParent():GetPos())
	cam.Start3D(EyePos() + normal*0.01,EyeAngles())
		render.EnableClipping(true)
		render.PushCustomClipPlane( normal, position - self.height/2 + (self.scanPosition - self.offset))
		render.PushCustomClipPlane(-normal,-position + self.height/2 - (self.scanPosition + self.offset))
		self.Entity:DrawModel();
		render.PopCustomClipPlane()
		render.PopCustomClipPlane()
		render.EnableClipping(false)
	cam.End3D()
	//self.Entity:SetRenderClipPlaneEnabled( true )
	//self.Entity:SetRenderClipPlane( normal, position - height/2 + scanPosition - height/10)
	//self.Entity:SetRenderClipPlane( normal, position - height/2 + scanPosition - height/10)
	
end
