UndefineClass('SteadyBreathing')
DefineClass.SteadyBreathing = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcFreeMove",
			Handler = function (self, target, data)
				local armourItems = target:GetEquipedArmour()
				local medium = false
				local heavy = false
				
				for _, item in ipairs(armourItems) do
						if item.PenetrationClass == 3 then
						medium = true
					end
					if item.PenetrationClass > 4 then
						heavy = true
					end
				end
				if medium then
					data.add = data.add + self:ResolveValue("freeMoveBonusApMedium")
				elseif heavy then
					data.add = data.add + self:ResolveValue("freeMoveBonusApHeavy")
				else
					data.add = data.add + self:ResolveValue("freeMoveBonusAp")
				end
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(641253187551, --[[ModItemCharacterEffectCompositeDef SteadyBreathing DisplayName]] "Fast Runner"),
	Description = T(824962629346, --[[ModItemCharacterEffectCompositeDef SteadyBreathing Description]] "Increased <color EmStyle>Free Move</color> <color EmStyle>Range</color> when not wearing <color EmStyle>Heavy Armor</color>."),
	Icon = "UI/Icons/Perks/SteadyBreathing",
	Tier = "Bronze",
	Stat = "Strength",
	StatValue = 70,
}

