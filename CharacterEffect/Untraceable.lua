UndefineClass('Untraceable')
DefineClass.Untraceable = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker and attack_args.stealth_attack then
					local bonus = self:ResolveValue("stealth_damage") 
					data.base_damage = MulDivRound(data.base_damage, 100 + bonus, 100)
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
	},
	DisplayName = T(644754158224, --[[ModItemCharacterEffectCompositeDef Untraceable DisplayName]] "Untraceable"),
	Description = T(550468915018, --[[ModItemCharacterEffectCompositeDef Untraceable Description]] "<color EmStyle>Slower</color> enemy <color EmStyle>detection</color> while <color EmStyle>Sneaking</color>.\n\nFailed <color EmStyle>Stealth Kills</color> deal <color EmStyle><number>%</color> more <color EmStyle>Damage</color>.\n"),
	Icon = "UI/Icons/Perks/Untraceable",
	Tier = "Bronze",
	Stat = "Agility",
	StatValue = 70,
}

