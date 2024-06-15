UndefineClass('HeavyWeaponsTraining')
DefineClass.HeavyWeaponsTraining = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcAPCost",
			Handler = function (self, target, current_ap, action, weapon, aim)
				if IsKindOfClasses(weapon, "HeavyWeapon", "MachineGun") then
					local reduction = self:ResolveValue("ap_cost_reduction") * const.Scale.AP
					local minCost = self:ResolveValue("min_ap_cost") * const.Scale.AP
					return Max(minCost, current_ap - reduction)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				target:AddStatusEffect("FreeMove")
				if not HasPerk(target, "Ironclad") then
					target:ConsumeAP(DivRound(target.free_move_ap, 2), "Move")
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				if id == "Autofire" and target == attacker and (IsKindOfClasses(weapon1, "MachineGun") or IsKindOfClasses(weapon2, "MachineGun")) then
					data.mod_mul = HeavyWeaponsTraining:ResolveValue("heavyWeapons_penalty_reduction")
					data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
				end
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(385640383798, --[[ModItemCharacterEffectCompositeDef HeavyWeaponsTraining DisplayName]] "Heavy Weapons"),
	Description = T(134513669893, --[[ModItemCharacterEffectCompositeDef HeavyWeaponsTraining Description]] "Attacks and <color EmStyle>Setup</color> with <color EmStyle>Heavy Weapons</color> and <color EmStyle>Machine Guns</color> have reduced <color EmStyle>AP</color> cost.\n\nImproves the effect of the <em>Ironclad</em> perk to full <GameTerm('FreeMove')> with cumbersome gear."),
	Icon = "UI/Icons/Perks/HeavyWeaponsTraining",
	Tier = "Bronze",
	Stat = "Explosives",
	StatValue = 70,
}

