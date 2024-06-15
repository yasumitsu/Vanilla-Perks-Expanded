UndefineClass('AllRounder')
DefineClass.AllRounder = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Handler = function ()
				-- +10 CTH Melee Weapons
				-- +10 CTH Ranged Weapons (Overwatch only)
				-- +20 Max Hit Points
			end,
		}),
		PlaceObj('UnitReaction', {
			Handler = function ()
				target.MaxHitPoints = target.MaxHitPoints + 1
				RecalcMaxHitPoints(target)
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				
				if target == attack_target then
					local value = target:GetLevel() * self:ResolveValue("dmgResistancePerLvl")
					if value > 0 then
						local dmgRes = MulDivRound(data.base_damage, value, 100)
				    	data.base_damage = data.base_damage - dmgRes
						data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attacker  and action.ActionType == "Melee Attack"  then
					local level = target:GetLevel()
					local value =  self:ResolveValue("meleeBonusPerLevel") * level
					ApplyCthModifier_Add(self, data, value)
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(895146284132, --[[ModItemCharacterEffectCompositeDef AllRounder DisplayName]] "All Rounder"),
	Description = T(132268296032, --[[ModItemCharacterEffectCompositeDef AllRounder Description]] "This merc is an excellent all-rounder"),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/bulletproof-vest.dds",
	Shown = true,
}

