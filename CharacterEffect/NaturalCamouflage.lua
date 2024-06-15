UndefineClass('NaturalCamouflage')
DefineClass.NaturalCamouflage = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcSightModifier",
			Handler = function (self, target, value, observer, other, step_pos, darkness)
				if target == other then
					return value + self:ResolveValue("sight_mod")
				end
			end,
		}),
	},
	DisplayName = T(255554280355, --[[ModItemCharacterEffectCompositeDef NaturalCamouflage DisplayName]] "Natural Camouflage"),
	Description = T(160860597113, --[[ModItemCharacterEffectCompositeDef NaturalCamouflage Description]] "This character is <number>% harder to see."),
	Icon = "Mod/PerksExpanded/Images/Chameleon.dds",
	Tier = "Silver",
	Stat = "Medical",
	StatValue = 80,
}

