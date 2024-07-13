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
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				if target == attacker and target.team ~= attack_target.team then
					if IsKindOf(weapon, "ExplosiveProperties") then
						target:AddStatusEffect("Bleeding")
					elseif IsKindOf(weapon, "GrenadeGas") then
						target:AddStatusEffect("Slow")
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
	DisplayName = T(522258068160, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert DisplayName]] "Explosive Expert"),
	Description = T(565028712664, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert Description]] "This merc has Explosives training."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/fragmentation",
	Shown = true,
}

