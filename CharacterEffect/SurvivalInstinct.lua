UndefineClass('SurvivalInstinct')
DefineClass.SurvivalInstinct = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnDamageTaken",
			Handler = function (self, target, attacker, dmg, hit_descr)
				if target ~= attacker then 
					--local maxHp = target:GetInitialMaxHitPoints()
					local minHp = MulDivRound(target:GetInitialMaxHitPoints(), self:ResolveValue("minHp"), 100)
					if target.HitPoints <= minHp then
						target:AddStatusEffect("Heroic")
					end
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(646555090368, --[[ModItemCharacterEffectCompositeDef SurvivalInstinct DisplayName]] "Survival Instinct"),
	Description = T(453388948844, --[[ModItemCharacterEffectCompositeDef SurvivalInstinct Description]] "Gains <color EmStyle>Heroic</color> when <color EmStyle>HP</color> drops too low."),
	Icon = "Mod/PerksExpanded/Images/strength",
	Tier = "Quirk",
}

