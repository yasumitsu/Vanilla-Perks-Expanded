UndefineClass('DoubleTap')
DefineClass.DoubleTap = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcAPCost",
			Handler = function (self, target, current_ap, action, weapon, aim)
				if IsKindOfClasses(weapon, "AssaultRifle", "SubmachineGun") and aim < 2 and action.id == "SingleShot" then
					local costReduction = self:ResolveValue("DoubleTapReduction") * const.Scale.AP
					local minCost = self:ResolveValue("minApCost")
					return Max(minCost, current_ap - costReduction)
				end
				
				-- find a way to proc only once per attack_target
				--- 	return Max(minCost, current_ap - reduction)
			end,
		}),
	},
	DisplayName = T(220124805651, --[[ModItemCharacterEffectCompositeDef DoubleTap DisplayName]] "Double Tap"),
	Description = T(309005053725, --[[ModItemCharacterEffectCompositeDef DoubleTap Description]] "Reduce AP on same target"),
}

