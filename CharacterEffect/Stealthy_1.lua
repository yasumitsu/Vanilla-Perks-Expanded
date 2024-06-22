UndefineClass('Stealthy_1')
DefineClass.Stealthy_1 = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcStealthKillChance",
			Handler = function (self, target, value, attacker, attack_target, weapon, target_spot_group, aim)
				if target == attacker then
					return value + self:ResolveValue("stealthkill")
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcStealthKillMinChance",
			Handler = function (self, target, value, attacker, attack_target, weapon, target_spot_group, aim)
				if target == attacker then
					return Max(value, self:ResolveValue("stealthkill_minchance"))
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcSightModifier",
			Handler = function (self, target, value, observer, other, step_pos, darkness)
				if target == other and target:HasStatusEffect("Hidden") then
					return value - self:ResolveValue("stealthy_detection")
				end
			end,
		}),
	},
	DisplayName = T(497322606689, --[[ModItemCharacterEffectCompositeDef Stealthy_1 DisplayName]] "Stealthy"),
	Description = T(374712713287, --[[ModItemCharacterEffectCompositeDef Stealthy_1 Description]] "Harder to spot by enemies while <color EmStyle>Sneaking</color>.\n\nSlightly increased chance for <color EmStyle>Stealth Kills</color>."),
	Icon = "UI/Icons/Perks/Stealthy",
	Tier = "Specialization",
}

