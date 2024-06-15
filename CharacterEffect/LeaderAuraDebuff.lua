UndefineClass('LeaderAuraDebuff')
DefineClass.LeaderAuraDebuff = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcPersonalMorale",
			Handler = function (self, target, value)
				local value = value + CharacterEffectDefs.Leader:ResolveValue("moraleDebuff")
				return value
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(685849089549, --[[ModItemCharacterEffectCompositeDef LeaderAuraDebuff DisplayName]] "Leader Aura"),
	Description = T(771127781683, --[[ModItemCharacterEffectCompositeDef LeaderAuraDebuff Description]] "Leader Aura"),
	OnAdded = function (self, obj)  end,
	type = "Debuff",
	lifetime = "Until End of Turn",
	Icon = "Mod/PerksExpanded/Images/weakness.dds",
	RemoveOnEndCombat = true,
	Shown = true,
	HasFloatingText = true,
}

