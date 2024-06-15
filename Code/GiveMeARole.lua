----'Group', "Adonis",
----'Group', "Army",
----'Group', "NPC",
----'Group', "Legion",
----'Group', "Legion - Unique",
----'Group', "Rebels",
----'Group', "SiegfriedSuperSoldiers",
----'Group', "Thugs",
--

local function GiveMeARole(unit)

	local unitProperties = UnitPropertiesStats:GetProperties()
	local statTable = {}
	for p, i in ipairs(unitProperties) do
	if i.category == "Stats" then
		statTable[#statTable + 1] = { id = i.id, value = unit[i.id] }
	end
	end

	local stat_specialization_map = {Marksmanship = "Marksman", Leadership="Leader", Medical = "Doctor", Explosives="ExplosiveExpert", Mechanical="Mechanic"}
	local max_stat
	local specialization = "AllRounder"

	for _, stat_data in ipairs(statTable) do
	--unitData:SetBase(stat_data.stat,stat_data.value)
	local spec = stat_specialization_map[stat_data.id]
	if spec and (not max_stat and stat_data.value>80  or max_stat and stat_data.value> max_stat) then
		max_stat = stat_data.value
		specialization = spec
	end
	end

	unit:AddStatusEffect(specialization)

	return specialization

end


local function GetUnitStats(unit)
	--if not merc then return end
	local unitProperties = UnitPropertiesStats:GetProperties()
	local stats = {}
	for p, i in ipairs(unitProperties) do
		if i.category == "Stats" then
			--print(p, "p")
			--print(i, "i")
			--print(stats, "stats")
			stats[#stats + 1] = { id = i.id, value = unit[i.id] }
			--print(stats[1], stats[2], "using [0] ") -- this works starting on 1
			--print(stats[1].id, stats[1].value, "using . ")
		end
	end
	return stats
end

local function conditionsOk(unit)
	if CurrentModOptions["EnemyRoles"] == true and
	unit.species == "Human"	and
	unit.Affiliation ~= "Other" and
	unit.Affiliation ~= "Civilian" and
	not (HasPerk(unit, "Marksman") or HasPerk(unit, "Leader") or HasPerk(unit, "Doctor") or HasPerk(unit, "ExplosiveExpert") or HasPerk(unit, "Mechanic") or HasPerk(unit, "AllRounder") )
	then return true end
end


function OnMsg.UnitCreated(unit)
	if conditionsOk(unit) then
		GiveMeARole(unit)
	end
end