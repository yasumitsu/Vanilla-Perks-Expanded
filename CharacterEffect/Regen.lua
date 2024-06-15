UndefineClass('Regen')
DefineClass.Regen = {
	__parents = { "CharacterEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "CharacterEffect",
	msg_reactions = {
		PlaceObj('MsgActorReactionEffects', {
			Effects = {
				PlaceObj('ConditionalEffect', {
					'Effects', {
						PlaceObj('ExecuteCode', {
							FuncCode = 'print(obj:GetModifiedMaxHitPoints())\n--obj:RemoveStatusEffect("Wounded", 1)\n--obj.HitPoints = Min(obj.MaxHitPoints, obj.HitPoints + 10)\n--RecalcMaxHitPoints(obj)\n--AdjustWoundsToHP(obj)\n--ObjModified(obj)\n--local amount = 10\n--obj:CallReactions("OnCalcHealAmount", obj, obj, medkit, amount )\n--obj:RestoreHealth(1, "floating_text")\n--obj.HitPoints = Min(obj.MaxHitPoints, obj.HitPoints + amount)\n--obj:CreateDamageFloatingText(self, "oi", "")\nobj:TakeDirectDamage(20, has_visibility and floating_text or false, "short", log_msg)\n--obj.MaxHitPoints = obj.MaxHitPoints + 5\n\nprint(obj.HitPoints)\n -- = Min(obj:GetInitialMaxHitPoints(), obj.HitPoints + 1\n\n\n--CreateFloatingText(obj:GetVisualPos(), { " <Amount> ", Amount = 1}, 4282219161, nil, 500)',
						}),
					},
				}),
			},
			Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
		}),
	},
	unit_reactions = {
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
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(331988279960, --[[ModItemCharacterEffectCompositeDef Regen DisplayName]] "Regen"),
	Description = T(416178841401, --[[ModItemCharacterEffectCompositeDef Regen Description]] "Heals 5% HP each turn in combat."),
	OnAdded = function (self, obj)  end,
	OnRemoved = function (self, obj)  end,
	Icon = "Mod/PerksExpanded/Images/restitution.dds",
	Shown = true,
	HasFloatingText = true,
}

