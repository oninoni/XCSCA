function EFFECT:Init(data)
	local e = data:GetEntity()
	if(not IsValid(e))then return end
	
	self.EntityData = {}
	
	self.EntityData["Class"] = e:GetClass()
	self.EntityData["Model"] = e:GetModel()
	
	//self.EntityData["ID"] = e:GetID()
	
	
	if(e:GetOwner() != NULL)then
		self.EntityData["Owner"] = e:GetOwner()
	end
	
	//self.EntityData["Weight"] = e:GetWeight()
	
	if(e:Health() != 0)then
		self.EntityData["Health"] = e:Health()
	end
	
	PrintTable(self.EntityData)
	
	self.Timeout = CurTime() + 0.5
	
end

function EFFECT:Think()
	//Removes the Effect when Timeout
	
	if(CurTime() == self.Timeout)then
		return false
	end
	
	//Removes the Effect when Target gets Deleted
	
	if(self.Entity:GetParent() == NULL)then
		return false
	end
	
	return true
end

function EFFECT:Render()
	
end
