UndefineClass('BreachAndClear')
DefineClass.BreachAndClear = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	__copy_group = "Strength",
	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitAttackResolved",
			Handler = function (self, target, attacker, attack_target, action, attack_args, results, can_retaliate, combat_starting)
				if target == attacker and IsKindOfClasses(results.weapon, "Grenade", "Shotgun") then
					if g_Combat then
						attacker:AddStatusEffect("FreeMove")
					elseif g_StartingCombat or combat_starting then
						attacker:AddStatusEffect("FreeMoveOnCombatStart")
					end
				end
			end,
		}),
	},
	DisplayName = T(291330097752, --[[ModItemCharacterEffectCompositeDef BreachAndClear DisplayName]] "Breach and Clear"),
	Description = T(303013437858, --[[ModItemCharacterEffectCompositeDef BreachAndClear Description]] "Gain <color EmStyle>Free Move</color> after throwing <color EmStyle>Grenades</color> or making <color EmStyle>Shotgun</color> attacks."),
	Icon = "UI/Icons/Perks/BreachAndClear",
	Tier = "Bronze",
	Stat = "Explosives",
	StatValue = 70,
}

