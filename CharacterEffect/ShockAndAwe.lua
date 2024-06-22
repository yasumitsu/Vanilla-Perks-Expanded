UndefineClass('ShockAndAwe')
DefineClass.ShockAndAwe = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitEnterSector",
			Handler = function (self, target, game_start, load_game)
				if not load_game then
					target.team.morale = Max(1, target.team.morale)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if attacker == target and attacker.team.morale > 0 then
					local damageBonus = self:ResolveValue("highMoraledmgBuff") 
					data.base_damage = MulDivRound(data.base_damage, 100 + damageBonus, 100)
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = damageBonus }
				end
			end,
		}),
	},
	DisplayName = T(917406413669, --[[ModItemCharacterEffectCompositeDef ShockAndAwe DisplayName]] "Shock and Awe"),
	Description = T(689010001606, --[[ModItemCharacterEffectCompositeDef ShockAndAwe Description]] "<color EmStyle>High</color> <color EmStyle>Morale</color> when starting combat.\n\nDeal <color EmStyle><number>%</color> extra <color EmStyle>Damage</color> when <color EmStyle>Morale</color> is <color EmStyle>High</color> or <color EmStyle>Very High</color>."),
	Icon = "UI/Icons/Perks/ShockAndAwe",
	Tier = "Gold",
	Stat = "Leadership",
	StatValue = 90,
}

