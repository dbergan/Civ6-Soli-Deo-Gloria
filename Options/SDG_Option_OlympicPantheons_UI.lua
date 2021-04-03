if not ExposedMembers.DB_OP then ExposedMembers.DB_OP = {} end
local DB_OP = ExposedMembers.DB_OP


function NeedToRemoveAmenities(PlayerID, CityID)
	local City = CityManager.GetCity(PlayerID, CityID)

	local Growth = City:GetGrowth()
	if Growth:GetAmenitiesLostFromWarWeariness() == nil or Growth:GetAmenitiesLostFromWarWeariness() < 1 then 
		return false
	end

	return true
end


function OP_Init_UI()
	DB_OP.NeedToRemoveAmenities = NeedToRemoveAmenities
end

OP_Init_UI()