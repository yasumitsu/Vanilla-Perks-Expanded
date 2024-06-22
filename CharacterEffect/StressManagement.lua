UndefineClass('StressManagement')
DefineClass.StressManagement = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnStatusEffectAdded",
			Handler = function (self, target, id, stacks)
				if CharacterEffectDefs[id].type == "Debuff" and not self:ResolveValue("activated") then
					target:AddStatusEffect("Inspired")
					self:SetParameter("activated", true)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCombatEnd",
			Handler = function (self, target)
				self:SetParameter("activated", false)
			end,
		}),
	},
	DisplayName = T(395949760272, --[[ModItemCharacterEffectCompositeDef StressManagement DisplayName]] "Stress Management"),
	Description = T(657106779830, --[[ModItemCharacterEffectCompositeDef StressManagement Description]] "Become <color EmStyle>Inspired</color> after suffering a <color EmStyle>negative effect</color> for the <color EmStyle>first time</color> in combat."),
	Icon = "UI/Icons/Perks/StressManagement",
	Tier = "Silver",
	Stat = "Leadership",
	StatValue = 80,
}

