UndefineClass('HawksEye')
DefineClass.HawksEye = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnMercHired",
			Handler = function (self, target, price, days, alreadyHired)
				if days > 0 then
					local canPlaceError = CanPlaceItemInInventory("Cookie", days, target)
					if canPlaceError then
						CombatLog("important", T(667077082306, "Scope has baked some biscuits. Unfortunately the inventory is full. "))
						return
					end
					CombatLog("important",T(754424382903, "Scope has baked some biscuits"))
					PlaceItemInInventory("Cookie", days, target)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitGetWeaponRange",
			Handler = function (self, target, value, weapon, action)
				if IsKindOfClasses(weapon, "SniperRifle") then
					local maxRange = weapon.WeaponRange
					local bonus = self:ResolveValue("RangeIncrease") + target:GetLevel()
					bonus = MulDivRound(maxRange, bonus, 100) 
					return maxRange + bonus
				end
			end,
		}),
	},
	DisplayName = T(527312196263, --[[ModItemCharacterEffectCompositeDef HawksEye DisplayName]] "Eagle Eye"),
	Description = T(831074715476, --[[ModItemCharacterEffectCompositeDef HawksEye Description]] "<color EmStyle>Pin Down</color> applies <color EmStyle>Exposed</color> to the target.\n\n<color EmStyle>Pin Down</color> minimum <color EmStyle>AP</color> cost is reduced to <color EmStyle><pindownCostOverwrite> AP</color>.\n\nScope also makes <color EmStyle>Biscuits</color>.\n\nExtended <em>Range</em> of all Rifles."),
	Icon = "UI/Icons/Perks/HawksEye",
	Tier = "Personal",
}

