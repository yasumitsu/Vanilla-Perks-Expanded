UndefineClass('LeadFromTheFront')
DefineClass.LeadFromTheFront = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitAttack",
			Handler = function (self, target, attacker, action, attack_target, results, attack_args)
				if attacker == target and IsKindOf(attack_target, "Unit") and results.total_damage and results.total_damage >= self:ResolveValue("damageTreshold") then
					if attacker.team:IsPlayerControlled() and not self:ResolveValue("applied") then
						attacker.team:ChangeMorale(self:ResolveValue("moraleBonus"), self.DisplayName)
						self:SetParameter("applied", true)
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				self:SetParameter("applied", false)
			end,
		}),
	},
	DisplayName = T(197770144315, --[[ModItemCharacterEffectCompositeDef LeadFromTheFront DisplayName]] "Inspiring Strike"),
	Description = T(374581675021, --[[ModItemCharacterEffectCompositeDef LeadFromTheFront Description]] "Increase <color EmStyle>Morale</color> when you deal more than <color EmStyle><damageTreshold> Damage</color> with a <color EmStyle>single attack</color>.\n\nOnce per turn."),
	Icon = "UI/Icons/Perks/SquadLeadership",
	Tier = "Silver",
	Stat = "Leadership",
	StatValue = 80,
}

