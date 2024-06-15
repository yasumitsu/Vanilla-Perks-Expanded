UndefineClass('Gunslinger')
DefineClass.Gunslinger = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				if IsKindOfClasses(weapon, "Pistol", "Revolver") then
					local maxRange = weapon.WeaponRange
						maxRange = maxRange + self:ResolveValue("RangeIncrease")
					return maxRange
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attacker  and (IsKindOfClasses(weapon1, "Pistol", "Revolver") or IsKindOfClasses(weapon2, "Pistol", "Revolver")) then
					local level = target:GetLevel()
					local value =  self:ResolveValue("gunslingerCthBonus") + level
					ApplyCthModifier_Add(self, data, value)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcAPCost",
			Handler = function (self, target, current_ap, action, weapon, aim)
				if IsKindOfClasses(weapon, "Pistol", "Revolver") then
					local reduction = self:ResolveValue("ap_cost_reduction") * const.Scale.AP
					local minCost = self:ResolveValue("min_ap_cost") * const.Scale.AP
				
					return Max(minCost, current_ap - reduction)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker and IsKindOfClasses(weapon, "Pistol", "Revolver") then
					local level = target:GetLevel()
					local bonus = self:ResolveValue("damage_bonus") + level
					data.base_damage = MulDivRound(data.base_damage, 100 + bonus, 100)
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				local doubleTap = target:GetLastAttack() == attack_target
					and target == attacker
					and (IsKindOfClasses(weapon1, "Pistol") or IsKindOfClasses(weapon2, "Pistol"))
				
				if doubleTap then
					target:AddStatusEffect("DoubleTapPistol")
					else
					target:RemoveStatusEffect("DoubleTapPistol")
				end
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(983375857101, --[[ModItemCharacterEffectCompositeDef Gunslinger DisplayName]] "Gunslinger"),
	Description = T(280088538306, --[[ModItemCharacterEffectCompositeDef Gunslinger Description]] "Attacks with <color EmStyle>Pistols</color> and <color EmStyle>Revolvers</color> have reduced <color EmStyle>AP</color> cost, increased <em>chance to hit</em>, <em>damage</em> and extended <em>Range</em>."),
	Icon = "Mod/PerksExpanded/Images/Fanning4.dds",
	Tier = "Silver",
	Stat = "Marksmanship",
	StatValue = 80,
}

