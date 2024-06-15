UndefineClass('LightningReactionNPC')
DefineClass.LightningReactionNPC = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnFirearmAttackStart",
			Handler = function (self, target, attacker, attack_target, action, attack_args)
				local conditions = target:HasStatusEffect("Blinded") or
												target:HasStatusEffect("Exhausted") or
												target:HasStatusEffect("Slowed") or								
												target:HasStatusEffect("Distracted") or								
												target:HasStatusEffect("Surprised") or								
												target:HasStatusEffect("Unaware") or
												attacker:HasStatusEffect("Hidden") or
												attacker:HasStatusEffect("HiddenNPC") or
												target:HasStatusEffect("Tired")
				
				
				if target == attack_target and not (self:ResolveValue("used") or conditions) then
					if target:LightningReactionCheck(self) then
						self:SetParameter("used", true)
						attack_args.chance_to_hit = 0
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCombatEnd",
			Handler = function (self, target)
				self:SetParameter("used", false)
			end,
		}),
	},
	DisplayName = T(784184001480, --[[ModItemCharacterEffectCompositeDef LightningReactionNPC DisplayName]] "Lightning Reactions"),
	Description = T(342324544663, --[[ModItemCharacterEffectCompositeDef LightningReactionNPC Description]] "<color EmStyle>Dodge</color> the first successful enemy attack by falling <color EmStyle>Prone</color>.\n\nOnce per combat"),
	Icon = "UI/Icons/Perks/LightningReaction",
}

