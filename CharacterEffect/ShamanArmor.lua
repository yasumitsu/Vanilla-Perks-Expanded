UndefineClass('ShamanArmor')
DefineClass.ShamanArmor = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attack_target then  
				    local dmgRes = MulDivRound(data.base_damage, (self:ResolveValue("dmgResistance") * self.stacks), 100)
				    data.base_damage = data.base_damage - dmgRes
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(288474843483, --[[ModItemCharacterEffectCompositeDef ShamanArmor DisplayName]] "Shaman Armor"),
	Description = T(107681507046, --[[ModItemCharacterEffectCompositeDef ShamanArmor Description]] "Immune to Blinded, Choking, Panicked."),
	OnAdded = function (self, obj)
		obj:AddStatusEffectImmunity("Blinded", self.class)
		obj:AddStatusEffectImmunity("Choking", self.class)
		obj:AddStatusEffectImmunity("Panicked", self.class)
	end,
	OnRemoved = function (self, obj)
		obj:RemoveStatusEffectImmunity("Blinded", self.class)
		obj:RemoveStatusEffectImmunity("Choking", self.class)
		obj:RemoveStatusEffectImmunity("Panicked", self.class)
	end,
	Icon = "Mod/PerksExpanded/Images/shield",
	max_stacks = 3,
	Shown = true,
}

