UndefineClass('Ambidextrous')
DefineClass.Ambidextrous = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				if target == attacker and id == "TwoWeaponFire" then
					data.mod_add = data.mod_add + self:ResolveValue("PenaltyReduction")
					data.meta_text[#data.meta_text + 1] = T{756119910645, "Perk: <perkName>", perkName = self.DisplayName}
				end
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(920488455934, --[[ModItemCharacterEffectCompositeDef Ambidextrous DisplayName]] "Ambidextrous"),
	Description = T(169645850395, --[[ModItemCharacterEffectCompositeDef Ambidextrous Description]] "Reduced <color EmStyle>Accuracy</color> penalty when <color EmStyle>Dual-Wielding</color> Firearms."),
	Icon = "UI/Icons/Perks/Ambidextrous",
	Tier = "Bronze",
	Stat = "Dexterity",
	StatValue = 70,
}

