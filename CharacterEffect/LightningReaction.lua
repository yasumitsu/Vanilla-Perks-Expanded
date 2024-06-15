UndefineClass('LightningReaction')
DefineClass.LightningReaction = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {
		PlaceObj('MsgActorReactionEffects', {
			Effects = {
				PlaceObj('ConditionalEffect', {
					'Effects', {
						PlaceObj('ExecuteCode', {
							FuncCode = 'CreateFloatingText(obj, { "Dodge"}, 428634992000, nil, 500)',
						}),
					},
				}),
			},
			Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
		}),
	},
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
					if target:DodgeCheck(self) then
						self:SetParameter("used", true)
						
						--local level = DivRound(target:GetLevel(), 2)
						local level = target:GetLevel()
						local agi = target.Agility
						--agi = DivRound(agi, 40)
						
						--local dodgeChance = agi * level
						local dodgeChance = Min(MulDivRound(agi * level , self:ResolveValue("maxChanceToProc"), 1000 ), self:ResolveValue("maxChanceToProc"))
				
						print(level, agi, dodgeChance)
						--print(level, agi, dodgechanceb)
						self:SetParameter("chance", dodgeChance)
						local oi = self:ResolveValue("chance")
						print(oi)
				
						attack_args.chance_to_hit = 0
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				self:SetParameter("used", false)
			end,
		}),
		PlaceObj('UnitReaction', {
			Handler = function ()
				if target == attack_target and not self:ResolveValue("used") and action.ActionType == "Ranged Attack" then
					
				
					
					data.mod_mul = 0
				end
			end,
		}),
	},
	Conditions = {},
	DisplayName = T(871305911291, --[[ModItemCharacterEffectCompositeDef LightningReaction DisplayName]] "Lightning Reactions"),
	Description = T(871010473514, --[[ModItemCharacterEffectCompositeDef LightningReaction Description]] "Chance (max <maxChanceToProc>%) to <color EmStyle>Dodge</color> the first successful enemy attack by <color EmStyle>Crouching</color>.\n\nOnce per round."),
	Icon = "UI/Icons/Perks/LightningReaction",
	Tier = "Silver",
	Stat = "Agility",
	StatValue = 80,
}

