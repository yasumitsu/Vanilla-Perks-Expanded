PlaceObj('CombatAction', {
	ActionPoints = 10000,--self:ResolveValue("ap_cost")
	ActionType = "Ranged Attack",
	AimType = "parabola aoe",
	Comment = "mgl burst",
	CostBasedOnWeapon = true,
	ConfigurableKeybind = false,
	Description = T(169779903706, --[[CombatAction Bombard Description]] "<em>Spends all AP</em>\nSetup a zone bombarded at the start of your next turn. The amount of attacks depends on spent AP.\n\n<em><attacks></em> attacks."),
	DisplayName = T(293721021077, --[[CombatAction Bombard DisplayName]] "Bombard"),
	GetAPCost = function (self, unit, args)
		local weapon = self:GetAttackWeapons(unit, args)
		return unit:GetAttackAPCost(self, weapon, false, 0) or -1
	end,
	GetActionDamage = function (self, unit, target, args)
		local weapon = self:GetAttackWeapons(unit, args)
		if weapon and IsKindOf(weapon.ammo, "Ordnance") then
			return weapon.ammo.BaseDamage
		end
		return 0
	end,
	GetActionDescription = function (self, units)
		local unit = units[1]
		local weapon = unit and self:GetAttackWeapons(unit)
		if weapon then
			return T{self.Description, damage = weapon:GetBaseDamage()}
		end
		
		local description = self.Description
		if (description or "") == "" then
			description = self:GetActionDisplayName()
		end
		return description
	end,
	GetActionResults = function (self, unit, args)
		local weapon = self:GetAttackWeapons(unit, args)
		local target = ResolveGrenadeTargetPos(args.target)
		local ammos = weapon and unit:GetAvailableAmmos(weapon, nil, "unique")
		if not weapon or not target or not ammos then
			return {}
		end
		local args = table.copy(args)
		args.weapon = weapon
		args.target = target
		args.num_shots = 2
		args.ordnance = args.ordnance or ammos[2]
		--args.bombard_shots = cost_ap / (self:ResolveValue("ap_per_shot")*const.Scale.AP)
		local attack_args = unit:PrepareAttackArgs(self.id, args)
		local results = weapon:GetAttackResults(self, attack_args)
		return results, attack_args
	end,
	GetAttackWeapons = function (self, unit, args)
		if args and args.weapon then return args.weapon end
		return unit:GetActiveWeapons("HeavyWeapon")
	end,
	GetMaxAimRange = function (self, unit, weapon)
		return weapon.WeaponRange
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		if not HasPerk(unit, "HeavyWeaponsTraining") then
			return "hidden"
		end
		return CombatActionGenericAttackGetUIState(self, units, args)
	end,

	Icon = "UI/Icons/Hud/heavy_weapon_attack",
	IdDefault = "MGLBurstdefault",
	KeybindingFromAction = "actionRedirectCancelShot",
	MultiSelectBehavior = "first",
	Parameters = {
		PlaceObj('PresetParamNumber', {
			'Name', "shots_per_burst",
			'Value', 2,
			'Tag', "<shots_per_burst>",
		}),
		PlaceObj('PresetParamNumber', {
			'Name', "ap_cost",
			'Value', 10000,
			'Tag', "<ap_cost>",
		}),
	},
	RequireState = "any",
	RequireWeapon = true,
	Run = function (self, unit, ap, ...)
		unit:SetActionCommand("HeavyWeaponAttack", self.id, ap, ...)
	end,
	SortKey = 2,
	UIBegin = function (self, units, args)
		CombatActionAttackStart(self, units, args, "IModeCombatAreaAim")
	end,
	group = "WeaponAttacks",
	id = "MGLBurst",
})