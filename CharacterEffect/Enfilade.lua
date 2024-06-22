UndefineClass('Enfilade')
DefineClass.Enfilade = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker and not hit_descr.aoe and attack_args.opportunity_attack_type and IsKindOf(attack_target, "Unit") and attack_target:HasStatusEffect("Flanked") then
					local bonus = self:ResolveValue("damage_bonus")
					data.base_damage = MulDivRound(data.base_damage, 100 + bonus, 100)
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
	},
	DisplayName = T(327523599007, --[[ModItemCharacterEffectCompositeDef Enfilade DisplayName]] "Enfilade Fire"),
	Description = T(290887360265, --[[ModItemCharacterEffectCompositeDef Enfilade Description]] "Deal +<number>% bonus damage to Flanked enemies with Interrupt attacks."),
	Icon = "UI/Icons/Perks/Inescapable",
	Tier = "Bronze",
	Stat = "Marksmanship",
	StatValue = 70,
}

