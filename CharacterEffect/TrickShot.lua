UndefineClass('TrickShot')
DefineClass.TrickShot = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	__copy_group = "Wisdom",
	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitAttack",
			Handler = function (self, target, attacker, action, attack_target, results, attack_args)
				if target == attacker and not results.miss and IsKindOf(attack_target, "Unit") then
					if attack_args.target_spot_group == "Legs" then
						attack_target:AddStatusEffect("KnockDown")
					elseif attack_args.target_spot_group == "Arms" then
						attack_target:AddStatusEffect("Numbness")
					elseif attack_args.target_spot_group == "Groin" then
						attack_target:AddStatusEffect("Exposed")
					end	
				end
			end,
		}),
	},
	DisplayName = T(681013280774, --[[ModItemCharacterEffectCompositeDef TrickShot DisplayName]] "Trick Shot"),
	Description = T(374957849272, --[[ModItemCharacterEffectCompositeDef TrickShot Description]] "<color EmStyle>Legs</color> shots apply <color EmStyle>Knocked Down</color>.\n\n<color EmStyle>Arms</color> shots apply <color EmStyle>Numbness</color>.\n\n<color EmStyle>Groin</color> shots apply <color EmStyle>Exposed</color>."),
	Icon = "UI/Icons/Perks/TrickShot",
	Tier = "Gold",
	Stat = "Medical",
	StatValue = 90,
}

