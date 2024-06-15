UndefineClass('ExplosiveExpert')
DefineClass.ExplosiveExpert = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Handler = function ()
				-- bonus damage with explosives?
			end,
		}),
		PlaceObj('UnitReaction', {
			Handler = function ()
				if target == attacker and IsKindOfClasses(weapon, "Grenade") and action.ActionType == "Ranged Attack" then
					attack_target:AddStatusEffect("")
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(522258068160, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert DisplayName]] "Explosive Expert"),
	Description = T(565028712664, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert Description]] "This merc has Explosives training."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/fragmentation.dds",
	Shown = true,
}

