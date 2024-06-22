UndefineClass('Sharpshooter')
DefineClass.Sharpshooter = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				if id == "Aim" 
					and target == attacker
					and (IsKindOfClasses(weapon1, "SniperRifle")
					or IsKindOfClasses(weapon2, "SniperRifle")) then
				
					local bonus = self:ResolveValue("bonusAimScoped")
					data.mod_mul = data.mod_mul + bonus
					data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
					
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcAPCost",
			Handler = function (self, target, current_ap, action, weapon, aim)
				if target.stance == "Standing" or not IsKindOfClasses(weapon, "SniperRifle") then
					return
					elseif target.stance == "Prone" and weapon:IsCumbersome()  then
						local reduction = self:ResolveValue("proneApReduction") * const.Scale.AP
						local minCost = self:ResolveValue("minApCost") * const.Scale.AP
						return Max(minCost, current_ap - reduction)
					else
						local reduction = self:ResolveValue("crouchApreduction") * const.Scale.AP
						local minCost = self:ResolveValue("minApCost") * const.Scale.AP
						return Max(minCost, current_ap - reduction)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				if IsKindOfClasses(weapon, "SniperRifle") then
					local maxRange = weapon.WeaponRange
					local bonus = self:ResolveValue("lightRifleIncrease")
					if IsKindOfClasses(weapon, "SniperRifle") and weapon:IsCumbersome() then
						bonus = self:ResolveValue("heavyRifleIncrease")
					end
					maxRange = MulDivRound(maxRange, 100 + bonus, 100)
				--	print(maxRange)
					return maxRange
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcMaxAimActions",
			Handler = function (self, target, value, attacker, attack_target, action, weapon)
				if target == attacker then
					return weapon.MaxAimActions + self:ResolveValue("additionalAimScoped")
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	Modifiers = {},
	DisplayName = T(723903517349, --[[ModItemCharacterEffectCompositeDef Sharpshooter DisplayName]] "Sharpshooter"),
	Description = T(272582799925, --[[ModItemCharacterEffectCompositeDef Sharpshooter Description]] "Increased <color EmStyle>Range and Accuracy</color> for <color EmStyle>Sniper Rifles</color> and <color EmStyle>Rifles</color>."),
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/Mini3",
	Tier = "Gold",
	Stat = "Marksmanship",
	StatValue = 90,
}

