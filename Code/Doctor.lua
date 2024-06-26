----
----local function GetUnitEquippedItem(unit)
----	local item
----	unit:ForEachItem("Medicine", function(itm)
----		if itm.Condition > 0 then
----			if itm.UsePriority == -1 then
----				item = itm
----			end
----		end
----	end)
----	return item
----end
--
--
--function Unit:UseItem(action_id, cost_ap, args)
--	local goto_ap = args.goto_ap or 0
--	local action_cost = cost_ap - goto_ap
--	local pos = args.goto_pos
--	local target = args.target
--	local sat_view = args.sat_view or false -- in sat_view form inventory, skip all sleeps and anims
--	local target_self = target == self
--		
--	if g_Combat then
--		if goto_ap > 0 then
--			self:PushDestructor(function(self)
--				self:GainAP(action_cost)
--			end)
--			local result = self:CombatGoto(action_id, goto_ap, args.goto_pos)
--			self:PopDestructor()
--			if not result then
--				self:GainAP(action_cost)
--				return
--			end
--		end
--	elseif not target_self then
--		self:GotoSlab(pos)
--	end
--	
--	local myVoxel = SnapToPassSlab(self:GetPos())
--	if pos and myVoxel:Dist(pos) ~= 0 then
--		if self.behavior == "Bandage" then
--			self:SetBehavior()
--		end
--		if self.combat_behavior == "Bandage" then
--			self:SetCombatBehavior()
--		end
--		self:GainAP(action_cost)
--		return
--	end
--	local action = CombatActions[action_id]
--	local medicine = GetUnitEquippedMedicine(self)
--	if not medicine then
--		if self.behavior == "Bandage" then
--			self:SetBehavior()
--		end
--		if self.combat_behavior == "Bandage" then
--			self:SetCombatBehavior()
--		end
--		self:GainAP(action_cost)
--		return
--	end
--	
--	self:SetBehavior("Bandage", {action_id, cost_ap, args})
--	self:SetCombatBehavior("Bandage", {action_id, cost_ap, args})
--
--	if not target_self then
--		self:Face(target, 200)
--		Sleep(200)
--	end
--
--	if not sat_view then
--		if self.stance ~= "Crouch" then
--			self:ChangeStance(false, 0, "Crouch")
--		end
--		self:SetState(target_self and "nw_Bandaging_Self_Start" or "nw_Bandaging_Start")
--		Sleep(self:TimeToAnimEnd() or 100)
--		if not args.provoked then
--			self:ProvokeOpportunityAttacks(action, "attack interrupt")
--			args.provoked = true
--			self:SetBehavior("Bandage", {action_id, cost_ap, args})
--			self:SetCombatBehavior("Bandage", {action_id, cost_ap, args})
--		end
--		self:SetState(target_self and "nw_Bandaging_Self_Idle" or "nw_Bandaging_Idle")
--		if not g_Combat and not GetMercInventoryDlg() then
--			SetInGameInterfaceMode("IModeExploration")
--		end
--	elseif not g_Combat then
--		-- insta-heal in sat view
--		while IsValid(target) and not target:IsDead() and target.HitPoints < target.MaxHitPoints and medicine.Condition > 0 do
--			target:GetBandaged(medicine, self)
--		end
--	end
--
--	self:SetCommand("CombatBandage", target, medicine)
--end
--
--
--
--
--PlaceObj('CombatAction', {
--	ActionPoints = 2000,
--	ActivePauseBehavior = "queue",
--	AimType = "melee",
--	ConfigurableKeybind = false,
--	Description = T(105765420738, --[[CombatAction Bandage Description]] "Spend some time healing a wounded ally. You will not be able to perform other actions while bandaging. Your ally will not be able to move but can still attack.\n\nStabilize <GameTerm('Downed')> <em>allies</em> or <em>heal <hp>% of their max HP</em> (based on the <em><medical> skill</em>). Sets your stance to <em>Crouched</em>."),
--	DisplayName = T(615556944457, --[[CombatAction Bandage DisplayName]] "Bandage"),
--	EvalTarget = function (self, units, target, args)
--		local unit = units[1]
--		if not target or unit:IsOnEnemySide(target) then return -1 end
--		if not target:HasStatusEffect("Bleeding") and (target.HitPoints >= target.MaxHitPoints) then return -1 end
--		
--		return (200 - target.HitPoints) or 0
--	end,
--	GetAPCost = function (self, unit, args)
--		local medicine = self:GetAttackWeapons(unit, args)
--		if not medicine then return -1 end -- can be valid in AI PrecalcAction
--		return self.ActionPoints
--	end,
--	GetActionDescription = function (self, units)
--		local unit = units[1]
--		local medkit = self:GetAttackWeapons(unit)
--		local hp = unit:CalcHealAmount(medkit) or 0
--		local percent = MulDivRound(100, hp, unit.MaxHitPoints)
--		if LastLoadedOrLoadingIMode == "IModeCombatMelee" then
--			return T{930612158384, "Select the unit you would like to bandage, healing them for <hp>% of their max HP.", hp = percent}
--		end
--		
--		return T{self.Description, hp = percent}
--	end,
--	GetAnyTarget = function (self, units)
--		return GetBandageTargets(units[1], "any", "ignore")
--	end,
--	GetAttackWeapons = function (self, unit, args)
--		return GetUnitEquippedMedicine(unit)
--	end,
--	GetDefaultTarget = function (self, unit)
--		local units = {unit}
--		if self:EvalTarget(units, unit) > 0 then
--			return unit
--		end
--		return CombatAction.GetDefaultTarget(self, unit)
--	end,
--	GetTargets = function (self, units)
--		return GetBandageTargets(units[1], "all", "ignore")
--	end,
--	GetUIState = function (self, units, args)
--		local unit = units[1]
--		
--		if g_Combat and not unit:HasAP(self.ActionPoints) then 
--			return "enabled", GetUnitNoApReason(unit) 
--		end
--		
--		if not GetBandageTargets(unit, "any", "reachable") then
--			return "enabled", AttackDisableReasons.NoBandageTarget
--		end
--		
--		return "enabled"
--	end,
--	Icon = "UI/Icons/Hud/first_aid",
--	IdDefault = "Doctordefault",
--	IsAimableAttack = false,
--	--KeybindingFromAction = "actionRedirectBandage",
--	MoveStep = true,
--	MultiSelectBehavior = "first",
--	Parameters = {
--		PlaceObj('PresetParamPercent', {
--			'Name', "selfheal",
--			'Value', 70,
--			'Tag', "<selfheal>%",
--		}),
--		PlaceObj('PresetParamPercent', {
--			'Name', "base_heal",
--			'Value', 20,
--			'Tag', "<base_heal>%",
--		}),
--		PlaceObj('PresetParamPercent', {
--			'Name', "medical_max_heal",
--			'Value', 30,
--			'Tag', "<medical_max_heal>%",
--		}),
--		PlaceObj('PresetParamNumber', {
--			'Name', "ReviveConditionLoss",
--			'Value', 10,
--			'Tag', "<ReviveConditionLoss>",
--		}),
--		PlaceObj('PresetParamNumber', {
--			'Name', "MaxConditionHPRestore",
--			'Value', 120,
--			'Tag', "<MaxConditionHPRestore>",
--		}),
--	},
--	QueuedBadgeText = T(989605585095, --[[CombatAction Bandage QueuedBadgeText]] "BANDAGE"),
--	RequireState = "any",
--	RequireWeapon = true,
--	Run = function (self, unit, ap, ...)
--		unit:SetActionCommand("UseItem", self.id, ap, ...)
--	end,
--	--ShowIn = "SignatureAbilities",
--	SortKey = 101,
--	--group = "SignatureAbilities",
--UIBegin = function (self, units, args)
--	if self:GetAnyTarget(units) then
--		if units then 
--			table.sort(units, function (a,b) 
--				return a.Medical > b.Medical and self:GetAttackWeapons(a)
--			end)
--		end
--		CombatActionAttackStart(self, units, args, "IModeCombatMelee")
--		--CombatActionAttackStart("Bandage", units, args, "IModeCombatMelee")
--	end
--end,
----UIBegin = function (self, units, args)
----	if self:GetAnyTarget(units) then
----		if units then 
----			table.sort(units, function (a,b) 
----				return a.Medical > b.Medical and self:GetAttackWeapons(a)
----			end)
----		end
----		-- here is the fucking problem, passing CombatActions.Bandage so it will trick the cursor and target selection
----		CombatActionAttackStart(CombatActions.Bandage, units, args, "IModeCombatMelee")
----	end
----end,
--group = "Default",
--	id = "Doctor",
--})
--
----local function Unit:Doctor(action_id, cost_ap, args)
----	return self:Bandage(action_id, cost_ap, args)
----end
----
----local function IModeCommonUnitControl:UpdateCursorImage()
----	if GetUIStyleGamepad() then return end
----
----	local movement = IsKindOf(self, "IModeCombatMovement")
----	local exploration = IsKindOf(self, "IModeExploration")
----	local canInteract = movement or exploration
----	local freeAimMode = not self.crosshair and (IsKindOf(self, "IModeCombatFreeAim") or IsKindOf(self, "IModeCombatAreaAim"))
----	freeAimMode = freeAimMode or self.crosshair and self.crosshair.context.free_aim
----	
----	if self.action == (CombatActions.Bandage or CombatActions.Doctor) then
----		if self.potential_target and CanBandageUI(SelectedObj, { target = self.potential_target }) then
----			self.desktop:SetMouseCursor("UI/Cursors/Healing_on.tga")
----		else
----			self.desktop:SetMouseCursor("UI/Cursors/Healing_off.tga")
----		end
----	elseif (canInteract and IsKindOf(self.potential_interactable, "Interactable")) then
----		local action = self.potential_interactable_action
----		if action == CombatActions.Interact_Talk or action == CombatActions.Interact_Banter then
----			self.desktop:SetMouseCursor("UI/Cursors/Speaking.tga")
----		else
----			if action and action.id == "Interact_Attack" then
----				local action = self.action or (SelectedObj and SelectedObj:GetDefaultAttackAction())
----				local cursor = GetRangeBasedMouseCursor(self.penalty, action)
----				self.desktop:SetMouseCursor(cursor)
----			else
----				self.desktop:SetMouseCursor("UI/Cursors/Interact.tga")
----			end
----		end
----	elseif (self.potential_target and self.potential_target_is_enemy) or freeAimMode then
----		local action = self.action or (SelectedObj and SelectedObj:GetDefaultAttackAction())
----		local clickWillAttack = self.crosshair and self.crosshair.context.target == self.potential_target
----		local cursor = GetRangeBasedMouseCursor(self.penalty, action, clickWillAttack)
----		self.desktop:SetMouseCursor(cursor)
----	elseif movement and self.movement_mode then
----		if self.target_path then
----			self.desktop:SetMouseCursor("UI/Cursors/Travel.tga")
----		else
----			self.desktop:SetMouseCursor("UI/Cursors/Impassable.tga")
----		end
----	elseif exploration and not GetDialog("SatelliteCabinet") and not self.potential_target then 
----		local inBadge = terminal.desktop.last_mouse_target and terminal.desktop.last_mouse_target["xbadge-instance"]
----		if inBadge then
----			return
----		end
----		
----		if GetCursorPassSlab() then
----			self.desktop:SetMouseCursor("UI/Cursors/Travel.tga")
----		else
----			self.desktop:SetMouseCursor("UI/Cursors/Impassable.tga")
----		end
----	else
----		self.desktop:SetMouseCursor()
----	end
----end