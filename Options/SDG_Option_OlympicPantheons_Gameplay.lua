if not ExposedMembers.DB_OP then ExposedMembers.DB_OP = {} end
local DB_OP = ExposedMembers.DB_OP

function OP_PantheonUpkeep(ActivePlayerID) 
	if (ActivePlayerID == -1 or ActivePlayerID > 61 or DB_OP.NeedToRemoveAmenities == nil) then return nil end
	for _, City in Players[ActivePlayerID]:GetCities():Members() do
		-- if we have the Dionysus pantheon, we need to create the Peace and Love "building"
		local Pantheon = GameInfo.Beliefs[City:GetReligion():GetActivePantheon()]
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_DIONYSUS' then
			if not City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index) then
				WorldBuilder.CityManager():CreateBuilding(City, GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, 100)
			end
		-- elseif we have the "building" but no longer Dionysus, we should remove it from the city
		elseif City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index) then
			WorldBuilder.CityManager():RemoveBuilding(City, GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index)
		end

		-- if we have Dionysus, we'll have the building at this point, check for war weariness... if we have it, Peace and Love gets pillaged
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_DIONYSUS' then
			if DB_OP.NeedToRemoveAmenities(ActivePlayerID, City:GetID()) then
				City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, true)
			else
				City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, false)
			end
		end

		-- if we have Alpheus, free water mill
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_ALPHEUS' then
			if not City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_WATER_MILL"].Index) then
				WorldBuilder.CityManager():CreateBuilding(City, GameInfo.Buildings["BUILDING_WATER_MILL"].Index, 100)
			end
			City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_WATER_MILL"].Index, false)
		end
	end
end


function OP_Init()
	GameEvents.PlayerTurnStartComplete.Add(OP_PantheonUpkeep)
end

OP_Init()