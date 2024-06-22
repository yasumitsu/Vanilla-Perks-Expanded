UndefineClass('LastWarning')
DefineClass.LastWarning = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitAttack",
			Handler = function (self, target, attacker, action, attack_target, results, attack_args)
				local chance = self:ResolveValue("panic_chance")
				if target == attacker and attacker.team.morale > 0 and attacker:Random(100) < chance then
					for _, hit in ipairs(results) do
						local unit = IsKindOf(hit.obj, "Unit") and not hit.obj:IsIncapacitated() and hit.obj
						local damage = hit.damage or 0
						if unit and unit:IsOnEnemySide(attacker) and (hit.aoe or not hit.stray) and (damage > 0) then
							unit:AddStatusEffect("Panicked")
							unit.ActionPoints = unit:GetMaxActionPoints()
						end
					end
				end
			end,
		}),
	},
	DisplayName = T(971319502741, --[[ModItemCharacterEffectCompositeDef LastWarning DisplayName]] "Dire Warning"),
	Description = T(462224672304, --[[ModItemCharacterEffectCompositeDef LastWarning Description]] "When <color EmStyle>Morale</color> is <color EmStyle>High</color> or <color EmStyle>Very High</color>, gain <color EmStyle><number>% chance</color> to cause <color EmStyle>Panic</color> with each <color EmStyle>attack</color> that deals damage. "),
	Icon = "UI/Icons/Perks/LastWarning",
	Tier = "Silver",
	Stat = "Leadership",
	StatValue = 80,
}

