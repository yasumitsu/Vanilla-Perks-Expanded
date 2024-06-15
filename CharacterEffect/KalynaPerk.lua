UndefineClass('KalynaPerk')
DefineClass.KalynaPerk = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker and data.action_id == self.class then
					data.ignore_armor = true
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				local level = target:GetLevel()
				
				if level >2 then
				if IsKindOfClasses(weapon, "SniperRifle") then
					local maxRange = weapon.WeaponRange
					local bonus = self:ResolveValue("RangeIncrease") + target:GetLevel()
					maxRange = MulDivRound(maxRange, 100 + bonus, 100) 
					return maxRange
				end
				end
			end,
		}),
	},
	DisplayName = T(450630168120, --[[ModItemCharacterEffectCompositeDef KalynaPerk DisplayName]] "Inevitable Strike"),
	Description = T(210912564757, --[[ModItemCharacterEffectCompositeDef KalynaPerk Description]] "<color EmStyle>Ranged attack</color> that bypasses damage reduction from <color EmStyle>Armor</color>.\n\nCan't be used with Shotguns.\n\nExtended <em>Range</em> of all Rifles at level 4."),
	Icon = "UI/Icons/Perks/KalynaPerk",
	Tier = "Personal",
}

