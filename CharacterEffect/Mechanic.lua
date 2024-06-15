UndefineClass('Mechanic')
DefineClass.Mechanic = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Handler = function ()
				-- extra damage to armored targets with shotguns
				-- extra damage to armor whit shotguns
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				local heavyArmor = false
				local armourItems = attack_target:GetEquipedArmour()
				
				for _, item in ipairs(armourItems) do
						if item.PenetrationClass > 2 then
						heavyArmor = true
					end
				end
				
				if target == attacker and  heavyArmor then
					local bonus = Min(target:GetLevel(), 10)
					data.base_damage = data.base_damage + bonus
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(491292644190, --[[ModItemCharacterEffectCompositeDef Mechanic DisplayName]] "Mechanic"),
	Description = T(872843632761, --[[ModItemCharacterEffectCompositeDef Mechanic Description]] "This merc has Mechanical training."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/wrench.dds",
	Shown = true,
}

