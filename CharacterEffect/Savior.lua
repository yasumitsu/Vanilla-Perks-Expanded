UndefineClass('Savior')
DefineClass.Savior = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcHealAmount",
			Handler = function (self, target, patient, medic, medkit, data)
				if target == medic then
					data.heal_percent = data.heal_percent + self:ResolveValue("bandageBonus")
				end
			end,
		}),
	},
	DisplayName = T(348476001921, --[[ModItemCharacterEffectCompositeDef Savior DisplayName]] "Savior"),
	Description = T(145826221315, --[[ModItemCharacterEffectCompositeDef Savior Description]] "Restore <color EmStyle><number>%</color> more <color EmStyle>HP</color> when using <color EmStyle>Bandage</color>."),
	Icon = "UI/Icons/Perks/Savior",
	Tier = "Bronze",
	Stat = "Medical",
	StatValue = 70,
}

