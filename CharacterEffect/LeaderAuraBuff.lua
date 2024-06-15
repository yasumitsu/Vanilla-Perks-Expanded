UndefineClass('LeaderAuraBuff')
DefineClass.LeaderAuraBuff = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcPersonalMorale",
			Handler = function (self, target, value)
				local value = value + CharacterEffectDefs.Leader:ResolveValue("moraleBuff")
				return value
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(417755850224, --[[ModItemCharacterEffectCompositeDef LeaderAuraBuff DisplayName]] "Inspiring Leadership"),
	Description = T(646479217785, --[[ModItemCharacterEffectCompositeDef LeaderAuraBuff Description]] "Thanks to the presence of the Leader this unit is inspired to fight better."),
	type = "Buff",
	lifetime = "Until End of Turn",
	Icon = "Mod/PerksExpanded/Images/buff (1).dds",
	RemoveOnEndCombat = true,
	Shown = true,
	HasFloatingText = true,
}

