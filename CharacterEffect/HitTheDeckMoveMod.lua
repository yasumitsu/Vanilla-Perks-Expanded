UndefineClass('HitTheDeckMoveMod')
DefineClass.HitTheDeckMoveMod = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcMoveModifier",
			Handler = function (self, target, value, action)
				if action.id == "Move" and  target.stance == "Prone" then
					-- only need to return value when modifying it
					return value - self:ResolveValue("prone_ap_modifier")
				end
				
				if action.id == "Move" and  target.stance == "Crouch" then
					-- only need to return value when modifying it
					return value - self:ResolveValue("crouch_ap_modifier")
				end
			end,
		}),
	},
	Conditions = {},
	OnAdded = function (self, obj)
		Msg("UnitAPChanged", obj)
	end,
	OnRemoved = function (self, obj)
		Msg("UnitAPChanged", obj)
	end,
	lifetime = "Until End of Turn",
	RemoveOnEndCombat = true,
}

