UndefineClass('Berserker')
DefineClass.Berserker = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attack_target then
					local wounded = target:GetStatusEffect("Wounded")
					if wounded and wounded.stacks > 0 then
						local stackCap = self:ResolveValue("stackCap")
						local reductionPerStack = self:ResolveValue("damageReductionBonus")
						local stacks = Min(wounded.stacks, stackCap)
						local enduranceMod = reductionPerStack*stacks
						
						data.base_damage = MulDivRound(data.base_damage, 100 - enduranceMod, 100)
						data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = enduranceMod }
					end
				
					if target.team.player_enemy and g_Combat and not table.find(g_Combat.berserkVRsPerRole, target.role) then
						PlayVoiceResponse(target, "AIBerserkerPerk")
						table.insert(g_Combat.berserkVRsPerRole, target.role)
					end
				end
			end,
		}),
	},
	DisplayName = T(205199205251, --[[ModItemCharacterEffectCompositeDef Berserker DisplayName]] "Endurance"),
	Description = T(472688632606, --[[ModItemCharacterEffectCompositeDef Berserker Description]] "Reduce <color EmStyle><damageReductionBonus>% Damage</color> per <color EmStyle>Wound</color>.\n\nCapped at <stackCap> stacks.<color EmStyle>"),
	Icon = "UI/Icons/Perks/PainManagement",
	Tier = "Silver",
	Stat = "Health",
	StatValue = 80,
}

