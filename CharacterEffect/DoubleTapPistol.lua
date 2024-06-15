UndefineClass('DoubleTapPistol')
DefineClass.DoubleTapPistol = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcAPCost",
			Handler = function (self, target, current_ap, action, weapon, aim)
				if IsKindOfClasses(weapon, "Pistol") and aim < 2 and action.id == "SingleShot" then
					local costReduction = self:ResolveValue("DoubleTapReduction") * const.Scale.AP
					local minCost = self:ResolveValue("minApCost")
					return Max(minCost, current_ap - costReduction)
				end
				
				-- find a way to proc only once per attack_target
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(584190543912, --[[ModItemCharacterEffectCompositeDef DoubleTapPistol DisplayName]] "Double Tap"),
	Description = T(422046704132, --[[ModItemCharacterEffectCompositeDef DoubleTapPistol Description]] "Reduce AP on same target"),
	OnAdded = function (self, obj)  end,
}

