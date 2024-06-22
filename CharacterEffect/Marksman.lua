UndefineClass('Marksman')
DefineClass.Marksman = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Handler = function ()
				-- a little bit of CTH with long range weapons
				-- maybe a little bit of damage
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker then
					local level = target:GetLevel()
					local bonus = level * self:ResolveValue("bonusDmgPerLvl")
					data.base_damage = data.base_damage + MulDivRound(data.base_damage, bonus, 100)
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attacker  then
					local level = target:GetLevel()
					local value =  self:ResolveValue("bonusCthPerLvl") * level
					ApplyCthModifier_Add(self, data, value)
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(561149855915, --[[ModItemCharacterEffectCompositeDef Marksman DisplayName]] "Marksman"),
	Description = T(480072152315, --[[ModItemCharacterEffectCompositeDef Marksman Description]] "This merc has Marksmanship training."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/rifle 2",
	Shown = true,
}

