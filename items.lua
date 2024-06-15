return {
	PlaceObj('ModItemFolder', {
		'name', "Code",
	}, {
		PlaceObj('ModItemCode', {
			'name', "GiveMeARole",
			'CodeFileName', "Code/GiveMeARole.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "LevelIcons",
			'CodeFileName', "Code/LevelIcons.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "GetInitialMaxHitPoints",
			'CodeFileName', "Code/GetInitialMaxHitPoints.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "Doctor",
			'CodeFileName', "Code/Doctor.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "UseItems",
			'CodeFileName', "Code/UseItems.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "Barrage",
			'CodeFileName', "Code/Barrage.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "UnitActionBarrage",
			'CodeFileName', "Code/UnitActionBarrage.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "Dodge",
			'CodeFileName', "Code/Dodge.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "ChangePerks",
			'CodeFileName', "Code/ChangePerks.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "CanUnlockSkills",
			'CodeFileName', "Code/CanUnlockSkills.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "MGLBombard",
			'CodeFileName', "Code/MGLBombard.lua",
		}),
		PlaceObj('ModItemCode', {
			'name', "GetAllAttributes",
			'CodeFileName', "Code/GetAllAttributes.lua",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Options",
	}, {
		PlaceObj('ModItemGameRuleDef', {
			description = T(872531922431, --[[ModItemGameRuleDef AdditionalPerks description]] "Add new traits to the vanilla game."),
			display_name = T(433946219784, --[[ModItemGameRuleDef AdditionalPerks display_name]] "Additional Perks"),
			group = "Default",
			id = "AdditionalPerks",
			init_as_active = true,
			option = true,
		}),
		PlaceObj('ModItemOptionToggle', {
			'name', "EnemyRoles",
			'DisplayName', "Enemy Roles*",
			'Help', "ATENTION - This option will assign roles to enemies, giving them all the bonuses related to the role, making the game harder.",
			'DefaultValue', true,
		}),
		PlaceObj('ModItemOptionToggle', {
			'name', "LevelIcons",
			'DisplayName', "10+ Level Icons",
			'Help', "Replace the level icons and add level icons to levels above 10 until 46",
			'DefaultValue', true,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Perks",
	}, {
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Medical",
			'Id', "NaturalCamouflage",
			'SortKey', 8,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "sight_mod",
					'Value', -20,
					'Tag', "<sight_mod>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcSightModifier",
					Handler = function (self, target, value, observer, other, step_pos, darkness)
						if target == other then
							return value + self:ResolveValue("sight_mod")
						end
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(255554280355, --[[ModItemCharacterEffectCompositeDef NaturalCamouflage DisplayName]] "Natural Camouflage"),
			'Description', T(160860597113, --[[ModItemCharacterEffectCompositeDef NaturalCamouflage Description]] "This character is <number>% harder to see."),
			'Icon', "Mod/PerksExpanded/Images/Chameleon.dds",
			'Tier', "Silver",
			'Stat', "Medical",
			'StatValue', 80,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Marksmanship",
			'Id', "OverwatchExpert",
			'SortKey', 3,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "bonusAttacks",
					'Value', 1,
					'Tag', "<bonusAttacks>",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcOverwatchAttacks",
					Handler = function (self, target, value, action, args)
						return value + self:ResolveValue("bonusAttacks")
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(532324679530, --[[ModItemCharacterEffectCompositeDef OverwatchExpert DisplayName]] "Sentinel"),
			'Description', T(953678683787, --[[ModItemCharacterEffectCompositeDef OverwatchExpert Description]] "Gain an <color EmStyle>extra attack</color> when using <color EmStyle>Overwatch</color>."),
			'Icon', "Mod/PerksExpanded/Images/vigilance1.dds",
			'Tier', "Bronze",
			'Stat', "Marksmanship",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Medical",
			'Id', "SharpInstincts",
			'SortKey', 7,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "tempHP",
					'Value', 15,
					'Tag', "<tempHP>",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'DisplayName', T(795130214410, --[[ModItemCharacterEffectCompositeDef SharpInstincts DisplayName]] "Trained Reaction"),
			'Description', T(161220283053, --[[ModItemCharacterEffectCompositeDef SharpInstincts Description]] "When you enter combat, drop to Crouched if you're Standing and gain +<tempHP> Grit."),
			'Icon', "Mod/PerksExpanded/Images/idea2.dds",
			'Tier', "Bronze",
			'Stat', "Medical",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Medical",
			'Id', "SixthSense",
			'SortKey', 8,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "tempHitPoints",
					'Value', 15,
					'Tag', "<tempHitPoints>",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnEndTurn",
					Handler = function (self, target)
						local cover_id
						if g_Combat and target:IsAware() then
							cover_id = GetHighestCover(target)
						end
						if not cover_id and g_Combat:AreEnemiesAware(g_CurrentTeam) then
							target:ApplyTempHitPoints(self:ResolveValue("tempHitPoints"))
						end
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(293683380382, --[[ModItemCharacterEffectCompositeDef SixthSense DisplayName]] "Open Ground Tactics"),
			'Description', T(409442475139, --[[ModItemCharacterEffectCompositeDef SixthSense Description]] "+<tempHitPoints> Grit each time you end turn out of cover."),
			'Icon', "Mod/PerksExpanded/Images/magic-ball2.dds",
			'Tier', "Bronze",
			'Stat', "Medical",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Explosives",
			'Id', "Throwing",
			'SortKey', 3,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "RangeIncrease",
					'Value', 3,
					'Tag', "<RangeIncrease>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "FirstThrowCostReduction",
					'Value', 3,
					'Tag', "<FirstThrowCostReduction>",
				}),
			},
			'param_bindings', {},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnBeginTurn",
					Handler = function (self, target)
						target:AddStatusEffect("FirstThrow")
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(113649016654, --[[ModItemCharacterEffectCompositeDef Throwing DisplayName]] "Throwing"),
			'Description', T(227695453891, --[[ModItemCharacterEffectCompositeDef Throwing Description]] "Extended <color EmStyle>Range</color> of all thrown weapons.\n\nDramatically reduced <color EmStyle>AP</color> cost for first <color EmStyle>Knife</color> or <color EmStyle>Grenade</color> throw each turn."),
			'OnAdded', function (self, obj)
				obj:AddStatusEffect("FirstThrow")
			end,
			'Icon', "UI/Icons/Perks/Throwing",
			'Tier', "Silver",
			'Stat', "Explosives",
			'StatValue', 80,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Leadership",
			'Id', "Teacher",
			'SortKey', 1,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "MilitiaTrainingBonusPercent",
					'Value', 100,
					'Tag', "<MilitiaTrainingBonusPercent>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "MercTrainingBonus",
					'Value', 100,
					'Tag', "<MercTrainingBonus>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "squad_exp_bonus",
					'Value', 10,
					'Tag', "<squad_exp_bonus>%",
				}),
			},
			'object_class', "Perk",
			'DisplayName', T(748042767167, --[[ModItemCharacterEffectCompositeDef Teacher DisplayName]] "Teaching"),
			'Description', T(910888738080, --[[ModItemCharacterEffectCompositeDef Teacher Description]] "Faster completion of the <color EmStyle>Train Militia</color> and <color EmStyle>Training</color> Operations.\n\nGrant <color EmStyle><number>%</color> extra<color EmStyle> XP</color> to the squad (does not stack)."),
			'Icon', "UI/Icons/Perks/Teacher",
			'Tier', "Silver",
			'Stat', "Leadership",
			'StatValue', 80,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Mechanical",
			'Id', "MrFixit",
			'SortKey', 2,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "mrfixit_bonus",
					'Value', 15,
					'Tag', "<mrfixit_bonus>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "mrfixit_ap",
					'Value', 1,
					'Tag', "<mrfixit_ap>",
				}),
			},
			'object_class', "Perk",
			'DisplayName', T(953805503643, --[[ModItemCharacterEffectCompositeDef MrFixit DisplayName]] "Mr. Fixit"),
			'Description', T(388336137725, --[[ModItemCharacterEffectCompositeDef MrFixit Description]] "Major bonus to <color EmStyle>Disarm</color> traps, <color EmStyle>Hack</color> devices, and <color EmStyle>Pick</color> locks checks.\n\nUnjamming weapons costs <color EmStyle><mrfixit_ap> AP</color>."),
			'Icon', "UI/Icons/Perks/MrFixit",
			'Tier', "Bronze",
			'Stat', "Mechanical",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Marksmanship",
			'Id', "CQCTraining",
			'SortKey', 4,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "cqc_bonus_max",
					'Value', 20,
					'Tag', "<cqc_bonus_max>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "cqc_bonus_loss_per_tile",
					'Value', 2,
					'Tag', "<cqc_bonus_loss_per_tile>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcChanceToHit",
					Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
						if target == attacker then
							local value = self:ResolveValue("cqc_bonus_max")
							local tileSpace = DivRound(attacker:GetDist2D(attack_target), const.SlabSizeX) - 1
							if tileSpace > 0 then
								local lossPerTile = self:ResolveValue("cqc_bonus_loss_per_tile")
								value = value - lossPerTile * tileSpace
							end
							if value > 0 then
								ApplyCthModifier_Add(self, data, value)
							end
						end
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(977014262900, --[[ModItemCharacterEffectCompositeDef CQCTraining DisplayName]] "CQC Training"),
			'Description', T(739437656502, --[[ModItemCharacterEffectCompositeDef CQCTraining Description]] "Major <color EmStyle>Accuracy</color> bonus when attacking enemies at short range (degrades with distance)."),
			'Icon', "UI/Icons/Perks/CQCTraining",
			'Tier', "Bronze",
			'Stat', "Marksmanship",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Leadership",
			'Id', "Negotiator",
			'SortKey', 10,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "discountPercent",
					'Value', 20,
					'Tag', "<discountPercent>%",
				}),
			},
			'param_bindings', {},
			'object_class', "Perk",
			'DisplayName', T(523277431375, --[[ModItemCharacterEffectCompositeDef Negotiator DisplayName]] "Negotiator"),
			'Description', T(135855553893, --[[ModItemCharacterEffectCompositeDef Negotiator Description]] "Reduces prices for <color EmStyle>Sector Operations</color> and <color EmStyle>Boat Travel</color>.\n\nAdditional <color EmStyle>conversation options</color>."),
			'Icon', "UI/Icons/Perks/Negotiator",
			'Tier', "Bronze",
			'Stat', "Leadership",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Marksmanship",
			'Id', "Ambidextrous",
			'SortKey', 5,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "PenaltyReduction",
					'Value', 15,
					'Tag', "<PenaltyReduction>",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnModifyCTHModifier",
					Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
						if target == attacker and id == "TwoWeaponFire" then
							data.mod_add = data.mod_add + self:ResolveValue("PenaltyReduction")
							data.meta_text[#data.meta_text + 1] = T{756119910645, "Perk: <perkName>", perkName = self.DisplayName}
						end
					end,
					param_bindings = false,
				}),
			},
			'Modifiers', {},
			'DisplayName', T(920488455934, --[[ModItemCharacterEffectCompositeDef Ambidextrous DisplayName]] "Ambidextrous"),
			'Description', T(169645850395, --[[ModItemCharacterEffectCompositeDef Ambidextrous Description]] "Reduced <color EmStyle>Accuracy</color> penalty when <color EmStyle>Dual-Wielding</color> Firearms."),
			'Icon', "UI/Icons/Perks/Ambidextrous",
			'Tier', "Bronze",
			'Stat', "Marksmanship",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Health",
			'Id', "HitTheDeck",
			'SortKey', 2,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "explosiveLessDamage",
					'Value', 20,
					'Tag', "<explosiveLessDamage>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcMoveModifier",
					Handler = function (self, target, value, action)
						if action.id == "Move" then
							target:AddStatusEffect("HitTheDeckMoveMod")
						end
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(528467689923, --[[ModItemCharacterEffectCompositeDef HitTheDeck DisplayName]] "Hit The Deck"),
			'Description', T(345357935343, --[[ModItemCharacterEffectCompositeDef HitTheDeck Description]] "Switching to <color EmStyle>Prone</color> is <color EmStyle>Free</color>.\n\nMoving in crouch or prone positions is less costly.\n\nAdditional <color EmStyle><explosiveLessDamage>% Damage</color> reduction from <color EmStyle>Explosives</color> when <color EmStyle>Prone</color>."),
			'Icon', "UI/Icons/Perks/HitTheDeck",
			'Tier', "Bronze",
			'Stat', "Health",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Perk-NPC",
			'Id', "LightningReactionNPC",
			'SortKey', 6,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "chance",
					'Value', 50,
					'Tag', "<chance>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
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
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCombatEnd",
					Handler = function (self, target)
						self:SetParameter("used", false)
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(784184001480, --[[ModItemCharacterEffectCompositeDef LightningReactionNPC DisplayName]] "Lightning Reactions"),
			'Description', T(342324544663, --[[ModItemCharacterEffectCompositeDef LightningReactionNPC Description]] "<color EmStyle>Dodge</color> the first successful enemy attack by falling <color EmStyle>Prone</color>.\n\nOnce per combat"),
			'Icon', "UI/Icons/Perks/LightningReaction",
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Agility",
			'Id', "LightningReaction",
			'SortKey', 6,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "maxChanceToProc",
					'Value', 25,
					'Tag', "<maxChanceToProc>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {
				PlaceObj('MsgActorReactionEffects', {
					Effects = {
						PlaceObj('ConditionalEffect', {
							'Effects', {
								PlaceObj('ExecuteCode', {
									FuncCode = 'CreateFloatingText(obj, { "Dodge"}, 428634992000, nil, 500)',
									param_bindings = false,
								}),
							},
						}),
					},
					Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
					param_bindings = false,
				}),
			},
			'unit_reactions', {
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
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnBeginTurn",
					Handler = function (self, target)
						self:SetParameter("used", false)
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Handler = function ()
						if target == attack_target and not self:ResolveValue("used") and action.ActionType == "Ranged Attack" then
							
						
							
							data.mod_mul = 0
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {},
			'DisplayName', T(871305911291, --[[ModItemCharacterEffectCompositeDef LightningReaction DisplayName]] "Lightning Reactions"),
			'Description', T(871010473514, --[[ModItemCharacterEffectCompositeDef LightningReaction Description]] "Chance (max <maxChanceToProc>%) to <color EmStyle>Dodge</color> the first successful enemy attack by <color EmStyle>Crouching</color>.\n\nOnce per round."),
			'Icon', "UI/Icons/Perks/LightningReaction",
			'Tier', "Silver",
			'Stat', "Agility",
			'StatValue', 80,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Agility",
			'Id', "SteadyBreathing",
			'SortKey', 3,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "freeMoveBonusAp",
					'Value', 3,
					'Tag', "<freeMoveBonusAp>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "freeMoveBonusApMedium",
					'Value', 2,
					'Tag', "<freeMoveBonusApMedium>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "freeMoveBonusApHeavy",
					'Value', 1,
					'Tag', "<freeMoveBonusApHeavy>",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcFreeMove",
					Handler = function (self, target, data)
						local armourItems = target:GetEquipedArmour()
						local medium = false
						local heavy = false
						
						for _, item in ipairs(armourItems) do
								if item.PenetrationClass == 3 then
								medium = true
							end
							if item.PenetrationClass > 4 then
								heavy = true
							end
						end
						if medium then
							data.add = data.add + self:ResolveValue("freeMoveBonusApMedium")
						elseif heavy then
							data.add = data.add + self:ResolveValue("freeMoveBonusApHeavy")
						else
							data.add = data.add + self:ResolveValue("freeMoveBonusAp")
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {},
			'DisplayName', T(641253187551, --[[ModItemCharacterEffectCompositeDef SteadyBreathing DisplayName]] "Fast Runner"),
			'Description', T(824962629346, --[[ModItemCharacterEffectCompositeDef SteadyBreathing Description]] "Increased <color EmStyle>Free Move</color> <color EmStyle>Range</color> when not wearing <color EmStyle>Heavy Armor</color>."),
			'Icon', "UI/Icons/Perks/SteadyBreathing",
			'Tier', "Bronze",
			'Stat', "Agility",
			'StatValue', 70,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Health",
			'Id', "Berserker",
			'SortKey', 4,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "damageReductionBonus",
					'Value', 10,
					'Tag', "<damageReductionBonus>%",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "stackCap",
					'Value', 5,
					'Tag', "<stackCap>",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcDamageAndEffects",
					Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
						if target == attack_target then
							local wounded = target:GetStatusEffect("Wounded")
							if wounded and wounded.stacks > 0 then
								local stackCap = self:ResolveValue("stackCap")
								local reductionPerStack = self:ResolveValue("damageReductionBonus")
								local stacks = Min(wounded.stacks, stackCap)
								local enduranceMod = reductionPerStack*stacks
								
								data.base_damage = MulDivRound(data.base_damage, 100 - enduranceMod, 100)
								data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = enduranceMod }
							end
						
							if target.team.player_enemy and g_Combat and not table.find(g_Combat.berserkVRsPerRole, target.role) then
								PlayVoiceResponse(target, "AIBerserkerPerk")
								table.insert(g_Combat.berserkVRsPerRole, target.role)
							end
						end
					end,
					param_bindings = false,
				}),
			},
			'DisplayName', T(205199205251, --[[ModItemCharacterEffectCompositeDef Berserker DisplayName]] "Endurance"),
			'Description', T(472688632606, --[[ModItemCharacterEffectCompositeDef Berserker Description]] "Reduce <color EmStyle><damageReductionBonus>% Damage</color> per <color EmStyle>Wound</color>.\n\nCapped at <stackCap> stacks.<color EmStyle>"),
			'Icon', "UI/Icons/Perks/PainManagement",
			'Tier', "Silver",
			'Stat', "Health",
			'StatValue', 80,
		}),
		PlaceObj('ModItemFolder', {
			'name', "Personal",
		}, {
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "LightStep",
				'object_class', "Perk",
				'msg_reactions', {},
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnEndTurn",
						Handler = function (self, target)
							if target:GetLevel() >5 and not target:HasStatusEffect("Hidden") then
								target:RemoveStatusEffect("Spotted")
								target:AddStatusEffect("Hidden")
								Msg("UnitStealthChanged", target)
							end
						end,
						param_bindings = false,
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
						param_bindings = false,
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
						param_bindings = false,
					}),
				},
				'Conditions', {},
				'DisplayName', T(308830527336, --[[ModItemCharacterEffectCompositeDef LightStep DisplayName]] "Light-footed"),
				'Description', T(749518715050, --[[ModItemCharacterEffectCompositeDef LightStep Description]] "<color EmStyle>Ignore</color> enemy <color EmStyle>Overwatch</color> areas when moving. Hide after killing an unit at level 4, Hide at the end of its turn at level 6, Hide after taking damage at level 8."),
				'Icon', "UI/Icons/Perks/LightStep",
				'Tier', "Personal",
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "JackOfAllTrades",
				'Parameters', {
					PlaceObj('PresetParamPercent', {
						'Name', "activityDurationMod",
						'Value', 33,
						'Tag', "<activityDurationMod>%",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "dmgResistance",
						'Value', 2,
						'Tag', "<dmgResistance>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcDamageAndEffects",
						Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
							if target == attack_target then  
							    local dmgRes = MulDivRound(data.base_damage, (self:ResolveValue("dmgResistance") * target:GetLevel()), 100)
							    data.base_damage = data.base_damage - dmgRes
								data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
							end
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', T(512665067655, --[[ModItemCharacterEffectCompositeDef JackOfAllTrades DisplayName]] "Jack Of All Trades"),
				'Description', T(429912088598, --[[ModItemCharacterEffectCompositeDef JackOfAllTrades Description]] "All <color EmStyle>Operations</color> that Wolf undertakes are completed approximately <color EmStyle><activityDurationMod>% faster</color>. Wolf is also very versatile and gets 2% damage resistance every level."),
				'Icon', "UI/Icons/Perks/JackOfAllTrades",
				'Tier', "Personal",
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "HawksEye",
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "pindownCostOverwrite",
						'Value', 1,
						'Tag', "<pindownCostOverwrite>",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "RangeIncrease",
						'Value', 10,
						'Tag', "<RangeIncrease>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
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
						param_bindings = false,
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
						param_bindings = false,
					}),
				},
				'DisplayName', T(527312196263, --[[ModItemCharacterEffectCompositeDef HawksEye DisplayName]] "Eagle Eye"),
				'Description', T(831074715476, --[[ModItemCharacterEffectCompositeDef HawksEye Description]] "<color EmStyle>Pin Down</color> applies <color EmStyle>Exposed</color> to the target.\n\n<color EmStyle>Pin Down</color> minimum <color EmStyle>AP</color> cost is reduced to <color EmStyle><pindownCostOverwrite> AP</color>.\n\nScope also makes <color EmStyle>Biscuits</color>.\n\nExtended <em>Range</em> of all Rifles."),
				'Icon', "UI/Icons/Perks/HawksEye",
				'Tier', "Personal",
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "BunsPerk",
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "CtHBonus",
						'Value', 10,
						'Tag', "<CtHBonus>",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "RangeIncrease",
						'Value', 10,
						'Tag', "<RangeIncrease>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcChanceToHit",
						Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
							if target == attacker and IsKindOf(data.target, "Unit") and IsValidTarget(data.target) then
								for _, unit in ipairs(data.target.hit_this_turn) do
									if unit ~= attacker and band(unit.team.ally_mask, attacker.team.team_mask) ~= 0 then
										ApplyCthModifier_Add(self, data, self:ResolveValue("CtHBonus"), T{776394275735, "Perk: <name>", name = self.DisplayName})
										return
									end
								end
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnUnitGetWeaponRange",
						Handler = function (self, target, value, weapon, action)
							local level = target:GetLevel()
							
							if level > 5 then
							if IsKindOfClasses(weapon, "SniperRifle") then
								local maxRange = weapon.WeaponRange
								local bonus = self:ResolveValue("RangeIncrease") + target:GetLevel()
								maxRange = MulDivRound(maxRange, 100 + bonus, 100) 
								return maxRange
							end
							end
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', T(135821907017, --[[ModItemCharacterEffectCompositeDef BunsPerk DisplayName]] "Anything You Can Do..."),
				'Description', T(420486100169, --[[ModItemCharacterEffectCompositeDef BunsPerk Description]] "Gains <color EmStyle>Accuracy</color> bonus against targets hit by an <color EmStyle>ally</color> this turn.\nExtended <em>Range</em> of all Rifles at level 6."),
				'Icon', "UI/Icons/Perks/BunsPerk",
				'Tier', "Personal",
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "KalynaPerk",
				'Parameters', {
					PlaceObj('PresetParamPercent', {
						'Name', "RangeIncrease",
						'Value', 10,
						'Tag', "<RangeIncrease>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcDamageAndEffects",
						Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
							if target == attacker and data.action_id == self.class then
								data.ignore_armor = true
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnUnitGetWeaponRange",
						Handler = function (self, target, value, weapon, action)
							local level = target:GetLevel()
							
							if level >2 then
							if IsKindOfClasses(weapon, "SniperRifle") then
								local maxRange = weapon.WeaponRange
								local bonus = self:ResolveValue("RangeIncrease") + target:GetLevel()
								maxRange = MulDivRound(maxRange, 100 + bonus, 100) 
								return maxRange
							end
							end
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', T(450630168120, --[[ModItemCharacterEffectCompositeDef KalynaPerk DisplayName]] "Inevitable Strike"),
				'Description', T(210912564757, --[[ModItemCharacterEffectCompositeDef KalynaPerk Description]] "<color EmStyle>Ranged attack</color> that bypasses damage reduction from <color EmStyle>Armor</color>.\n\nCan't be used with Shotguns.\n\nExtended <em>Range</em> of all Rifles at level 4."),
				'Icon', "UI/Icons/Perks/KalynaPerk",
				'Tier', "Personal",
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Perk-Personal",
				'Id', "InnerInfo",
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "maxBonus",
						'Value', 20,
						'Tag', "<maxBonus>",
					}),
				},
				'object_class', "Perk",
				'msg_reactions', {
					PlaceObj('MsgActorReactionEffects', {
						Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
						param_bindings = false,
					}),
				},
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnHackIntelDsicovered",
						Handler = function (self, target)
							local discoveredFor = DiscoverIntelForRandomSector(2, "no notification")
							if discoveredFor then
								CombatLog("important", T{312197955233, "Livewire used her custom PDA to discover additional Intel for <em><SectorName(sectorId)></em>", sectorId = discoveredFor})
							end
							target:AddToInventory("CustomPDA", 1)
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnCalcHackMoneyGained",
						Handler = function (self, target, value)
							target:AddToInventory("CustomPDA", 1)
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnCalcChanceToHit",
						Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
							--if target == attacker  and ((IsKindOfClasses(weapon1, "Firearm") and weapon1:IsFullyModified()) or (IsKindOfClasses(weapon2, "Firearm") and weapon2:IsFullyModified())) then
							--	local bonus = target.Mechanical/10
							local ItemId = "CustomPDA"
							local bonus
							local pdaStacks = 0
							target:ForEachItem(false, function(item, slot)
								if item.class == ItemId then
									pdaStacks = item.Amount
								end
							end)
										
							bonus = Min(self:ResolveValue("maxBonus"), pdaStacks)
							ApplyCthModifier_Add(self, data, bonus)
							--end
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', T(973384981010, --[[ModItemCharacterEffectCompositeDef InnerInfo DisplayName]] "Hack the System!"),
				'Description', T(258443421203, --[[ModItemCharacterEffectCompositeDef InnerInfo Description]] "<color EmStyle>Gives</color> her 1% <color EmStyle>bonus</color> for <color EmStyle>chance to hit</color> every time she successfully hacks something."),
				'Icon', "Mod/PerksExpanded/Images/hacker (2) 2.dds",
				'Tier', "Personal",
			}),
			}),
		PlaceObj('ModItemFolder', {
			'name', "Specialization",
		}, {
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Marksmanship",
				'Id', "Gunslinger",
				'SortKey', 7,
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "ap_cost_reduction",
						'Value', 1,
						'Tag', "<ap_cost_reduction>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "min_ap_cost",
						'Value', 1,
						'Tag', "<min_ap_cost>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "RangeIncrease",
						'Value', 5,
						'Tag', "<RangeIncrease>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "PenaltyReduction",
						'Value', 15,
						'Tag', "<PenaltyReduction>",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "gunslingerCthBonus",
						'Tag', "<gunslingerCthBonus>%",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "damage_bonus",
						'Value', 10,
						'Tag', "<damage_bonus>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnUnitGetWeaponRange",
						Handler = function (self, target, value, weapon, action)
							if IsKindOfClasses(weapon, "Pistol", "Revolver") then
								local maxRange = weapon.WeaponRange
									maxRange = maxRange + self:ResolveValue("RangeIncrease")
								return maxRange
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnCalcChanceToHit",
						Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
							if target == attacker  and (IsKindOfClasses(weapon1, "Pistol", "Revolver") or IsKindOfClasses(weapon2, "Pistol", "Revolver")) then
								local level = target:GetLevel()
								local value =  self:ResolveValue("gunslingerCthBonus") + level
								ApplyCthModifier_Add(self, data, value)
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnCalcAPCost",
						Handler = function (self, target, current_ap, action, weapon, aim)
							if IsKindOfClasses(weapon, "Pistol", "Revolver") then
								local reduction = self:ResolveValue("ap_cost_reduction") * const.Scale.AP
								local minCost = self:ResolveValue("min_ap_cost") * const.Scale.AP
							
								return Max(minCost, current_ap - reduction)
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnCalcDamageAndEffects",
						Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
							if target == attacker and IsKindOfClasses(weapon, "Pistol", "Revolver") then
								local level = target:GetLevel()
								local bonus = self:ResolveValue("damage_bonus") + level
								data.base_damage = MulDivRound(data.base_damage, 100 + bonus, 100)
								data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnModifyCTHModifier",
						Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
							local doubleTap = target:GetLastAttack() == attack_target
								and target == attacker
								and (IsKindOfClasses(weapon1, "Pistol") or IsKindOfClasses(weapon2, "Pistol"))
							
							if doubleTap then
								target:AddStatusEffect("DoubleTapPistol")
								else
								target:RemoveStatusEffect("DoubleTapPistol")
							end
						end,
						param_bindings = false,
					}),
				},
				'Modifiers', {},
				'DisplayName', T(983375857101, --[[ModItemCharacterEffectCompositeDef Gunslinger DisplayName]] "Gunslinger"),
				'Description', T(280088538306, --[[ModItemCharacterEffectCompositeDef Gunslinger Description]] "Attacks with <color EmStyle>Pistols</color> and <color EmStyle>Revolvers</color> have reduced <color EmStyle>AP</color> cost, increased <em>chance to hit</em>, <em>damage</em> and extended <em>Range</em>."),
				'Icon', "Mod/PerksExpanded/Images/Fanning4.dds",
				'Tier', "Silver",
				'Stat', "Marksmanship",
				'StatValue', 80,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Marksmanship",
				'Id', "AutoWeapons",
				'SortKey', 8,
				'Parameters', {
					PlaceObj('PresetParamPercent', {
						'Name', "automatics_penalty_reduction",
						'Value', 25,
						'Tag', "<automatics_penalty_reduction>%",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "rangeBonusSMG",
						'Value', 3,
						'Tag', "<rangeBonusSMG>",
					}),
				},
				'object_class', "Perk",
				'msg_reactions', {},
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnModifyCTHModifier",
						Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
							if id == "Autofire" and target == attacker and (IsKindOfClasses(weapon1, "AssaultRifle", "SubmachineGun") or IsKindOfClasses(weapon2, "AssaultRifle", "SubmachineGun")) then
								data.mod_mul = AutoWeapons:ResolveValue("automatics_penalty_reduction")
								data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
							end
							
							-- double tap technique
							
							local doubleTap = target:GetLastAttack() == attack_target 
								and target == attacker
								and (IsKindOfClasses(weapon1, "AssaultRifle", "SubmachineGun") or IsKindOfClasses(weapon2, "SubmachineGun"))
							
							if doubleTap then
								target:AddStatusEffect("DoubleTap")
								else
								target:RemoveStatusEffect("DoubleTap")
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnUnitGetWeaponRange",
						Handler = function (self, target, value, weapon, action)
							if IsKindOfClasses(weapon, "AssaultRifle") then
								local maxRange = weapon.WeaponRange
								local level = target:GetLevel()
							
									maxRange = MulDivRound(maxRange, 100 + level, 100)
								return maxRange
							end
							
							if IsKindOfClasses(weapon, "SubmachineGun") then
								local maxRange = weapon.WeaponRange
								maxRange = maxRange + self:ResolveValue("rangeBonusSMG")
								return maxRange
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnUnitAttackResolved",
						Handler = function (self, target, attacker, attack_target, action, attack_args, results, can_retaliate, combat_starting)
							-- run and gun technique
							if target == attacker and IsKindOfClasses(results.weapon, "SubmachineGun") and action.id == "BurstFire" and attack_args.aim == 0 then
								if g_Combat then
									attacker:AddStatusEffect("FreeMove")
								elseif g_StartingCombat or combat_starting then
									attacker:AddStatusEffect("FreeMoveOnCombatStart")
								end
							end
						end,
						param_bindings = false,
					}),
				},
				'Modifiers', {},
				'DisplayName', T(433549306527, --[[ModItemCharacterEffectCompositeDef AutoWeapons DisplayName]] "Auto Weapons"),
				'Description', T(860512099026, --[[ModItemCharacterEffectCompositeDef AutoWeapons Description]] 'Reduced <color EmStyle>Accuracy</color> penalty when using <color EmStyle>Burst Fire</color> or <color EmStyle>Full Auto</color>.\nIncreased <color EmStyle>Range</color> for <color EmStyle>Assault Rifles</color> and <color EmStyle>SMGs</color>. Unlocks "Barrage" for SMGs.'),
				'Icon', "UI/Icons/Perks/AutoWeapons",
				'Tier', "Silver",
				'Stat', "Marksmanship",
				'StatValue', 80,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "Explosives",
				'Id', "HeavyWeaponsTraining",
				'SortKey', 7,
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "ap_cost_reduction",
						'Value', 1,
						'Tag', "<ap_cost_reduction>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "min_ap_cost",
						'Value', 1,
						'Tag', "<min_ap_cost>",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "heavyWeapons_penalty_reduction",
						'Value', 50,
						'Tag', "<heavyWeapons_penalty_reduction>%",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcAPCost",
						Handler = function (self, target, current_ap, action, weapon, aim)
							if IsKindOfClasses(weapon, "HeavyWeapon", "MachineGun") then
								local reduction = self:ResolveValue("ap_cost_reduction") * const.Scale.AP
								local minCost = self:ResolveValue("min_ap_cost") * const.Scale.AP
								return Max(minCost, current_ap - reduction)
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnBeginTurn",
						Handler = function (self, target)
							target:AddStatusEffect("FreeMove")
							if not HasPerk(target, "Ironclad") then
								target:ConsumeAP(DivRound(target.free_move_ap, 2), "Move")
							end
						end,
						param_bindings = false,
					}),
					PlaceObj('UnitReaction', {
						Event = "OnModifyCTHModifier",
						Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
							if id == "Autofire" and target == attacker and (IsKindOfClasses(weapon1, "MachineGun") or IsKindOfClasses(weapon2, "MachineGun")) then
								data.mod_mul = HeavyWeaponsTraining:ResolveValue("heavyWeapons_penalty_reduction")
								data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
							end
						end,
						param_bindings = false,
					}),
				},
				'Conditions', {},
				'DisplayName', T(385640383798, --[[ModItemCharacterEffectCompositeDef HeavyWeaponsTraining DisplayName]] "Heavy Weapons"),
				'Description', T(134513669893, --[[ModItemCharacterEffectCompositeDef HeavyWeaponsTraining Description]] "Attacks and <color EmStyle>Setup</color> with <color EmStyle>Heavy Weapons</color> and <color EmStyle>Machine Guns</color> have reduced <color EmStyle>AP</color> cost.\n\nImproves the effect of the <em>Ironclad</em> perk to full <GameTerm('FreeMove')> with cumbersome gear."),
				'Icon', "UI/Icons/Perks/HeavyWeaponsTraining",
				'Tier', "Bronze",
				'Stat', "Explosives",
				'StatValue', 70,
			}),
			}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Combat Action",
	}, {
		PlaceObj('ModItemChangeProp', {
			'name', "Barrage",
			'TargetClass', "CombatAction",
			'TargetId', "BulletHell",
			'TargetProp', "GetActionResults",
			'TargetValue', function (self, unit, args)
				if HasPerk(unit, "BulletHell") then
				local args = table.copy(args)
					args.weapon = args.weapon or self:GetAttackWeapons(unit, args)
					args.num_shots = Clamp(args.weapon.ammo.Amount, self:ResolveValue("min_ammo"), self:ResolveValue("max_ammo"))
					args.applied_status = { "Suppressed", "SuppressionChangeStance" }
					args.aoe_fx_action = "WeaponAutoFire"
					args.aoe_action_id = self.id
					args.aoe_damage_bonus = MulDivRound(self:ResolveValue("max_ammo_aoe_damage_bonus"), args.num_shots, self:ResolveValue("max_ammo"))
					local attack_args = unit:PrepareAttackArgs(self.id, args)
					local results = attack_args.weapon:GetAttackResults(self, attack_args)
					return results, attack_args
				else
					local args = table.copy(args)
					args.weapon = args.weapon or self:GetAttackWeapons(unit, args)
					args.num_shots = Clamp(args.weapon.ammo.Amount, 10, 15)
					--args.applied_status = { "Suppressed", "SuppressionChangeStance" }
					args.aoe_fx_action = "WeaponAutoFire"
					args.aoe_action_id = self.id
					args.aoe_damage_bonus = MulDivRound(10, args.num_shots, 15)
					local attack_args = unit:PrepareAttackArgs(self.id, args)
					local results = attack_args.weapon:GetAttackResults(self, attack_args)
					return results, attack_args
				end
			end,
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "ExplodingPalm",
			'TargetClass', "CombatAction",
			'TargetId', "ExplodingPalm",
			'TargetProp', "GetAttackWeapons",
			'TargetValue', function (self, unit, args)
				return unit:GetActiveWeapons("MeleeWeapon") or unit:GetActiveWeapons("UnarmedWeapon")
			end,
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "SteroidPunch",
			'TargetClass', "CombatAction",
			'TargetId', "SteroidPunch",
			'TargetProp', "GetAttackWeapons",
			'TargetValue', function (self, unit, args)
				return unit:GetActiveWeapons("MeleeWeapon") or unit:GetActiveWeapons("UnarmedWeapon")
			end,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Items",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "Personal - Equipment",
			'Id', "CustomPDA",
			'object_class', "InventoryStack",
			'Repairable', false,
			'Icon', "UI/Icons/Items/custom_pda",
			'DisplayName', T(759765204122, --[[ModItemInventoryItemCompositeDef CustomPDA DisplayName]] "Livewire's PDA"),
			'DisplayNamePlural', T(181529049205, --[[ModItemInventoryItemCompositeDef CustomPDA DisplayNamePlural]] "Livewire's PDAs"),
			'Description', T(720580044293, --[[ModItemInventoryItemCompositeDef CustomPDA Description]] "Useful for accessing the web and hacking military grade computers."),
			'AdditionalHint', T(615384185665, --[[ModItemInventoryItemCompositeDef CustomPDA AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Grants additional Intel when hacking\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Has cute stickers on it"),
			'locked', true,
			'RestockWeight', 0,
			'MaxStacks', 20,
		}),
		PlaceObj('ModItemFolder', {
			'name', "Books",
		}, {
			PlaceObj('ModItemInventoryItemCompositeDef', {
				'Group', "Magazines",
				'Id', "SkillMag_Regen",
				'object_class', "MiscItem",
				'Repairable', false,
				'Icon', "UI/Icons/Items/mag_the_red_wire",
				'DisplayName', T(779194599933, --[[ModItemInventoryItemCompositeDef SkillMag_Regen DisplayName]] "Regen"),
				'DisplayNamePlural', T(240266772545, --[[ModItemInventoryItemCompositeDef SkillMag_Regen DisplayNamePlural]] "Regen"),
				'Description', T(154185974978, --[[ModItemInventoryItemCompositeDef SkillMag_Regen Description]] "Recently blew up after several issues."),
				'AdditionalHint', T(951914419119, --[[ModItemInventoryItemCompositeDef SkillMag_Regen AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Used through the Item Menu\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Single use\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Adds Regen"),
				'UnitStat', "Health",
				'Valuable', 1,
				'Cost', 5000,
				'Tier', 2,
				'MaxStock', 1,
				'RestockWeight', 10,
				'effect_moment', "on_use",
				'Effects', {
					PlaceObj('UnitAddStatusEffect', {
						Status = "Regen",
						TargetUnit = "current unit",
					}),
				},
				'action_name', T(515963026409, --[[ModItemInventoryItemCompositeDef SkillMag_Regen action_name]] "READ"),
				'destroy_item', true,
			}),
			PlaceObj('ModItemInventoryItemCompositeDef', {
				'Group', "Magazines",
				'Id', "SkillMag_Survival",
				'object_class', "MiscItem",
				'Repairable', false,
				'Icon', "UI/Icons/Items/mag_an_apple_a_day",
				'DisplayName', T(713133202518, --[[ModItemInventoryItemCompositeDef SkillMag_Survival DisplayName]] "Survival Instinct"),
				'DisplayNamePlural', T(313878002898, --[[ModItemInventoryItemCompositeDef SkillMag_Survival DisplayNamePlural]] "Survival Instinct"),
				'Description', T(707098617829, --[[ModItemInventoryItemCompositeDef SkillMag_Survival Description]] "Doctors really hate this one simple trick."),
				'AdditionalHint', T(769271035160, --[[ModItemInventoryItemCompositeDef SkillMag_Survival AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Used through the Item Menu\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Single use\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Adds Survival Instinct"),
				'UnitStat', "Health",
				'Valuable', 1,
				'Cost', 5000,
				'MaxStock', 1,
				'RestockWeight', 10,
				'effect_moment', "on_use",
				'Effects', {
					PlaceObj('UnitAddStatusEffect', {
						Status = "SurvivalInstinct",
						TargetUnit = "current unit",
					}),
				},
				'action_name', T(581172471321, --[[ModItemInventoryItemCompositeDef SkillMag_Survival action_name]] "READ"),
				'destroy_item', true,
			}),
			}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "New Perks",
	}, {
		PlaceObj('ModItemFolder', {
			'name', "Status Effect",
		}, {
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "BonusHPRoles",
				'SortKey', 100,
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "bonus_health",
						'Value', 1,
						'Tag', "<bonus_health>",
					}),
				},
				'object_class', "Perk",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnExplorationTick",
						Handler = function (self, target)
							local lvl = target:GetLevel()
							local bonus = self:ResolveValue("bonus_health") * lvl
							self:SetParameter("bonus_health", bonus)
							RecalcMaxHitPoints(target)
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', "",
				'Description', "",
				'OnAdded', function (self, obj)
					RecalcMaxHitPoints(obj)
				end,
				'OnRemoved', function (self, obj)
					RecalcMaxHitPoints(obj)
				end,
				'Stat', "Health",
				'StatValue', 70,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "DoubleTapPistol",
				'SortKey', 5,
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "DoubleTapReduction",
						'Value', 1,
						'Tag', "<DoubleTapReduction>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "minApCost",
						'Value', 2,
						'Tag', "<minApCost>",
					}),
				},
				'param_bindings', {},
				'object_class', "StatusEffect",
				'unit_reactions', {
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
						param_bindings = false,
					}),
				},
				'Conditions', {},
				'DisplayName', T(584190543912, --[[ModItemCharacterEffectCompositeDef DoubleTapPistol DisplayName]] "Double Tap"),
				'Description', T(422046704132, --[[ModItemCharacterEffectCompositeDef DoubleTapPistol Description]] "Reduce AP on same target"),
				'OnAdded', function (self, obj)  end,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "DoubleTap",
				'SortKey', 5,
				'Parameters', {
					PlaceObj('PresetParamNumber', {
						'Name', "DoubleTapReduction",
						'Value', 1,
						'Tag', "<DoubleTapReduction>",
					}),
					PlaceObj('PresetParamNumber', {
						'Name', "minApCost",
						'Value', 3,
						'Tag', "<minApCost>",
					}),
				},
				'param_bindings', {},
				'object_class', "StatusEffect",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcAPCost",
						Handler = function (self, target, current_ap, action, weapon, aim)
							if IsKindOfClasses(weapon, "AssaultRifle", "SubmachineGun") and aim < 2 and action.id == "SingleShot" then
								local costReduction = self:ResolveValue("DoubleTapReduction") * const.Scale.AP
								local minCost = self:ResolveValue("minApCost")
								return Max(minCost, current_ap - costReduction)
							end
							
							-- find a way to proc only once per attack_target
							--- 	return Max(minCost, current_ap - reduction)
						end,
						param_bindings = false,
					}),
				},
				'DisplayName', T(220124805651, --[[ModItemCharacterEffectCompositeDef DoubleTap DisplayName]] "Double Tap"),
				'Description', T(309005053725, --[[ModItemCharacterEffectCompositeDef DoubleTap Description]] "Reduce AP on same target"),
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "LeaderAuraBuff",
				'SortKey', 5,
				'Parameters', {},
				'param_bindings', {},
				'object_class', "StatusEffect",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcPersonalMorale",
						Handler = function (self, target, value)
							local value = value + CharacterEffectDefs.Leader:ResolveValue("moraleBuff")
							return value
						end,
						param_bindings = false,
					}),
				},
				'Conditions', {
					PlaceObj('CheckGameRule', {
						Rule = "AdditionalPerks",
						param_bindings = false,
					}),
				},
				'DisplayName', T(417755850224, --[[ModItemCharacterEffectCompositeDef LeaderAuraBuff DisplayName]] "Inspiring Leadership"),
				'Description', T(646479217785, --[[ModItemCharacterEffectCompositeDef LeaderAuraBuff Description]] "Thanks to the presence of the Leader this unit is inspired to fight better."),
				'type', "Buff",
				'lifetime', "Until End of Turn",
				'Icon', "Mod/PerksExpanded/Images/buff (1).dds",
				'RemoveOnEndCombat', true,
				'Shown', true,
				'HasFloatingText', true,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "LeaderAuraDebuff",
				'SortKey', 5,
				'Parameters', {},
				'param_bindings', {},
				'object_class', "StatusEffect",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcPersonalMorale",
						Handler = function (self, target, value)
							local value = value + CharacterEffectDefs.Leader:ResolveValue("moraleDebuff")
							return value
						end,
						param_bindings = false,
					}),
				},
				'Conditions', {
					PlaceObj('CheckGameRule', {
						Rule = "AdditionalPerks",
						param_bindings = false,
					}),
				},
				'DisplayName', T(685849089549, --[[ModItemCharacterEffectCompositeDef LeaderAuraDebuff DisplayName]] "Leader Aura"),
				'Description', T(771127781683, --[[ModItemCharacterEffectCompositeDef LeaderAuraDebuff Description]] "Leader Aura"),
				'OnAdded', function (self, obj)  end,
				'type', "Debuff",
				'lifetime', "Until End of Turn",
				'Icon', "Mod/PerksExpanded/Images/weakness.dds",
				'RemoveOnEndCombat', true,
				'Shown', true,
				'HasFloatingText', true,
			}),
			PlaceObj('ModItemCharacterEffectCompositeDef', {
				'Group', "System",
				'Id', "HitTheDeckMoveMod",
				'SortKey', 5,
				'Parameters', {
					PlaceObj('PresetParamPercent', {
						'Name', "crouch_ap_modifier",
						'Value', 25,
						'Tag', "<crouch_ap_modifier>%",
					}),
					PlaceObj('PresetParamPercent', {
						'Name', "prone_ap_modifier",
						'Value', 50,
						'Tag', "<prone_ap_modifier>%",
					}),
				},
				'param_bindings', {},
				'object_class', "StatusEffect",
				'unit_reactions', {
					PlaceObj('UnitReaction', {
						Event = "OnCalcMoveModifier",
						Handler = function (self, target, value, action)
							if action.id == "Move" and  target.stance == "Prone" then
								-- only need to return value when modifying it
								return value - self:ResolveValue("prone_ap_modifier")
							end
							
							if action.id == "Move" and  target.stance == "Crouch" then
								-- only need to return value when modifying it
								return value - self:ResolveValue("crouch_ap_modifier")
							end
						end,
						param_bindings = false,
					}),
				},
				'Conditions', {},
				'OnAdded', function (self, obj)
					Msg("UnitAPChanged", obj)
				end,
				'OnRemoved', function (self, obj)
					Msg("UnitAPChanged", obj)
				end,
				'lifetime', "Until End of Turn",
				'RemoveOnEndCombat', true,
			}),
			}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Marksmanship",
			'Id', "Sharpshooter",
			'SortKey', 10,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "bonusAimScoped",
					'Value', 2,
					'Tag', "<bonusAimScoped>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "heavyRifleIncrease",
					'Value', 20,
					'Tag', "<heavyRifleIncrease>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "lightRifleIncrease",
					'Value', 10,
					'Tag', "<lightRifleIncrease>%",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "crouchApreduction",
					'Value', 1,
					'Tag', "<crouchApreduction>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "proneApReduction",
					'Value', 2,
					'Tag', "<proneApReduction>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "minApCost",
					'Value', 4,
					'Tag', "<minApCost>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "additionalAimScoped",
					'Value', 1,
					'Tag', "<additionalAimScoped>",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnModifyCTHModifier",
					Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
						if id == "Aim" 
							and target == attacker
							and (IsKindOfClasses(weapon1, "SniperRifle")
							or IsKindOfClasses(weapon2, "SniperRifle")) then
						
							local bonus = self:ResolveValue("bonusAimScoped")
							data.mod_mul = data.mod_mul + bonus
							data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
							
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcAPCost",
					Handler = function (self, target, current_ap, action, weapon, aim)
						if target.stance == "Standing" or not IsKindOfClasses(weapon, "SniperRifle") then
							return
							elseif target.stance == "Prone" and weapon:IsCumbersome()  then
								local reduction = self:ResolveValue("proneApReduction") * const.Scale.AP
								local minCost = self:ResolveValue("minApCost") * const.Scale.AP
								return Max(minCost, current_ap - reduction)
							else
								local reduction = self:ResolveValue("crouchApreduction") * const.Scale.AP
								local minCost = self:ResolveValue("minApCost") * const.Scale.AP
								return Max(minCost, current_ap - reduction)
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnUnitGetWeaponRange",
					Handler = function (self, target, value, weapon, action)
						if IsKindOfClasses(weapon, "SniperRifle") then
							local maxRange = weapon.WeaponRange
							local bonus = self:ResolveValue("lightRifleIncrease")
							if IsKindOfClasses(weapon, "SniperRifle") and weapon:IsCumbersome() then
								bonus = self:ResolveValue("heavyRifleIncrease")
							end
							maxRange = MulDivRound(maxRange, 100 + bonus, 100)
						--	print(maxRange)
							return maxRange
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcMaxAimActions",
					Handler = function (self, target, value, attacker, attack_target, action, weapon)
						if target == attacker then
							return weapon.MaxAimActions + self:ResolveValue("additionalAimScoped")
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'Modifiers', {},
			'DisplayName', T(723903517349, --[[ModItemCharacterEffectCompositeDef Sharpshooter DisplayName]] "Sharpshooter"),
			'Description', T(272582799925, --[[ModItemCharacterEffectCompositeDef Sharpshooter Description]] "Increased <color EmStyle>Range and Accuracy</color> for <color EmStyle>Sniper Rifles</color> and <color EmStyle>Rifles</color>."),
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/Mini2.dds",
			'Tier', "Gold",
			'Stat', "Marksmanship",
			'StatValue', 90,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "SurvivalInstinct",
			'SortKey', 1000,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "minHp",
					'Value', 25,
					'Tag', "<minHp>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnDamageTaken",
					Handler = function (self, target, attacker, dmg, hit_descr)
						if target ~= attacker then 
							--local maxHp = target:GetInitialMaxHitPoints()
							local minHp = MulDivRound(target:GetInitialMaxHitPoints(), self:ResolveValue("minHp"), 100)
							if target.HitPoints <= minHp then
								target:AddStatusEffect("Heroic")
							end
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(646555090368, --[[ModItemCharacterEffectCompositeDef SurvivalInstinct DisplayName]] "Survival Instinct"),
			'Description', T(453388948844, --[[ModItemCharacterEffectCompositeDef SurvivalInstinct Description]] "Gains <color EmStyle>Heroic</color> when <color EmStyle>HP</color> drops too low."),
			'Icon', "Mod/PerksExpanded/Images/strength.dds",
			'Tier', "Quirk",
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Regen",
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "regenCombat",
					'Value', 5,
					'Tag', "<regenCombat>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "regenExploration",
					'Value', 1,
					'Tag', "<regenExploration>%",
				}),
			},
			'object_class', "CharacterEffect",
			'msg_reactions', {
				PlaceObj('MsgActorReactionEffects', {
					Effects = {
						PlaceObj('ConditionalEffect', {
							'Effects', {
								PlaceObj('ExecuteCode', {
									FuncCode = 'print(obj:GetModifiedMaxHitPoints())\n--obj:RemoveStatusEffect("Wounded", 1)\n--obj.HitPoints = Min(obj.MaxHitPoints, obj.HitPoints + 10)\n--RecalcMaxHitPoints(obj)\n--AdjustWoundsToHP(obj)\n--ObjModified(obj)\n--local amount = 10\n--obj:CallReactions("OnCalcHealAmount", obj, obj, medkit, amount )\n--obj:RestoreHealth(1, "floating_text")\n--obj.HitPoints = Min(obj.MaxHitPoints, obj.HitPoints + amount)\n--obj:CreateDamageFloatingText(self, "oi", "")\nobj:TakeDirectDamage(20, has_visibility and floating_text or false, "short", log_msg)\n--obj.MaxHitPoints = obj.MaxHitPoints + 5\n\nprint(obj.HitPoints)\n -- = Min(obj:GetInitialMaxHitPoints(), obj.HitPoints + 1\n\n\n--CreateFloatingText(obj:GetVisualPos(), { " <Amount> ", Amount = 1}, 4282219161, nil, 500)',
									param_bindings = false,
								}),
							},
						}),
					},
					Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
					param_bindings = false,
				}),
			},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnBeginTurn",
					Handler = function (self, target)
						if target:HasStatusEffect("Bleeding") then
							target:RemoveStatusEffect("Bleeding")
						end
						if target:HasStatusEffect("Downed") then
							target:RemoveStatusEffect("Downed")
							target:RemoveStatusEffect("Unconscious")
							target:AddStatusEffect("Stabilized")
							target:SetCommand("DownedRally")
							target:RemoveStatusEffect("BleedingOut")
						
						end
						local maxHp = target:GetInitialMaxHitPoints()
						local amount = MulDivRound(target:GetInitialMaxHitPoints(), self:ResolveValue("regenCombat"), 100)
						if target.HitPoints <  target:GetInitialMaxHitPoints() then
							target.HitPoints = Min(target:GetInitialMaxHitPoints(), target.HitPoints + amount)
							target:UpdateFXClass()
							--self:FlushCombatCache()
							ObjModified(target)
							CreateFloatingText(target:GetVisualPos(), { "+<Amount> Regen", Amount = amount}, 428634992000, nil, 500)
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnExplorationTick",
					Handler = function (self, target)
						if target:HasStatusEffect("Bleeding") then
							target:RemoveStatusEffect("Bleeding")
						end
						local maxHp = target:GetInitialMaxHitPoints()
						local amount = MulDivRound(target:GetInitialMaxHitPoints(), self:ResolveValue("regenExploration"), 100)
						if target.HitPoints <  target:GetInitialMaxHitPoints() then
							target.HitPoints = Min(target:GetInitialMaxHitPoints(), target.HitPoints + amount)
							target:UpdateFXClass()
							ObjModified(target)
							HealthBar:UpdateBars()
							CreateFloatingText(target:GetVisualPos(), { "+<Amount> Regen", Amount = amount}, 428634992000, nil, 500)
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(331988279960, --[[ModItemCharacterEffectCompositeDef Regen DisplayName]] "Regen"),
			'Description', T(416178841401, --[[ModItemCharacterEffectCompositeDef Regen Description]] "Heals 5% HP each turn in combat."),
			'OnAdded', function (self, obj)  end,
			'OnRemoved', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/restitution.dds",
			'Shown', true,
			'HasFloatingText', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Endurance",
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "reductionPerStack",
					'Value', 10,
					'Tag', "<reductionPerStack>%",
				}),
			},
			'object_class', "CharacterEffect",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcDamageAndEffects",
					Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
						if target == attack_target and target:GetStatusEffect("Wounded") then
							
							local reduction = target:GetStatusEffect("Wounded")
							if reduction.stacks > 0 then
							 local dmgRed = MulDivRound(data.base_damage, (self:ResolveValue("reductionPerStack") * reduction.stacks), 100)
						    data.base_damage = data.base_damage - dmgRed
							data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRed }
							end
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {},
			'DisplayName', T(183918184771, --[[ModItemCharacterEffectCompositeDef Endurance DisplayName]] "Endurance"),
			'Description', T(395886257805, --[[ModItemCharacterEffectCompositeDef Endurance Description]] "Takes less damage if wounded."),
			'OnAdded', function (self, obj)  end,
			'OnRemoved', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/helmet 2.dds",
			'Shown', true,
			'HasFloatingText', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Id', "ShamanArmor",
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "dmgResistance",
					'Value', 5,
					'Tag', "<dmgResistance>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCalcDamageAndEffects",
					Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
						if target == attack_target then  
						    local dmgRes = MulDivRound(data.base_damage, (self:ResolveValue("dmgResistance") * self.stacks), 100)
						    data.base_damage = data.base_damage - dmgRes
							data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(288474843483, --[[ModItemCharacterEffectCompositeDef ShamanArmor DisplayName]] "Shaman Armor"),
			'Description', T(107681507046, --[[ModItemCharacterEffectCompositeDef ShamanArmor Description]] "Immune to Blinded, Choking, Panicked."),
			'OnAdded', function (self, obj)
				obj:AddStatusEffectImmunity("Blinded", self.class)
				obj:AddStatusEffectImmunity("Choking", self.class)
				obj:AddStatusEffectImmunity("Panicked", self.class)
			end,
			'OnRemoved', function (self, obj)
				obj:RemoveStatusEffectImmunity("Blinded", self.class)
				obj:RemoveStatusEffectImmunity("Choking", self.class)
				obj:RemoveStatusEffectImmunity("Panicked", self.class)
			end,
			'Icon', "Mod/PerksExpanded/Images/shield.dds",
			'max_stacks', 3,
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "ExplosiveExpert",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Tag', "<bonus_health>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Handler = function ()
						-- bonus damage with explosives?
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Handler = function ()
						if target == attacker and IsKindOfClasses(weapon, "Grenade") and action.ActionType == "Ranged Attack" then
							attack_target:AddStatusEffect("")
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(522258068160, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert DisplayName]] "Explosive Expert"),
			'Description', T(565028712664, --[[ModItemCharacterEffectCompositeDef ExplosiveExpert Description]] "This merc has Explosives training."),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/fragmentation.dds",
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "AllRounder",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "dmgResistancePerLvl",
					'Value', 1,
					'Tag', "<dmgResistancePerLvl>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "overwatchIncrease",
					'Value', 20,
					'Tag', "<overwatchIncrease>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Value', 20,
					'Tag', "<bonus_health>%",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "bonusAttacks",
					'Value', 1,
					'Tag', "<bonusAttacks>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "meleeBonusPerLevel",
					'Value', 1,
					'Tag', "<meleeBonusPerLevel>",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Handler = function ()
						-- +10 CTH Melee Weapons
						-- +10 CTH Ranged Weapons (Overwatch only)
						-- +20 Max Hit Points
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Handler = function ()
						target.MaxHitPoints = target.MaxHitPoints + 1
						RecalcMaxHitPoints(target)
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcDamageAndEffects",
					Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
						
						if target == attack_target then
							local value = target:GetLevel() * self:ResolveValue("dmgResistancePerLvl")
							if value > 0 then
								local dmgRes = MulDivRound(data.base_damage, value, 100)
						    	data.base_damage = data.base_damage - dmgRes
								data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = dmgRes }
							end
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcChanceToHit",
					Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
						if target == attacker  and action.ActionType == "Melee Attack"  then
							local level = target:GetLevel()
							local value =  self:ResolveValue("meleeBonusPerLevel") * level
							ApplyCthModifier_Add(self, data, value)
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(895146284132, --[[ModItemCharacterEffectCompositeDef AllRounder DisplayName]] "All Rounder"),
			'Description', T(132268296032, --[[ModItemCharacterEffectCompositeDef AllRounder Description]] "This merc is an excellent all-rounder"),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/bulletproof-vest.dds",
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Doctor",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "damageModifier",
					'Value', 50,
					'Tag', "<damageModifier>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Tag', "<bonus_health>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
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
					param_bindings = false,
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
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(987094052058, --[[ModItemCharacterEffectCompositeDef Doctor DisplayName]] "Doctor"),
			'Description', T(705527329903, --[[ModItemCharacterEffectCompositeDef Doctor Description]] "This merc has Medical training."),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/first-aid-kit (1).dds",
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Leader",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "moraleBuff",
					'Value', 1,
					'Tag', "<moraleBuff>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "moraleDebuff",
					'Value', -1,
					'Tag', "<moraleDebuff>",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Tag', "<bonus_health>%",
				}),
			},
			'object_class', "Perk",
			'msg_reactions', {},
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Event = "OnCombatStarting",
					Handler = function (self, target, load_game)
						self:SetParameter("allyGrit", target:GetLevel())
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnBeginTurn",
					Handler = function (self, target)
						-- from MMOcenaries Standalone_ Custom Perks
						
						local target_side = target and target.team and target.team.side or ''
						local target_pos = target:GetPos() or false
						local allycount = 0
						local squad = gv_Squads[target.Squad]
						local level = target:GetLevel()
						
						for _, id in ipairs(squad.units) do
							local unit = g_Units[id]
							if unit ~= target then
								local side = unit and unit.team and unit.team.side or ''
								if target_side ~= '' and side == target_side then
									local unit_pos = unit:GetPos() or false
									if target_pos and unit_pos then
										local dist = target_pos:Dist(unit_pos)
										if dist <= level * const.SlabSizeX then
											--allycount = allycount +1
											--print(unit)
											unit:AddStatusEffect("LeaderAuraBuff")
										end
									end
								end
							end
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(788341325420, --[[ModItemCharacterEffectCompositeDef Leader DisplayName]] "Leader"),
			'Description', T(819229546378, --[[ModItemCharacterEffectCompositeDef Leader Description]] "This merc has high Leadership."),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)
				obj:AddStatusEffectImmunity("Panicked", self.class)
				obj:AddStatusEffectImmunity("Berserk", self.class)
			end,
			'OnRemoved', function (self, obj)
				obj:RemoveStatusEffectImmunity("Panicked", self.class)
				obj:AddStatusEffectImmunity("Berserk", self.class)
			end,
			'Icon', "Mod/PerksExpanded/Images/napoleon.dds",
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Marksman",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamNumber', {
					'Name', "bonusCthPerLvl",
					'Value', 1,
					'Tag', "<bonusCthPerLvl>",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bonusDmgPerLvl",
					'Value', 1,
					'Tag', "<bonusDmgPerLvl>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Value', 1,
					'Tag', "<bonus_health>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Handler = function ()
						-- a little bit of CTH with long range weapons
						-- maybe a little bit of damage
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcDamageAndEffects",
					Handler = function (self, target, attacker, attack_target, action, weapon, attack_args, hit, data)
						if target == attacker then
							local level = target:GetLevel()
							local bonus = level * self:ResolveValue("bonusDmgPerLvl")
							data.base_damage = data.base_damage + MulDivRound(data.base_damage, bonus, 100)
							data.breakdown[#data.breakdown + 1] = { name = self.DisplayName, value = bonus }
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('UnitReaction', {
					Event = "OnCalcChanceToHit",
					Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
						if target == attacker  then
							local level = target:GetLevel()
							local value =  self:ResolveValue("bonusCthPerLvl") * level
							ApplyCthModifier_Add(self, data, value)
						end
					end,
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(561149855915, --[[ModItemCharacterEffectCompositeDef Marksman DisplayName]] "Marksman"),
			'Description', T(480072152315, --[[ModItemCharacterEffectCompositeDef Marksman Description]] "This merc has Marksmanship training."),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/rifle 2.dds",
			'Shown', true,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Quirk",
			'Id', "Mechanic",
			'SortKey', 100,
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "bonus_health",
					'Tag', "<bonus_health>%",
				}),
			},
			'object_class', "Perk",
			'unit_reactions', {
				PlaceObj('UnitReaction', {
					Handler = function ()
						-- extra damage to armored targets with shotguns
						-- extra damage to armor whit shotguns
					end,
					param_bindings = false,
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
					param_bindings = false,
				}),
			},
			'Conditions', {
				PlaceObj('CheckGameRule', {
					Rule = "AdditionalPerks",
					param_bindings = false,
				}),
			},
			'DisplayName', T(491292644190, --[[ModItemCharacterEffectCompositeDef Mechanic DisplayName]] "Mechanic"),
			'Description', T(872843632761, --[[ModItemCharacterEffectCompositeDef Mechanic Description]] "This merc has Mechanical training."),
			'AddEffectText', "",
			'RemoveEffectText', "",
			'OnAdded', function (self, obj)  end,
			'Icon', "Mod/PerksExpanded/Images/wrench.dds",
			'Shown', true,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "AdditionalPerks",
	}, {
		PlaceObj('ModItemChangeProp', {
			'name', "Barry",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Barry",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Blood",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Blood",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "BunsPerks",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Buns",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Sharpshooter",
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "DrQ",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "DrQ",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Doctor",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Fauda",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Fauda",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Fidel",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Fidel",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Flay",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Flay",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Fox",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Fox",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Doctor",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Grizzly",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Grizzly",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Grunty",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Grunty",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Gus",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Gus",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Hitman",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Hitman",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Ice",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Ice",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Igor",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Igor",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Ivan",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Ivan",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Kalyna",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Kalyna",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Mechanic",
				"Sharpshooter",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Larry",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Larry",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Larry_clean",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Larry_Clean",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Len",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Len",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Livewire",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Livewire",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Mechanic",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "MD",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "MD",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Doctor",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Magic",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Magic",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Mechanic",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Meltdown",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Meltdown",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Mouse",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Mouse",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Nails",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Nails",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Omryn",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Omryn",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Pierre",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Pierre",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "PierreMerc",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "PierreMerc",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Raider",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Raider",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Raven",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Raven",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Reaper",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Reaper",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Sharpshooter",
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Red",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Red",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"ExplosiveExpert",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Scope",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Scope",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
				"Sharpshooter",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Scully",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Scully",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Shadow",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Shadow",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
				"Sharpshooter",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Sidney",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Sidney",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Smiley",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Smiley",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "SmileyNPC",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "SmileyNPC",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "TheMajor",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "TheMajor",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Spike",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Spike",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Leader",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Steroid",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Steroid",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Mechanic",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Thor",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Thor",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Doctor",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Tex",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Tex",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Marksman",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Vicki",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Vicki",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"Mechanic",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "Wolf",
			'TargetClass', "UnitDataCompositeDef",
			'TargetId', "Wolf",
			'TargetProp', "StartingPerks",
			'EditType', "Append To Table",
			'TargetValue', {
				"AllRounder",
			},
		}),
		PlaceObj('ModItemChangeProp', {
			'name', "ChangeProperty",
			'TargetClass', "CombatAction",
			'TargetId', "InnerInfo",
			'TargetProp', "Icon",
			'TargetValue', "Mod/PerksExpanded/Images/hacker54 2.dds",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "UI",
	}, {
		PlaceObj('ModItemXTemplate', {
			Comment = "character sheet",
			RequireActionSortKeys = true,
			__is_kind_of = "XWindow",
			group = "Zulu PDA",
			id = "PDAAimEvaluation",
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return gv_UnitData[GetPlayerMercSquads()[1].units[1]] end,
				'__class', "PDAAIMEvaluation",
				'MouseCursor', "UI/Cursors/Pda_Cursor.tga",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self:ResolveId("idContent"):SetContext(context)
				end,
				'InitialMode', "record",
				'InternalModes', "record, perks",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
						PDAAIMEvaluation.Open(self,...)
						AddPageToBrowserHistory("evaluation")
					end,
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "background frame",
					'__class', "XImage",
					'IdNode', false,
					'Image', "UI/PDA/pda_background",
					'ImageFit', "stretch",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "window",
						'Margins', box(44, 18, 44, 18),
						'HAlign', "center",
						'VAlign', "center",
						'MinWidth', 1660,
						'MinHeight', 830,
						'MaxWidth', 1660,
						'MaxHeight', 830,
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'IdNode', false,
							'Dock', "top",
							'MinHeight', 32,
							'MaxHeight', 32,
							'Image', "UI/PDA/os_header",
							'FrameBox', box(3, 5, 3, 5),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(12, 0, 0, 0),
								'HAlign', "left",
								'VAlign', "center",
								'TextStyle', "PDABrowserTitle",
								'Translate', true,
								'Text', T(740361438846, --[[ModItemXTemplate PDAAimEvaluation Text]] "A.I.M. EVALUATION"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(0, 0, 15, 0),
								'HAlign', "right",
								'VAlign', "bottom",
								'TextStyle', "PDABrowserTitleSmall",
								'Translate', true,
								'Text', T(517832906256, --[[ModItemXTemplate PDAAimEvaluation Text]] "v.1.1B"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'IdNode', false,
							'Padding', box(16, 14, 16, 4),
							'Dock', "box",
							'MinHeight', 798,
							'MaxHeight', 798,
							'Image', "UI/PDA/os_background",
							'FrameBox', box(3, 3, 3, 3),
						}, {
							PlaceObj('XTemplateWindow', {
								'comment', "content",
								'__class', "XContentTemplate",
								'Id', "idContent",
								'IdNode', false,
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'Margins', box(0, 4, 0, 0),
									'Dock', "bottom",
									'MinHeight', 52,
									'LayoutMethod', "HList",
								}, {
									PlaceObj('XTemplateWindow', {
										'VAlign', "center",
										'MinWidth', 610,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__condition', function (parent, context) return not InitialConflictNotStarted() end,
											'__template', "PDAStartButton",
											'Margins', box(0, 0, 0, 0),
											'Dock', "left",
											'VAlign', "center",
											'MinWidth', 200,
										}, {
											PlaceObj('XTemplateFunc', {
												'name', "SetOutsideScale(self, scale)",
												'func', function (self, scale)
													local dlg = GetDialog("PDADialog")
													local screen = dlg.idPDAScreen
													XWindow.SetOutsideScale(self, screen.scale)
												end,
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'Dock', "right",
											'LayoutMethod', "HList",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'Margins', box(8, 0, 16, -2),
												'Padding', box(0, 0, 0, 0),
												'TextStyle', "PDABrowserFlavor",
												'Translate', true,
												'Text', T(870070173593, --[[ModItemXTemplate PDAAimEvaluation Text]] "Secured connection"),
												'TextVAlign', "center",
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XImage",
												'Image', "UI/PDA/Quest/secured",
											}),
											}),
										}),
									PlaceObj('XTemplateWindow', {
										'__class', "XToolBarList",
										'Id', "idLevelUpBar",
										'IdNode', false,
										'Dock', "box",
										'HAlign', "center",
										'VAlign', "center",
										'MinHeight', 48,
										'Background', RGBA(255, 255, 255, 0),
										'Toolbar', "LevelUpBar",
										'ButtonTemplate', "PDACommonButton",
									}, {
										PlaceObj('XTemplateAction', {
											'comment', "same as perk different condition",
											'ActionId', "idLevelUpAction",
											'ActionSortKey', "1000",
											'ActionName', T(425396481502, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "LEVEL UP"),
											'ActionToolbar', "LevelUpBar",
											'ActionShortcut', "L",
											'ActionGamepad', "ButtonX",
											'ActionButtonTemplate', "PDACommonButtonOrange",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												local context = host:GetContext()
												
												if dlg:GetMode() == "record" and context.perkPoints > 0 then
													return "enabled"
												else
													return "hidden"
												end
											end,
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												dlg:SetMode("perks")
											end,
											'FXMouseIn', "buttonRollover",
											'FXPress', "buttonPressGeneric",
											'FXPressDisabled', "IactDisabled",
										}),
										}),
									PlaceObj('XTemplateWindow', {
										'__class', "XToolBarList",
										'Id', "idToolBar",
										'IdNode', false,
										'Dock', "right",
										'HAlign', "right",
										'VAlign', "center",
										'LayoutHSpacing', 16,
										'Background', RGBA(255, 255, 255, 0),
										'Toolbar', "ActionBar",
										'ButtonTemplate', "PDACommonButton",
									}, {
										PlaceObj('XTemplateAction', {
											'ActionId', "idPerksAction",
											'ActionSortKey', "1010",
											'ActionName', T(839725079322, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Perks"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "P",
											'ActionGamepad', "ButtonX",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												local context = host:GetContext()
												
												if dlg:GetMode() == "record" and context.perkPoints <= 0 then
													return "enabled"
												else
													return "hidden"
												end
											end,
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												dlg:SetMode("perks")
											end,
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idPerksConfirmAction",
											'ActionSortKey', "1020",
											'ActionName', T(904665887385, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Confirm"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "P",
											'ActionGamepad', "Start",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												local context = host:GetContext()
												if dlg:GetMode() == "perks" and context.perkPoints > 0 then
													local perksDlg = dlg:ResolveValue("idPerks")
													if perksDlg and perksDlg.SelectedPerkIds and #perksDlg.SelectedPerkIds > 0 then
														return "enabled"
													else
														return "disabled"
													end
												else
													return "hidden"
												end
											end,
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												local perksDlg = dlg:ResolveValue("idPerks")
												perksDlg:ConfirmPerks()
											end,
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idPreviousMerc",
											'ActionSortKey', "1030",
											'ActionName', T(804690265848, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Previous"),
											'ActionShortcut', "Shift-Tab",
											'ActionGamepad', "LeftShoulder",
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												dlg:SelectPrevMerc()
											end,
											'FXMouseIn', "activityButtonHover_GatherIntel",
											'FXPress', "activityButtonPress_GatherIntel",
											'FXPressDisabled', "activityButtonDisabled_GatherIntel",
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idNextMerc",
											'ActionSortKey', "1040",
											'ActionName', T(431562419109, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Next"),
											'ActionShortcut', "Tab",
											'ActionGamepad', "RightShoulder",
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												dlg:SelectNextMerc()
											end,
											'FXMouseIn', "activityButtonHover_GatherIntel",
											'FXPress', "activityButtonPress_GatherIntel",
											'FXPressDisabled', "activityButtonDisabled_GatherIntel",
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idStatsAction",
											'ActionSortKey', "1050",
											'ActionName', T(527280466875, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Stats"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "S",
											'ActionGamepad', "ButtonX",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												return dlg:GetMode() == "perks" and "enabled" or "hidden"
											end,
											'OnAction', function (self, host, source, ...)
												local dlg = GetDialog(host)
												dlg:SetMode("record")
											end,
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idMercsAction",
											'ActionSortKey', "1060",
											'ActionName', T(400501945987, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Mercs"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "M",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												return "enabled" ---dlg:GetMode() == "record" and "enabled" or "hidden"
											end,
											'OnAction', function (self, host, source, ...)
												local popupHost = GetDialog("PDADialog")
												popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")
												local mercsWindow = XTemplateSpawn("PDAMercProfiles", popupHost, {})
												mercsWindow:Open()
												mercsWindow:SetSelectedMercId(host:GetContext().session_id)
											end,
											'__condition', function (parent, context) return false end,
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idCloseActionPerks",
											'ActionSortKey', "1070",
											'ActionName', T(463279934124, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Close"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "Escape",
											'ActionGamepad', "ButtonB",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												return dlg:GetMode() == "perks" and "enabled" or "hidden"
											end,
											'OnAction', function (self, host, source, ...)
												CreateRealTimeThread(function()
													if host:GetMode() == "perks" then
														local perksDlg = host:ResolveId("idPerks")
														if perksDlg.SelectedPerkIds and #perksDlg.SelectedPerkIds > 0 then
															local popupHost = GetDialog("PDADialog")
															popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")
															
															local trainPerks = CreateQuestionBox(
																popupHost,
																T(326274240975, "New Perks"),
																T(615284649013, "Do you want to learn the perks you've selected?"),
																T(814633909510, "Confirm"),
																T(6879, "Cancel")
															)
																
															local resp = trainPerks:Wait()
															if resp == "ok" then
																perksDlg:ConfirmPerks()
															end
														end
													end
													local pda = GetDialog("PDADialog")
													pda:CloseAction(host)
													return
												end)
											end,
											'FXMouseIn', "buttonRollover",
											'FXPress', "buttonPress",
											'FXPressDisabled', "IactDisabled",
										}),
										PlaceObj('XTemplateAction', {
											'ActionId', "idCloseActionRecord",
											'ActionSortKey', "1080",
											'ActionName', T(511618496462, --[[ModItemXTemplate PDAAimEvaluation ActionName]] "Close"),
											'ActionToolbar', "ActionBar",
											'ActionShortcut', "Escape",
											'ActionGamepad', "ButtonB",
											'ActionState', function (self, host)
												local dlg = GetDialog(host)
												return dlg:GetMode() == "record" and "enabled" or "hidden"
											end,
											'OnAction', function (self, host, source, ...)
												local pda = GetDialog("PDADialog")
												pda:CloseAction(host)
											end,
										}),
										}),
									}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idToggleHistoryAndStats",
									'ActionSortKey', "1090",
									'ActionGamepad', "DPadLeft",
									'ActionState', function (self, host)
										local dlg = GetDialog(host)
										
										return dlg:GetMode() == "record" and "enabled" or "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										local dlg = GetDialog(host)
										local recordDlg = dlg.idRecord
										if not recordDlg then return end
										if recordDlg:GetMode() == "history" then
											recordDlg:SetMode("stats")
										else
											recordDlg:SetMode("history")
										end
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idToggleHistoryAndStatsAlt",
									'ActionSortKey', "1091",
									'ActionGamepad', "DPadRight",
									'ActionState', function (self, host)
										local dlg = GetDialog(host)
										
										return dlg:GetMode() == "record" and "enabled" or "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										local dlg = GetDialog(host)
										local recordDlg = dlg.idRecord
										if not recordDlg then return end
										if recordDlg:GetMode() == "history" then
											recordDlg:SetMode("stats")
										else
											recordDlg:SetMode("history")
										end
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idEnlargeMercImage",
									'ActionSortKey', "1100",
									'ActionGamepad', "RightThumbClick",
									'ActionState', function (self, host)
										local dlg = GetDialog(host)
										
										return dlg:GetMode() == "record" and "enabled" or "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										local dlg = GetDialog(host)
										local imageButton = dlg.idMercImageBigButton
										if imageButton then
											imageButton:OnPress()
										end
									end,
								}),
								PlaceObj('XTemplateWindow', {
									'comment', "main",
									'Dock', "top",
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "attributes",
										'__class', "XFrame",
										'IdNode', false,
										'Padding', box(22, 6, 22, 12),
										'Dock', "left",
										'MinWidth', 610,
										'MaxWidth', 610,
										'Image', "UI/PDA/os_background",
										'FrameBox', box(3, 3, 3, 3),
									}, {
										PlaceObj('XTemplateWindow', {
											'comment', "header",
											'Padding', box(0, 4, 0, 4),
											'Dock', "top",
											'MinHeight', 85,
											'MaxHeight', 85,
											'LayoutMethod', "HList",
										}, {
											PlaceObj('XTemplateTemplate', {
												'comment', "prev",
												'__template', "PDASmallButton",
												'IdNode', false,
												'Margins', box(0, 0, 8, 0),
												'Dock', "left",
												'HAlign', "left",
												'MinWidth', 24,
												'MaxWidth', 24,
												'ScaleModifier', point(1000, 1000),
												'FXMouseIn', "",
												'FXPress', "",
												'FXPressDisabled', "",
												'OnPress', function (self, gamepad)
													local dlg = GetDialog(self)
													local previousAction = dlg:ActionById("idPreviousMerc")
													dlg:OnAction(previousAction)
												end,
												'FrameBox', box(3, 3, 3, 3),
												'FlipX', true,
												'CenterImage', "UI/PDA/T_Icon_Play",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "gamepad hint",
													'__context', function (parent, context) return "GamepadUIStyleChanged" end,
													'__class', "XText",
													'Margins', box(-5, -5, 0, 0),
													'Clip', false,
													'UseClipBox', false,
													'ContextUpdateOnOpen', true,
													'OnContextUpdate', function (self, context, ...)
														self:SetVisible(GetUIStyleGamepad())
														XText.OnContextUpdate(self, context, ...)
													end,
													'Translate', true,
													'Text', T(944665724965, --[[ModItemXTemplate PDAAimEvaluation Text]] "<image UI/DesktopGamepad/LB.tga>"),
												}),
												}),
											PlaceObj('XTemplateWindow', {
												'comment', "class icon",
												'__class', "XContextImage",
												'Margins', box(2, 2, 2, 2),
												'Dock', "left",
												'HAlign', "left",
												'VAlign', "center",
												'MinWidth', 50,
												'MinHeight', 50,
												'MaxWidth', 50,
												'MaxHeight', 50,
												'ImageFit', "smallest",
												'ImageColor', RGBA(230, 222, 202, 255),
												'ContextUpdateOnOpen', true,
												'OnContextUpdate', function (self, context, ...)
													self:SetImage(GetMercSpecIcon(context))
												end,
											}),
											PlaceObj('XTemplateWindow', {
												'Dock', "left",
												'LayoutMethod', "VList",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "name",
													'__class', "XText",
													'Margins', box(0, 6, 0, 0),
													'TextStyle', "MercNameEvaluation",
													'Translate', true,
													'Text', T(928792201804, --[[ModItemXTemplate PDAAimEvaluation Text]] "<Name>"),
												}),
												PlaceObj('XTemplateWindow', {
													'Margins', box(0, -6, 0, 0),
													'LayoutMethod', "HList",
												}, {
													PlaceObj('XTemplateWindow', {
														'comment', "class info",
														'__class', "XText",
														'TextStyle', "PDABrowserSubtitleLight",
														'Translate', true,
													}),
													PlaceObj('XTemplateWindow', {
														'comment', "class info",
														'__condition', function (parent, context) return GetMercCurrentDailySalary(context.session_id) > 0 end,
														'__class', "XText",
														'TextStyle', "PDABrowserSubtitle",
														'Translate', true,
														'Text', T(592822204153, --[[ModItemXTemplate PDAAimEvaluation Text]] "/ Daily Salary"),
													}),
													PlaceObj('XTemplateWindow', {
														'comment', "class info",
														'__condition', function (parent, context) return GetMercCurrentDailySalary(context.session_id) > 0 end,
														'__class', "XText",
														'TextStyle', "PDABrowserSubtitleLight",
														'ContextUpdateOnOpen', true,
														'OnContextUpdate', function (self, context, ...)
															local salary = GetMercCurrentDailySalary(context.session_id)
															local text = T{418564557177, "<money(salary)>", salary = salary}
															self:SetText(text)
														end,
														'Translate', true,
													}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'comment', "level",
												'ZOrder', 10,
												'Dock', "right",
												'HAlign', "center",
												'LayoutMethod', "VList",
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XText",
													'Padding', box(0, 0, 0, 0),
													'HAlign', "center",
													'VAlign', "center",
													'TextStyle', "PDABrowserPoints",
													'ContextUpdateOnOpen', true,
													'Translate', true,
													'Text', T(540474884020, --[[ModItemXTemplate PDAAimEvaluation Text]] "<MercLevel()>"),
												}),
												PlaceObj('XTemplateWindow', {
													'__class', "XText",
													'Margins', box(0, -10, 0, 0),
													'Padding', box(0, 0, 0, 0),
													'HAlign', "center",
													'VAlign', "center",
													'TextStyle', "PDABrowserSubtitle",
													'Translate', true,
													'Text', T(809331021407, --[[ModItemXTemplate PDAAimEvaluation Text]] "LEVEL"),
												}),
												}),
											PlaceObj('XTemplateTemplate', {
												'comment', "next",
												'__template', "PDASmallButton",
												'IdNode', false,
												'Margins', box(8, 0, 0, 0),
												'Dock', "right",
												'HAlign', "center",
												'MinWidth', 24,
												'MaxWidth', 24,
												'ScaleModifier', point(1000, 1000),
												'FXMouseIn', "",
												'FXPress', "",
												'FXPressDisabled', "",
												'OnPress', function (self, gamepad)
													local dlg = GetDialog(self)
													local nextAction = dlg:ActionById("idNextMerc")
													dlg:OnAction(nextAction)
												end,
												'FrameBox', box(3, 3, 3, 3),
												'CenterImage', "UI/PDA/T_Icon_Play",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "gamepad hint",
													'__context', function (parent, context) return "GamepadUIStyleChanged" end,
													'__class', "XText",
													'Margins', box(-5, -5, 0, 0),
													'Clip', false,
													'UseClipBox', false,
													'ContextUpdateOnOpen', true,
													'OnContextUpdate', function (self, context, ...)
														self:SetVisible(GetUIStyleGamepad())
														XText.OnContextUpdate(self, context, ...)
													end,
													'Translate', true,
													'Text', T(743950779574, --[[ModItemXTemplate PDAAimEvaluation Text]] "<image UI/DesktopGamepad/RB.tga>"),
												}),
												}),
											}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'Dock', "top",
											'Image', "UI/PDA/separate_line_vertical",
											'FrameBox', box(3, 3, 3, 3),
											'SqueezeY', false,
										}),
										PlaceObj('XTemplateWindow', {
											'comment', "current status",
											'__class', "XText",
											'Dock', "top",
											'MinHeight', 47,
											'MaxHeight', 47,
											'TextStyle', "PDABrowserTextLight",
											'ContextUpdateOnOpen', true,
											'OnContextUpdate', function (self, context, ...)
												local sectorId = gv_Squads[context.Squad].CurrentSector
												local sector = gv_Sectors[sectorId]
												
												local text
												if sector.conflict then
													text = T{903359955315, "Engaged in conflict in sector <SectorId(sectorId)>.", sectorId = sectorId}
												else
													local operation = SectorOperations[context.Operation]
													if operation.id == "Arriving" or operation.id == "Traveling" then
														text = T{889510996961, "<activity>.", activity = operation.display_name}
													elseif operation.id == "Idle" then
														text = T{812039502354, "<activity> in sector <SectorId(sectorId)>.", activity = operation.display_name, sectorId = sectorId}
													else
														local profession = table.find_value(operation.Professions, "id", context.OperationProfession )
														text = T{748263789018, "<profession> in sector <SectorId(sectorId)>.", profession = profession.display_name, sectorId = sectorId}
													end
												end
												
												local wounds = context:GetStatusEffect("Wounded")
												if wounds then
													text = text .. T{195711054730, "Has <wounds> wound(s).", wounds = wounds.stacks}
												end
												
												if context.Tiredness ~= 0 then
													local effect = UnitTirednessEffect[context.Tiredness]
													text = text .. T{620948893123, " <tiredness>.", tiredness = CharacterEffectDefs[effect].DisplayName}
												end
												
												self:SetText(text)
												
												local limit = self.UpdateTimeLimit
												if limit == 0 or (RealTime() - self.last_update_time) >= limit then
													self:SetText(self.Text)
												elseif not self:GetThread("ContextUpdate") then
													self:CreateThread("ContextUpdate", function(self)
														Sleep(self.last_update_time + self.UpdateTimeLimit - RealTime())
														self:OnContextUpdate()
													end, self)
												end
											end,
											'Translate', true,
											'TextVAlign', "center",
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'Dock', "top",
											'Image', "UI/PDA/separate_line_vertical",
											'FrameBox', box(3, 3, 3, 3),
											'SqueezeY', false,
										}),
										PlaceObj('XTemplateWindow', {
											'comment', "stat bars",
											'Dock', "top",
											'MinHeight', 256,
											'MaxHeight', 256,
											'LayoutMethod', "Grid",
											'UniformColumnWidth', true,
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'Margins', box(0, 0, 0, 8),
												'Dock', "top",
												'TextStyle', "PDABrowserHeader",
												'Translate', true,
												'Text', T(857078876771, --[[ModItemXTemplate PDAAimEvaluation Text]] "Stats"),
											}),
											PlaceObj('XTemplateWindow', {
												'comment', "attributes",
												'Margins', box(3, 0, 0, 0),
												'LayoutMethod', "VList",
												'LayoutVSpacing', -3,
											}, {
												PlaceObj('XTemplateForEach', {
													'array', function (parent, context) return UnitPropertiesStats:GetAttributes() end,
													'run_after', function (child, context, item, i, n, last)
														child:SetAttribute(item.id)
													end,
												}, {
													PlaceObj('XTemplateTemplate', {
														'__template', "PDAAttributeBar",
														'HAlign', "left",
													}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'comment', "skills",
												'Margins', box(0, 5, 0, 0),
												'Padding', box(18, 0, 0, 0),
												'GridX', 2,
												'LayoutMethod', "VList",
												'LayoutVSpacing', -3,
											}, {
												PlaceObj('XTemplateForEach', {
													'array', function (parent, context) return UnitPropertiesStats:GetSkills() end,
													'run_after', function (child, context, item, i, n, last)
														child:SetAttribute(item.id)
													end,
												}, {
													PlaceObj('XTemplateTemplate', {
														'__template', "PDAAttributeBar",
													}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'Margins', box(0, 5, -5, 10),
												'HAlign', "right",
												'MinWidth', 2,
												'MaxWidth', 2,
												'GridStretchX', false,
												'Image', "UI/PDA/separate_line",
												'FrameBox', box(3, 3, 3, 3),
												'SqueezeX', false,
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'Dock', "top",
											'Image', "UI/PDA/separate_line_vertical",
											'FrameBox', box(3, 3, 3, 3),
											'SqueezeY', false,
										}),
										PlaceObj('XTemplateWindow', {
											'comment', "personal perks",
											'__condition', function (parent, context) return IsImpUnit(context) end,
											'Dock', "top",
											'MaxWidth', 610,
											'MaxHeight', 128,
											'LayoutMethod', "Grid",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XScrollArea",
												'Padding', box(0, 0, 4, 0),
												'Dock', "left",
												'MaxWidth', 240,
												'GridStretchX', false,
												'HScroll', "idScrollTalent",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "talent",
													'LayoutMethod', "VList",
												}, {
													PlaceObj('XTemplateWindow', {
														'__class', "XText",
														'Margins', box(0, 4, 0, 4),
														'TextStyle', "PDABrowserNameSmall",
														'Translate', true,
														'Text', T(944281539726, --[[ModItemXTemplate PDAAimEvaluation Text]] "Talent"),
													}),
													PlaceObj('XTemplateWindow', {
														'Margins', box(0, 0, 8, 4),
														'LayoutMethod', "HList",
														'LayoutHSpacing', 8,
														'LayoutVSpacing', 8,
													}, {
														PlaceObj('XTemplateForEach', {
															'array', function (parent, context) return context:GetPerks(nil, "sort") end,
															'condition', function (parent, context, item, i) return item.Tier == "Personal" end,
															'run_after', function (child, context, item, i, n, last)
																child:SetPerkId(item.class)
															end,
														}, {
															PlaceObj('XTemplateTemplate', {
																'__template', "PDAPerk",
															}),
															}),
														}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'__class', "MessengerScrollbar",
												'Id', "idScrollTalent",
												'Dock', "top",
												'Visible', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'Margins', box(4, 4, 4, 4),
												'GridX', 2,
												'GridStretchX', false,
												'Visible', false,
												'Image', "UI/PDA/separate_line",
												'FrameBox', box(3, 3, 3, 3),
												'SqueezeX', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'Margins', box(34, 4, 24, 4),
												'MinWidth', 1,
												'MaxWidth', 1,
												'GridX', 3,
												'Image', "UI/PDA/separate_line",
												'FrameBox', box(3, 3, 3, 3),
												'SqueezeX', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'Margins', box(4, 4, 4, 4),
												'GridX', 4,
												'GridStretchX', false,
												'Visible', false,
												'Image', "UI/PDA/separate_line",
												'FrameBox', box(3, 3, 3, 3),
												'SqueezeX', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XScrollArea",
												'Padding', box(4, 0, 0, 0),
												'Dock', "right",
												'MaxWidth', 240,
												'GridX', 5,
												'GridStretchX', false,
												'HScroll', "idScrollTraits",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "traits",
													'Margins', box(0, 0, 8, 4),
													'LayoutMethod', "VList",
												}, {
													PlaceObj('XTemplateWindow', {
														'__class', "XText",
														'Margins', box(0, 4, 0, 4),
														'TextStyle', "PDABrowserNameSmall",
														'Translate', true,
														'Text', T(676936347467, --[[ModItemXTemplate PDAAimEvaluation Text]] "Traits"),
													}),
													PlaceObj('XTemplateWindow', {
														'LayoutMethod', "HList",
														'LayoutHSpacing', 8,
														'LayoutVSpacing', 8,
													}, {
														PlaceObj('XTemplateForEach', {
															'array', function (parent, context) return context:GetPerks(nil, "sort") end,
															'condition', function (parent, context, item, i) return not item:IsLevelUp() and item.Tier ~= "Personal" end,
															'run_after', function (child, context, item, i, n, last)
																child:SetPerkId(item.class)
															end,
														}, {
															PlaceObj('XTemplateTemplate', {
																'__template', "PDAPerk",
															}),
															}),
														}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'__class', "MessengerScrollbar",
												'Id', "idScrollTraits",
												'Dock', "top",
												'GridX', 3,
												'Visible', false,
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'comment', "personal perks",
											'__condition', function (parent, context) return not IsImpUnit(context) end,
											'Dock', "top",
											'MaxHeight', 128,
											'LayoutMethod', "HList",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "MessengerScrollbar",
												'Id', "idScrollTalent",
												'Dock', "top",
												'Visible', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XScrollArea",
												'HScroll', "idScrollTalent",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "talent",
													'LayoutMethod', "VList",
												}, {
													PlaceObj('XTemplateWindow', {
														'__class', "XText",
														'Margins', box(0, 4, 0, 4),
														'TextStyle', "PDABrowserNameSmall",
														'Translate', true,
														'Text', T(142627416582, --[[ModItemXTemplate PDAAimEvaluation Text]] "Talent"),
													}),
													PlaceObj('XTemplateWindow', {
														'Margins', box(0, 0, 8, 4),
														'LayoutMethod', "HList",
														'LayoutHSpacing', 8,
														'LayoutVSpacing', 8,
													}, {
														PlaceObj('XTemplateForEach', {
															'array', function (parent, context) return context:GetPerks(nil, "sort") end,
															'condition', function (parent, context, item, i) return item.Tier == "Personal" end,
															'run_after', function (child, context, item, i, n, last)
																child:SetPerkId(item.class)
															end,
														}, {
															PlaceObj('XTemplateTemplate', {
																'__template', "PDAPerk",
															}),
															}),
														}),
													}),
												}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'Margins', box(0, 4, 8, 4),
												'Image', "UI/PDA/separate_line",
												'FrameBox', box(3, 3, 3, 3),
												'SqueezeX', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "MessengerScrollbar",
												'Id', "idScrollTraits",
												'Dock', "top",
												'Visible', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XScrollArea",
												'HScroll', "idScrollTraits",
											}, {
												PlaceObj('XTemplateWindow', {
													'comment', "traits",
													'Margins', box(0, 0, 8, 4),
													'LayoutMethod', "VList",
												}, {
													PlaceObj('XTemplateWindow', {
														'__class', "XText",
														'Margins', box(0, 4, 0, 4),
														'TextStyle', "PDABrowserNameSmall",
														'Translate', true,
														'Text', T(825411603553, --[[ModItemXTemplate PDAAimEvaluation Text]] "Traits"),
													}),
													PlaceObj('XTemplateWindow', {
														'LayoutMethod', "HList",
														'LayoutHSpacing', 8,
														'LayoutVSpacing', 8,
													}, {
														PlaceObj('XTemplateForEach', {
															'array', function (parent, context) return context:GetPerks(nil, "sort") end,
															'condition', function (parent, context, item, i) return not item:IsLevelUp() and item.Tier ~= "Personal" end,
															'run_after', function (child, context, item, i, n, last)
																child:SetPerkId(item.class)
															end,
														}, {
															PlaceObj('XTemplateTemplate', {
																'__template', "PDAPerk",
															}),
															}),
														}),
													}),
												}),
											}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'Dock', "top",
											'Image', "UI/PDA/separate_line_vertical",
											'FrameBox', box(3, 3, 3, 3),
											'SqueezeY', false,
										}),
										PlaceObj('XTemplateWindow', {
											'comment', "general perks",
											'Dock', "top",
											'LayoutMethod', "VList",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'TextStyle', "PDABrowserNameSmall",
												'Translate', true,
												'Text', T(727311768832, --[[ModItemXTemplate PDAAimEvaluation Text]] "Perks"),
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "MessengerScrollbar",
												'Id', "idScrollGeneral",
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XScrollArea",
												'MaxHeight', 140,
												'VScroll', "idScrollGeneral",
											}, {
												PlaceObj('XTemplateWindow', {
													'LayoutMethod', "HWrap",
													'LayoutHSpacing', 8,
													'LayoutVSpacing', 8,
												}, {
													PlaceObj('XTemplateForEach', {
														'array', function (parent, context) return context:GetPerks(nil, "sort") end,
														'condition', function (parent, context, item, i) return item:IsLevelUp() end,
														'run_after', function (child, context, item, i, n, last)
															child:SetPerkId(item.class)
														end,
													}, {
														PlaceObj('XTemplateTemplate', {
															'__template', "PDAPerk",
														}),
														}),
													}),
												}),
											}),
										}),
									PlaceObj('XTemplateMode', {
										'mode', "record",
									}, {
										PlaceObj('XTemplateWindow', {
											'comment', "image",
											'__class', "XFrame",
											'IdNode', false,
											'Margins', box(16, 0, 16, 0),
											'Dock', "left",
											'MinWidth', 376,
											'MaxWidth', 376,
											'Image', "UI/PDA/os_background_2",
											'FrameBox', box(3, 3, 3, 3),
										}, {
											PlaceObj('XTemplateTemplate', {
												'__template', "PDACommonButton",
												'Id', "idMercImageBigButton",
												'Margins', box(16, 0, 0, 16),
												'Padding', box(2, 2, 2, 2),
												'Dock', "box",
												'HAlign', "left",
												'VAlign', "bottom",
												'MinWidth', 24,
												'MinHeight', 24,
												'MaxWidth', 24,
												'MaxHeight', 24,
												'OnPress', function (self, gamepad)
													local popupHost = GetDialog("PDADialog")
													popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")
													
													local mercWindow = XTemplateSpawn("PDAMercImageInspect", popupHost, self:GetContext())
													mercWindow:Open()
												end,
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XImage",
													'Image', "UI/PDA/Quest/T_Icon_Plus",
													'ImageFit', "smallest",
												}),
												}),
											PlaceObj('XTemplateWindow', {
												'__class', "XContextImage",
												'MinWidth', 376,
												'MinHeight', 730,
												'MaxWidth', 376,
												'MaxHeight', 730,
												'ImageFit', "largest",
												'ContextUpdateOnOpen', true,
												'OnContextUpdate', function (self, context, ...)
													self:SetImage(context.BigPortrait)
												end,
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'comment', "record",
											'__class', "XDialog",
											'Id', "idRecord",
											'Dock', "left",
											'MinWidth', 610,
											'MaxWidth', 610,
											'LayoutMethod', "Grid",
											'InitialMode', "history",
											'InternalModes', "history, stats",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XTextButton",
												'Id', "idHistoryTab",
												'Margins', box(0, 0, 0, -2),
												'Padding', box(16, 0, 16, 0),
												'MinHeight', 46,
												'MaxHeight', 46,
												'DrawOnTop', true,
												'MouseCursor', "UI/Cursors/Pda_Hand.tga",
												'FXMouseIn', "buttonRollover",
												'FXPress', "AIMCategoryMercsClick",
												'OnPress', function (self, gamepad)
													local record = GetDialog(self)
													record:SetMode("history")
												end,
												'Image', "UI/PDA/Quest/tab_selected",
												'FrameBox', box(3, 3, 3, 3),
												'TextStyle', "PDABrowserTabSelected",
												'Translate', true,
												'Text', T(176243150042, --[[ModItemXTemplate PDAAimEvaluation Text]] "History"),
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XTextButton",
												'Id', "idStatsTab",
												'Margins', box(0, 0, 0, -2),
												'Padding', box(16, 0, 16, 0),
												'MinHeight', 46,
												'MaxHeight', 46,
												'GridX', 2,
												'MouseCursor', "UI/Cursors/Pda_Hand.tga",
												'FXMouseIn', "buttonRollover",
												'FXPress', "AIMCategoryMercsClick",
												'OnPress', function (self, gamepad)
													local record = GetDialog(self)
													record:SetMode("stats")
												end,
												'Image', "UI/PDA/Quest/tab_selected",
												'FrameBox', box(3, 3, 3, 3),
												'TextStyle', "PDABrowserTabSelected",
												'Translate', true,
												'Text', T(168673883598, --[[ModItemXTemplate PDAAimEvaluation Text]] "Statistics"),
											}),
											PlaceObj('XTemplateWindow', {
												'comment', "gamepad hint",
												'__context', function (parent, context) return "GamepadUIStyleChanged" end,
												'__class', "XText",
												'Margins', box(10, 0, 0, 0),
												'VAlign', "center",
												'GridX', 3,
												'ScaleModifier', point(650, 650),
												'Clip', false,
												'UseClipBox', false,
												'ContextUpdateOnOpen', true,
												'OnContextUpdate', function (self, context, ...)
													self:SetVisible(GetUIStyleGamepad())
													XText.OnContextUpdate(self, context, ...)
												end,
												'Translate', true,
												'Text', T(944530238126, --[[ModItemXTemplate PDAAimEvaluation Text]] "<image UI/DesktopGamepad/DPadLeft.tga>/<image UI/DesktopGamepad/DPadRight.tga>"),
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'IdNode', false,
												'Padding', box(8, 8, 8, 8),
												'MinWidth', 610,
												'MaxWidth', 610,
												'GridY', 2,
												'GridWidth', 4,
												'Image', "UI/PDA/os_background",
												'FrameBox', box(3, 3, 3, 3),
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XContentTemplate",
													'IdNode', false,
												}, {
													PlaceObj('XTemplateMode', {
														'mode', "history",
													}, {
														PlaceObj('XTemplateWindow', {
															'__class', "XScrollArea",
															'Id', "idHistoryRows",
															'IdNode', false,
															'Padding', box(8, 4, 8, 8),
															'HAlign', "left",
															'VAlign', "top",
															'MinWidth', 460,
															'MinHeight', 672,
															'MaxWidth', 600,
															'MaxHeight', 672,
															'LayoutMethod', "VList",
															'VScroll', "idHistoryScroll",
														}, {
															PlaceObj('XTemplateWindow', {
																'__class', "XText",
																'TextStyle', "PDABrowserText",
																'Translate', true,
																'Text', T(827765451761, --[[ModItemXTemplate PDAAimEvaluation Text]] "Connecting to A.I.M. servers...\nSecurity check... <color EmStyle>Confirmed!</color>\n------------------------------------"),
															}),
															PlaceObj('XTemplateForEach', {
																'comment', "merc history log",
																'array', function (parent, context) return GetEmploymentHistory(context) end,
																'condition', function (parent, context, item, i) return EmploymentHistoryLines[item.id] end,
																'__context', function (parent, context, item, i, n) return item end,
															}, {
																PlaceObj('XTemplateWindow', {
																	'__class', "XText",
																	'FoldWhenHidden', true,
																	'TextStyle', "PDABrowserTextLight",
																	'ContextUpdateOnOpen', true,
																	'OnContextUpdate', function (self, context, ...)
																		local preset = EmploymentHistoryLines[context.id]
																		if preset then
																			local text = preset:GetText(context.context)
																			if text then
																				text = T{216000808992, "<style PDABrowserText>Level <level>: </style>", level = Untranslated(context.level)} .. text
																				self:SetText(text)
																			end
																		end
																	end,
																	'Translate', true,
																	'HideOnEmpty', true,
																}),
																}),
															}),
														PlaceObj('XTemplateWindow', {
															'__class', "MessengerScrollbar",
															'Id', "idHistoryScroll",
															'Margins', box(0, 0, 8, 8),
															'Dock', "right",
															'Target', "idHistoryRows",
															'AutoHide', true,
														}),
														PlaceObj('XTemplateCode', {
															'run', function (self, parent, context)
																local dlg = GetDialog(parent)
																
																local historyButton = dlg.idHistoryTab
																historyButton:SetTextStyle("PDABrowserTabSelected")
																historyButton:SetDrawOnTop(true)
																
																local statsButton = dlg.idStatsTab
																statsButton:SetTextStyle("PDABrowserTab")
																statsButton:SetDrawOnTop(false)
															end,
														}),
														}),
													PlaceObj('XTemplateMode', {
														'mode', "stats",
													}, {
														PlaceObj('XTemplateWindow', {
															'__class', "XScrollArea",
															'Id', "idStatsRows",
															'IdNode', false,
															'Padding', box(8, 4, 8, 8),
															'HAlign', "left",
															'VAlign', "top",
															'MinWidth', 600,
															'MinHeight', 672,
															'MaxWidth', 600,
															'MaxHeight', 672,
															'LayoutMethod', "VList",
															'VScroll', "idStatsScroll",
														}, {
															PlaceObj('XTemplateWindow', {
																'__class', "XText",
																'TextStyle', "PDABrowserText",
																'Translate', true,
																'Text', T(658723585381, --[[ModItemXTemplate PDAAimEvaluation Text]] "Connecting to A.I.M. servers...\nSecurity check... <color EmStyle>Confirmed!</color>\n-----------------------------------------------"),
															}),
															PlaceObj('XTemplateForEach', {
																'array', function (parent, context) return Presets.MercTrackedStat end,
																'__context', function (parent, context, item, i, n) return SubContext(context, { statGroupIdx = i }) end,
															}, {
																PlaceObj('XTemplateWindow', {
																	'Margins', box(0, 0, 0, 16),
																	'LayoutMethod', "VList",
																	'FoldWhenHidden', true,
																}, {
																	PlaceObj('XTemplateForEach', {
																		'array', function (parent, context) return Presets.MercTrackedStat[context.statGroupIdx] end,
																		'run_after', function (child, context, item, i, n, last)
																			child:ResolveId("idName"):SetText(item.name)
																			child:ResolveId("idValue"):SetText(item:DisplayValue(context))
																			child:SetVisible(not item.hide)
																		end,
																	}, {
																		PlaceObj('XTemplateWindow', {
																			'IdNode', true,
																			'FoldWhenHidden', true,
																		}, {
																			PlaceObj('XTemplateWindow', {
																				'__class', "XText",
																				'Id', "idName",
																				'Padding', box(2, 0, 2, 0),
																				'Dock', "left",
																				'TextStyle', "PDABrowserTextLight",
																				'Translate', true,
																			}),
																			PlaceObj('XTemplateWindow', {
																				'__class', "XText",
																				'Id', "idValue",
																				'Margins', box(0, 0, 8, 0),
																				'Padding', box(2, 0, 2, 0),
																				'Dock', "right",
																				'TextStyle', "PDABrowserTextLight",
																				'Translate', true,
																			}),
																			}),
																		}),
																	}),
																}),
															}),
														PlaceObj('XTemplateWindow', {
															'__class', "MessengerScrollbar",
															'Id', "idStatsScroll",
															'Margins', box(0, 0, 8, 8),
															'Dock', "right",
															'Target', "idStatsRows",
															'AutoHide', true,
														}),
														PlaceObj('XTemplateCode', {
															'run', function (self, parent, context)
																local dlg = GetDialog(parent)
																
																local historyButton = dlg.idHistoryTab
																historyButton:SetTextStyle("PDABrowserTab")
																historyButton:SetDrawOnTop(false)
																
																local statsButton = dlg.idStatsTab
																statsButton:SetTextStyle("PDABrowserTabSelected")
																statsButton:SetDrawOnTop(true)
															end,
														}),
														}),
													}),
												}),
											}),
										}),
									PlaceObj('XTemplateMode', {
										'mode', "perks",
									}, {
										PlaceObj('XTemplateTemplate', {
											'__template', "PDAPerks",
										}),
										}),
									}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateAction', {
					'ActionId', "ScrollDown",
					'ActionSortKey', "1000",
					'ActionGamepad', "RightThumbDown",
					'OnAction', function (self, host, source, ...)
						local area = self.host:ResolveId("idRecord")
						area = area and area:ResolveId("idHistoryRows")
						if area then
							area:ScrollDown()
						end
					end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "ScrollUp",
					'ActionSortKey', "1000",
					'ActionGamepad', "RightThumbUp",
					'OnAction', function (self, host, source, ...)
						local area = self.host:ResolveId("idRecord")
						area = area and area:ResolveId("idHistoryRows")
						if area then
							area:ScrollUp()
						end
					end,
				}),
				}),
		}),
		PlaceObj('ModItemXTemplate', {
			__is_kind_of = "XDialog",
			group = "Zulu PDA",
			id = "PDAPerks",
			PlaceObj('XTemplateWindow', {
				'__class', "PDAPerks",
				'Id', "idPerks",
				'MinWidth', 1002,
				'MinHeight', 730,
				'MaxWidth', 1002,
				'MaxHeight', 730,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self.unit = context
					self.PerkPoints = context.perkPoints
					self:ResolveId("idPerksContent"):RespawnContent()
				end,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'IdNode', false,
					'Padding', box(19, 16, 19, 0),
					'Image', "UI/PDA/os_background_2",
					'FrameBox', box(3, 3, 3, 3),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplate",
						'Id', "idPerksContent",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "to check layout completion",
							'Dock', "bottom",
							'OnLayoutComplete', function (self)
								local dlg = GetDialog(self)
								Msg("PerksLayoutDone", dlg)
							end,
							'FoldWhenHidden', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "MessengerScrollbar",
							'Id', "idPerksScroll",
							'Dock', "bottom",
							'Target', "idPerksScrollArea",
							'AutoHide', true,
							'Horizontal', true,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "top bar",
							'Padding', box(4, 0, 4, 0),
							'Dock', "top",
							'MinWidth', 918,
							'MinHeight', 40,
							'MaxWidth', 918,
							'MaxHeight', 40,
							'LayoutMethod', "HList",
							'Background', RGBA(88, 92, 68, 128),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Margins', box(4, 0, 4, 0),
								'VAlign', "center",
								'Image', "UI/PDA/level_up",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'TextStyle', "PDABrowserHeader",
								'Translate', true,
								'Text', T(190662619196, --[[ModItemXTemplate PDAPerks Text]] "Perks Level up"),
								'TextVAlign', "bottom",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idPointsText",
								'ZOrder', 10,
								'Dock', "right",
								'TextStyle', "PDABrowserHeader",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local dlg = GetDialog(self)
									if dlg.PerkPoints <= 0 then
										self:SetText(T(324504304637, "No Available perks"))
									elseif not self:IsThreadRunning("blink-anim") then
										self:CreateThread("blink-anim", function()
											local blink = false
											while self.window_state ~= "destroying" or dlg.PerkPoints >= 1 do
												if blink then
													self:SetTextStyle("InventoryToolbarButtonCenter")
													blink = false
												else
													blink = true
													self:SetTextStyle("PDABrowserHeader")
												end
												Sleep(800)
											end
										end)
									end
								end,
								'Translate', true,
								'Text', T(506143296862, --[[ModItemXTemplate PDAPerks Text]] "Available perks"),
								'TextVAlign', "bottom",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "points",
								'__context', function (parent, context) return "perk_points" end,
								'__class', "XText",
								'Margins', box(8, 0, 0, 0),
								'Dock', "right",
								'MinWidth', 24,
								'MaxWidth', 24,
								'TextStyle', "PDABrowserPoints",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local dlg = GetDialog(self)
									self:SetText(T{310974211077, "<points>", points = dlg.PerkPoints})
								end,
								'Translate', true,
								'Text', T(766252079883, --[[ModItemXTemplate PDAPerks Text]] "<perkPoints>"),
								'TextVAlign', "center",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "grid",
							'__class', "XScrollArea",
							'Id', "idPerksScrollArea",
							'Margins', box(0, 4, 0, 0),
							'MinWidth', 918,
							'MaxWidth', 918,
							'GridStretchX', false,
							'OnLayoutComplete', function (self)
								local wheelstep = 80
								if GetDialog(self).totalPerks > 90 then
									self:SetMouseWheelStep(wheelstep)
								else
									self:SetMouseWheelStep(0)
								end
							end,
							'LayoutMethod', "Grid",
							'VScroll', "idPerksScroll",
							'MouseWheelStep', 0,
						}, {
							PlaceObj('XTemplateWindow', {
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'comment', "Stats text",
									'__class', "XText",
									'Padding', box(0, 0, 0, 0),
									'MinWidth', 180,
									'MaxWidth', 180,
									'TextStyle', "PDABrowserSubtitle",
									'Translate', true,
									'Text', T(229728827404, --[[ModItemXTemplate PDAPerks Text]] "Stats"),
									'WordWrap', false,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Margins', box(0, 0, -10000, 0),
									'DrawOnTop', true,
									'Image', "UI/PDA/separate_line_vertical",
									'FrameBox', box(3, 3, 3, 3),
									'SqueezeY', false,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "empty 2nd row",
								'GridY', 2,
							}),
							PlaceObj('XTemplateForEach', {
								'comment', "GetPerkStatAmountGroups()",
								'array', function (parent, context) return GetPerkStatAmountGroups() end,
								'item_in_context', "amountGroup",
								'run_after', function (child, context, item, i, n, last)
									child:SetGridX(i+1)
									if i == 1 then
									child:SetMargins(box(4, 0, 0, 0))
									end
								end,
							}, {
								PlaceObj('XTemplateWindow', {
									'Margins', box(26, 0, 0, 0),
									'LayoutMethod', "HList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XFrame",
										'Margins', box(0, 0, 0, 4),
										'Image', "UI/PDA/separate_line",
										'FrameBox', box(3, 3, 3, 3),
										'SqueezeX', false,
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Margins', box(4, 0, 0, 0),
										'Padding', box(0, 0, 0, 0),
										'TextStyle', "PDABrowserSubtitle",
										'ContextUpdateOnOpen', true,
										'OnContextUpdate', function (self, context, ...)
											self:SetText(Untranslated(context.amountGroup))
										end,
										'Translate', true,
									}),
									}),
								}),
							PlaceObj('XTemplateForEach', {
								'comment', "stat",
								'array', function (parent, context) return UnitPropertiesStats:GetAllAttributes() end,
								'item_in_context', "statProp",
								'run_after', function (child, context, item, i, n, last)
									child:SetGridY(i+2)
								end,
							}, {
								PlaceObj('XTemplateWindow', {
									'VAlign', "bottom",
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'TextStyle', "PDABrowserHeader",
										'ContextUpdateOnOpen', true,
										'OnContextUpdate', function (self, context, ...)
											self:SetText(context.statProp.name)
										end,
										'Translate', true,
										'TextVAlign', "bottom",
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XFrame",
										'Margins', box(0, 0, -10000, 0),
										'DrawOnTop', true,
										'Image', "UI/PDA/separate_line_vertical",
										'FrameBox', box(3, 3, 3, 3),
										'SqueezeY', false,
									}),
									}),
								}),
							PlaceObj('XTemplateForEach', {
								'comment', "attribute",
								'array', function (parent, context) return UnitPropertiesStats:GetAllAttributes() end,
								'item_in_context', "statProp",
								'__context', function (parent, context, item, i, n) return SubContext(context, {perkUIRow = i}) end,
							}, {
								PlaceObj('XTemplateForEach', {
									'comment', "GetPerkStatAmountGroups()",
									'array', function (parent, context) return GetPerkStatAmountGroups() end,
									'item_in_context', "amountGroup",
									'__context', function (parent, context, item, i, n) return SubContext(context, {perkUIColumn = i}) end,
									'run_after', function (child, context, item, i, n, last)
										child:SetGridX(context.perkUIColumn+1)
										child:SetGridY(context.perkUIRow+2)
										if context.perkUIColumn == 1 then
										child:SetMargins(box(20, 0, -20, 4))
										end
									end,
								}, {
									PlaceObj('XTemplateWindow', {
										'Margins', box(40, 0, -20, 2),
										'LayoutMethod', "HList",
									}, {
										PlaceObj('XTemplateForEach', {
											'array', function (parent, context) return PresetArray(CharacterEffectCompositeDef) end,
											'condition', function (parent, context, item, i) return item.object_class == "Perk" and item.Stat == context.statProp.id and item.StatValue == context.amountGroup and table.find({"Bronze", "Silver", "Gold"}, item.Tier) end,
											'run_after', function (child, context, item, i, n, last)
												local dlg = GetDialog(child)
												child:SetPerkId(item.id)
												
												if not dlg:CanUnlockPerk(context, item) then
													child:SetEnabled(false)
												end
												child.bottomAnchor = true
												dlg.totalPerks = dlg.totalPerks + 1
											end,
										}, {
											PlaceObj('XTemplateTemplate', {
												'__template', "PDAPerkLevelUp",
												'RolloverTemplate', "PDAPerkRollover",
												'Margins', box(3, 3, 3, 3),
												'DisabledBorderColor', RGBA(0, 0, 0, 0),
											}),
											}),
										}),
									PlaceObj('XTemplateWindow', {
										'comment', "blue background bar related to the stat",
										'__condition', function (parent, context) return false end,
										'__class', "XContextWindow",
										'ZOrder', -10,
										'Margins', box(30, 26, -30, 2),
										'OnLayoutComplete', function (self)
											local context = self:GetContext()
											local statValue = context[context.statProp.id]
											local group = context.amountGroup
											local nextGroup = group + 10
											
											if statValue <= group then
												self:SetVisible(false)
											elseif statValue > group and statValue < nextGroup then
												local width = self.box:sizex()
												local newWidth = MulDivRound(width, (statValue - group), 10)
												self:SetBox(self.box:minx(), self.box:miny(), newWidth, self.box:sizey())
											end
										end,
										'Background', RGBA(61, 122, 153, 69),
										'ContextUpdateOnOpen', true,
										'OnContextUpdate', function (self, context, ...)
											local x = context.perkUIColumn
											local y = context.perkUIRow
											self:SetGridX(x+1)
											self:SetGridY(y+2)
										end,
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XContextWindow",
										'ZOrder', -10,
										'Margins', box(28, 0, -28, 0),
										'Background', RGBA(52, 55, 61, 178),
										'ContextUpdateOnOpen', true,
										'OnContextUpdate', function (self, context, ...)
											local x = context.perkUIColumn
											local y = context.perkUIRow
											self:SetGridX(x+1)
											self:SetGridY(y+2)
											
											self:SetVisible(x % 2 == 0)
										end,
									}),
									}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idPerksWarning",
								'Margins', box(0, 15, 0, 15),
								'HAlign', "center",
								'VAlign', "center",
								'GridX', 2,
								'GridY', 8,
								'GridWidth', 3,
								'Visible', false,
								'TextStyle', "PDAPerksWarning",
								'Translate', true,
								'Text', T(473282401388, --[[ModItemXTemplate PDAPerks Text]] "Deselect a perk to choose a new one"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateFunc', {
					'name', "Open(self, ...)",
					'func', function (self, ...)
						XDialog.Open(self, ...)
						TutorialHintsState.PerksMenu = true
						TutorialHintVisibilityEvaluate()
					end,
				}),
				}),
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Sector Operations",
	}, {
		PlaceObj('ModItemSectorOperation', {
			CheckCompleted = function (self, merc, sector)
				if #GetOperationProfessionals(sector.Id, self.id, "Patient") == 0 then
					self:Complete(sector)
				end
			end,
			CustomRepeat = true,
			GetOperationCost = function (self, merc, profession, idx)
				if profession == "Patient" then
					return  {
						[1] = {value = self:ResolveValue("MedCost") * PatientGetWoundsBeingTreated(merc), resource = "Meds"
						 + self:ResolveValue("PartsCost") * PatientGetWoundsBeingTreated(merc), resource = "Parts"
						+ self:ResolveValue("MoneyCost") * PatientGetWoundsBeingTreated(merc), resource = "Money"
						+ self:ResolveValue("ChipCost") * PatientGetWoundsBeingTreated(merc), resource = "Microchip"}
					}
				else
					return {}
				end
			end,
			GetSectorSlots = function (self, prof, sector)
				return 1
			end,
			HasOperation = function (self, sector)
				if self.Custom then
					return sector.custom_operations and sector.custom_operations[self.id] and
						sector.custom_operations[self.id].status == "enabled"
				end
				return true
			end,
			IsEnabled = function (self, sector)
				return false
				--return true
			end,
			ModifyProgress = function (self, value, sector)
				local ac = sector.custom_operations and sector.custom_operations[self.id]
				if ac then
					ac.progress = ac.progress + value
				end
			end,
			OnSetOperation = function (self, merc, arg)
				local sector = merc:GetSector()
				sector.custom_operations = sector.custom_operations or {}
				sector.custom_operations[self.id] = sector.custom_operations[self.id] or {progress = 0}
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "MedCost",
					'Value', 500,
					'Tag', "<MedCost>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCost",
					'Value', 50000,
					'Tag', "<MoneyCost>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "ChipCost",
					'Value', 5,
					'Tag', "<ChipCost>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "PartsCost",
					'Value', 1000,
					'Tag', "<PartsCost>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Patient",
					'display_name', T(807319539935, --[[ModItemSectorOperation CyberEnhancement display_name]] "Patient"),
					'display_name_all_caps', T(592609832532, --[[ModItemSectorOperation CyberEnhancement display_name_all_caps]] "PATIENT"),
					'display_name_plural', T(334709218204, --[[ModItemSectorOperation CyberEnhancement display_name_plural]] "Patients"),
					'display_name_plural_all_caps', T(294056800176, --[[ModItemSectorOperation CyberEnhancement display_name_plural_all_caps]] "PATIENTS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				return self.target_contribution
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				return sector.custom_operations and sector.custom_operations[self.id] and sector.custom_operations[self.id].progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				local _, val = self:GetRelatedStat(merc)
				return val
			end,
			RequiredResources = {
				"Meds",
				"Microchip",
				"Money",
				"Parts",
			},
			ShowInCombatBadge = false,
			Tick = function (self, merc)
				local sector = merc:GetSector()
				local progress_per_tick = self:ProgressPerTick(merc)
				if CheatEnabled("FastActivity") then
					progress_per_tick = progress_per_tick*100
				end
				self:ModifyProgress(progress_per_tick, sector)
				self:CheckCompleted(merc, sector)
			end,
			description = T(975131058535, --[[ModItemSectorOperation CyberEnhancement description]] "Surgery for cyber enhancement"),
			display_name = T(108023191471, --[[ModItemSectorOperation CyberEnhancement display_name]] "Cyber Surgery"),
			group = "Default",
			icon = "UI/SectorOperations/T_Icon_Activity_Healing_Doctor_2",
			id = "CyberEnhancement",
			image = "Mod/PerksExpanded/Images/B12U.dds",
			min_requirement_stat = "Health",
			min_requirement_stat_value = 80,
			operation_type = set( "Healing" ),
			related_stat = "Health",
			short_name = T(123995458377, --[[ModItemSectorOperation CyberEnhancement short_name]] "Surgery"),
			sub_title = T(587433333297, --[[ModItemSectorOperation CyberEnhancement sub_title]] "Special"),
			target_contribution = 4800,
		}),
		}),
}