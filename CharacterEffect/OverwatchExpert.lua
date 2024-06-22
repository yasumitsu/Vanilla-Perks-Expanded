UndefineClass('OverwatchExpert')
DefineClass.OverwatchExpert = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcOverwatchAttacks",
			Handler = function (self, target, value, action, args)
				return value + self:ResolveValue("bonusAttacks")
			end,
		}),
	},
	DisplayName = T(532324679530, --[[ModItemCharacterEffectCompositeDef OverwatchExpert DisplayName]] "Sentinel"),
	Description = T(953678683787, --[[ModItemCharacterEffectCompositeDef OverwatchExpert Description]] "Gain an <color EmStyle>extra attack</color> when using <color EmStyle>Overwatch</color>."),
	Icon = "Mod/PerksExpanded/Images/vigilance2",
	Tier = "Bronze",
	Stat = "Marksmanship",
	StatValue = 70,
}

