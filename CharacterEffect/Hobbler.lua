UndefineClass('Hobbler')
DefineClass.Hobbler = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	__copy_group = "Wisdom",
	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				data.ignore_body_part_damage.Arms = true
				data.ignore_body_part_damage.Legs = true
			end,
		}),
	},
	DisplayName = T(204672425596, --[[ModItemCharacterEffectCompositeDef Hobbler DisplayName]] "Arterial Shot"),
	Description = T(394688085779, --[[ModItemCharacterEffectCompositeDef Hobbler Description]] "No <color EmStyle>Damage Penalty</color> for <color EmStyle>Arms</color> and <color EmStyle>Legs</color> shots."),
	Icon = "UI/Icons/Perks/Hobbler",
	Tier = "Bronze",
	Stat = "Medical",
	StatValue = 70,
}

