UndefineClass('Doctor')
DefineClass.Doctor = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcDamageAndEffects",
			Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
				local lightArmor = false
				local armourItems = attack_target:GetEquipedArmour()
				
				for _, item in ipairs(armourItems) do
						if item.PenetrationClass < 3 then
						lightArmor = true
					end
				end
				
				if target == attacker and  lightArmor then
					local bonus = Min(target:GetLevel()/2, 5)
					data.base_damage = data.base_damage + bonus
					data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Handler = function ()
				if IsKindOf(attack_target, "Unit") and attack_target.species == "Human" and (attack_args.target_spot_group == "Groin" or attack_args.target_spot_group == "Head" ) then
				local bonus = MultiDivRound(target.Medical, self:ResolveValue("damageModifier"), 100)
				local damageBonus = MultiDivRound(data.base_damage, bonus, 100)
				print(damageBonus)
				print(attack_args)
				
				end
				
				--	local level = target:GetLevel()
				--	local bonus = self:ResolveValue("damage_bonus") + level
				--	data.base_damage = MulDivRound(data.base_damage, 100 + bonus, 100)
				--	data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(987094052058, --[[ModItemCharacterEffectCompositeDef Doctor DisplayName]] "Doctor"),
	Description = T(705527329903, --[[ModItemCharacterEffectCompositeDef Doctor Description]] "This merc has Medical training."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/first-aid-kit (1).dds",
	Shown = true,
}

