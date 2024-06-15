UndefineClass('JackOfAllTrades')
DefineClass.JackOfAllTrades = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attack_target then  
				    local dmgRes = MulDivRound(data.base_damage, (self:ResolveValue("dmgResistance") * target:GetLevel()), 100)
				    data.base_damage = data.base_damage - dmgRes
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
				end
			end,
		}),
	},
	DisplayName = T(512665067655, --[[ModItemCharacterEffectCompositeDef JackOfAllTrades DisplayName]] "Jack Of All Trades"),
	Description = T(429912088598, --[[ModItemCharacterEffectCompositeDef JackOfAllTrades Description]] "All <color EmStyle>Operations</color> that Wolf undertakes are completed approximately <color EmStyle><activityDurationMod>% faster</color>. Wolf is also very versatile and gets 2% damage resistance every level."),
	Icon = "UI/Icons/Perks/JackOfAllTrades",
	Tier = "Personal",
}

