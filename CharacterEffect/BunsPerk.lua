UndefineClass('BunsPerk')
DefineClass.BunsPerk = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attacker and IsKindOf(data.target, "Unit") and IsValidTarget(data.target) then
					for _, unit in ipairs(data.target.hit_this_turn) do
						if unit ~= attacker and band(unit.team.ally_mask, attacker.team.team_mask) ~= 0 then
							ApplyCthModifier_Add(self, data, self:ResolveValue("CtHBonus"), T{776394275735, "Perk: <name>", name = self.DisplayName})
							return
						end
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				local level = target:GetLevel()
				
				if level > 5 then
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
	DisplayName = T(135821907017, --[[ModItemCharacterEffectCompositeDef BunsPerk DisplayName]] "Anything You Can Do..."),
	Description = T(420486100169, --[[ModItemCharacterEffectCompositeDef BunsPerk Description]] "Gains <color EmStyle>Accuracy</color> bonus against targets hit by an <color EmStyle>ally</color> this turn.\nExtended <em>Range</em> of all Rifles at level 6."),
	Icon = "UI/Icons/Perks/BunsPerk",
	Tier = "Personal",
}

