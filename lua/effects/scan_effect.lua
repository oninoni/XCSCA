function EFFECT:Init(data)
	print("Blubb")
	
	local e = data:GetEntity()
	print(e)
	if(not IsValid(e))then return end
	self.Entity:SetModel(e:GetModel())
	self.Entity:SetPos(e:GetPos())
	self.Entity:SetAngles(e:GetAngles())
	self.Entity:SetMaterial("models/wireframe")
end

function EFFECT:Think()
	return true
end

function EFFECT:Render()



	self.Entity:DrawModel()
end
