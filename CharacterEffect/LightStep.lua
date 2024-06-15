UndefineClass('LightStep')
DefineClass.LightStep = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnEndTurn",
			Handler = function (self, target)
				if target:GetLevel() >5 and not target:HasStatusEffect("Hidden") then
					target:RemoveStatusEffect("Spotted")
					target:AddStatusEffect("Hidden")
					Msg("UnitStealthChanged", target)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnUnitKill",
			Handler = function (self, target, killedUnits)
				if target:GetLevel() >3 and not target:HasStatusEffect("Hidden") then
					target:RemoveStatusEffect("Spotted")
					target:AddStatusEffect("Hidden")
					Msg("UnitStealthChanged", target)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnDamageTaken",
			Handler = function (self, target, attacker, dmg, hit_descr)
				if target:GetLevel() >7 and not target:HasStatusEffect("Hidden") and target == attacker then
					target:RemoveStatusEffect("Spotted")
					target:AddStatusEffect("Hidden")
					Msg("UnitStealthChanged", target)
				end
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(308830527336, --[[ModItemCharacterEffectCompositeDef LightStep DisplayName]] "Light-footed"),
	Description = T(749518715050, --[[ModItemCharacterEffectCompositeDef LightStep Description]] "<color EmStyle>Ignore</color> enemy <color EmStyle>Overwatch</color> areas when moving. Hide after killing an unit at level 4, Hide at the end of its turn at level 6, Hide after taking damage at level 8."),
	Icon = "UI/Icons/Perks/LightStep",
	Tier = "Personal",
}

