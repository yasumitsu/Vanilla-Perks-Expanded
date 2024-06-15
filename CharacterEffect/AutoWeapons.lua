UndefineClass('AutoWeapons')
DefineClass.AutoWeapons = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				if id == "Autofire" and target == attacker and (IsKindOfClasses(weapon1, "AssaultRifle", "SubmachineGun") or IsKindOfClasses(weapon2, "AssaultRifle", "SubmachineGun")) then
					data.mod_mul = AutoWeapons:ResolveValue("automatics_penalty_reduction")
					data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
				end
				
				-- double tap technique
				
				local doubleTap = target:GetLastAttack() == attack_target 
					and target == attacker
					and (IsKindOfClasses(weapon1, "AssaultRifle", "SubmachineGun") or IsKindOfClasses(weapon2, "SubmachineGun"))
				
				if doubleTap then
					target:AddStatusEffect("DoubleTap")
					else
					target:RemoveStatusEffect("DoubleTap")
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				if IsKindOfClasses(weapon, "AssaultRifle") then
					local maxRange = weapon.WeaponRange
					local level = target:GetLevel()
				
						maxRange = MulDivRound(maxRange, 100 + level, 100)
					return maxRange
				end
				
				if IsKindOfClasses(weapon, "SubmachineGun") then
					local maxRange = weapon.WeaponRange
					maxRange = maxRange + self:ResolveValue("rangeBonusSMG")
					return maxRange
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitAttackResolved",
			Handler = function (self, target, attacker, attack_target, action, attack_args, results, can_retaliate, combat_starting)
				-- run and gun technique
				if target == attacker and IsKindOfClasses(results.weapon, "SubmachineGun") and action.id == "BurstFire" and attack_args.aim == 0 then
					if g_Combat then
						attacker:AddStatusEffect("FreeMove")
					elseif g_StartingCombat or combat_starting then
						attacker:AddStatusEffect("FreeMoveOnCombatStart")
					end
				end
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(433549306527, --[[ModItemCharacterEffectCompositeDef AutoWeapons DisplayName]] "Auto Weapons"),
	Description = T(860512099026, --[[ModItemCharacterEffectCompositeDef AutoWeapons Description]] 'Reduced <color EmStyle>Accuracy</color> penalty when using <color EmStyle>Burst Fire</color> or <color EmStyle>Full Auto</color>.\nIncreased <color EmStyle>Range</color> for <color EmStyle>Assault Rifles</color> and <color EmStyle>SMGs</color>. Unlocks "Barrage" for SMGs.'),
	Icon = "UI/Icons/Perks/AutoWeapons",
	Tier = "Silver",
	Stat = "Marksmanship",
	StatValue = 80,
}

