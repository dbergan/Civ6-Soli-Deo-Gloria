function ERU_DrownReligiousUnitsWithoutBoat (turn)
	local LocalPlayerID = Game.GetLocalPlayer()
	local Units = Players[LocalPlayerID]:GetUnits()

	for _, Unit in Units:Members() do
		-- local UnitType = GameInfo.Units[Unit:GetType()].UnitType

		-- embarked religious units turn invisible when not next to a boat, hence why we're checking for Invisible
		local Invisible = Unit:HasHiddenVisibility()
		local Embarked = Unit:IsEmbarked()
		local SpreadCharges = Unit:GetReligion():GetSpreadCharges()
		local HealCharges = Unit:GetReligion():GetReligiousHealCharges()

		
		if Invisible == true and Embarked == true and (SpreadCharges > 1 or HealCharges > 1) then
			UnitManager.Kill(Unit)
		end
	end
end

Events.TurnEnd.Add( ERU_DrownReligiousUnitsWithoutBoat ) ;
