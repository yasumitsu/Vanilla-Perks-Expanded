UndefineClass('Endurance')
DefineClass.Endurance = {
	__parents = { "CharacterEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "CharacterEffect",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attack_target and target:GetStatusEffect("Wounded") then
					
					local reduction = target:GetStatusEffect("Wounded")
					if reduction.stacks > 0 then
					 local dmgRed = MulDivRound(data.base_damage, (self:ResolveValue("reductionPerStack") * reduction.stacks), 100)
				    data.base_damage = data.base_damage - dmgRed
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRed }
					end
				end
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(183918184771, --[[ModItemCharacterEffectCompositeDef Endurance DisplayName]] "Endurance"),
	Description = T(395886257805, --[[ModItemCharacterEffectCompositeDef Endurance Description]] "Takes less damage if wounded."),
	OnAdded = function (self, obj)  end,
	OnRemoved = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/helmet 2.dds",
	Shown = true,
	HasFloatingText = true,
}

