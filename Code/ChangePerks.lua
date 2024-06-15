local mercs = {
	"Igor", "MD", "Grizzly", "Wolf", "Raven", "Thor", "Ice", "Blood", "Grunty", "Ivan", "Raider", "Tex", "DrQ", "Red", "Hitman", "Magic", "Scully", "Reaper", "Sidney", "Scope", "Len", "Larry"
}


function OnMsg.UnitCreated(unit)

if CurrentModOptions["JA2Perks"] == true then
	
	if not unit:IsMerc() then
		return
	end
	 
	
		if unit.unitdatadef_id == "Igor" then
			unit:AddStatusEffect("AutoWeapons")
		end
	
		if unit.unitdatadef_id == "Grunty" then
			unit:AddStatusEffect("NightOps")
		end
	
		if unit.unitdatadef_id == "Hitman" then
			unit:AddStatusEffect("Throwing")
		end
	
		if unit.unitdatadef_id == "Ice" then
			unit:AddStatusEffect("Teacher")
		end
	
		if unit.unitdatadef_id == "Ivan" then
			unit:AddStatusEffect("HeavyWeaponsTraining")
		end
	
		if unit.unitdatadef_id == "Len" then
			unit:AddStatusEffect("AutoWeapons")
		end
	
		if unit.unitdatadef_id == "MD" then
			unit:AddStatusEffect("MartialArts")
		end
	
		if unit.unitdatadef_id == "Grizzly" then
			unit:AddStatusEffect("MeleeTraining")
		end
	
		if unit.unitdatadef_id == "Raven" then
			unit:AddStatusEffect("NightOps")
		end
	
		if unit.unitdatadef_id == "Red" then
			unit:AddStatusEffect("Teaching")
		end
	
		if unit.unitdatadef_id == "Scope" then
			unit:AddStatusEffect("Teaching")
		end
	
		if unit.unitdatadef_id == "Scully" then
			unit:AddStatusEffect("Throwing")
		end
	
		if unit.unitdatadef_id == "Sidney" then
			unit:AddStatusEffect("Ambidextrous")
			unit.Nationality = "NewZealand"
		end
	
		if unit.unitdatadef_id == "Thor" then
			unit:AddStatusEffect("MeleeTraining")
		end
	
		if unit.unitdatadef_id == "Wolf" then
			unit:AddStatusEffect("NightOps")
		end
	
	end

end


