function EFFECT:Init(data)
	local e = data:GetEntity()
	if(not IsValid(e))then return end
	
	self.EntityClass = e:GetClass()
	self.EntityOwner = e:GetOwner()
	
end

function EFFECT:Think()
	//Removes the Effect when Target gets Deleted
	
	if(self.Entity:GetParent() == NULL)then
		return false
	end
	
	return true
end

function EFFECT:Render()
	cam.Start3D(EyePos() + normal*0.01,EyeAngles())
		
	cam.End3D()
end
