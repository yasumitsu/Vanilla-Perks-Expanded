--Make IMP Great Again Remastered by LionCat(狮子猫); Original Author : AuntSu(苏大妈)
--=============================================================
--Maximum Tactical Perks count (最大战术天赋数量)
g_MaxTacticalPerksCount = 200
--=============================================================
--Tactical perks (战术天赋)
local tac_perks = {
  --Perk-Personality 佣兵个性天赋
  "Psycho",--精神病
  "Negotiator",--谈判家
  "Scoundrel",--恶棍

  --Perk-Quirk 佣兵癖好天赋
  "Loner",--独狼
  "Optimist",--乐天派
  "Spiritual",--精神信仰
  "EnterWarmode",
  "ChangeClothes",
  "Regen",

  --Perk-Specialization 佣兵专精天赋
  "Ambidextrous",--左右开弓
  "AutoWeapons",--自动武器
  "CQCTraining",--CQC 训练
  "HeavyWeaponsTraining",--重型武器
  "MartialArts",--武术
  "MeleeTraining",--短兵相接
  "MrFixit",--大拿
  "NightOps",--夜间行动
  "Stealthy",--隐秘
  "Teacher",--教导
  "Throwing",--投掷
  "NaturalCamouflage",
  "SurvivalInstinct",
  "Endurance",
  "Sharpshooter",
  "Marksman",
  "Leader",
  "Doctor",
  "ExplosiveExpert",
  "Mechanic",

  --Perk-Personal 佣兵蓝色独有天赋
  "BuildingConfidence",--站稳脚跟
  "BulletHell",--子弹地狱
  "BunsPerk",--无所不能
  "DanceForMe",--为我舞蹈
  "DangerClose",--危险距离
  "DedicatedCamper",--巧胜于勤
  "DesignerExplosives",--精品炸药
  "DoubleToss",--双抛
  "FleetingShadow",--飞逝之影
  "HundredKnives",--飞刀
  "IcePerk",--冰风暴
  "JackOfAllTrades",--万事通
  "KillingWind",--重载突击
  "LightStep",--脚步轻盈
  "NailsPerk",--一针见血
  "NaturalHealing",--自然恩赐
  "SecondStoryMan",--窃贼
  "ShoulderToShoulder",--肩并肩
  "SidneyPerk",--自鸣得意
  "Spotter",--顶级侦查员
  "SteroidPunch",--肌肉撞击！
  "ExplodingPalm",--肌肉撞击！
  "TagTeam",--双人组合
  "WeGotThis",--目标清除
  "WeaponPersonalization"
}
--=============================================================
--Load IMP Perks 读取IMP佣兵天赋列表
function ImpGettaclPerks()
  return tac_perks
end

--ImpGetMinMaxStat IMP佣兵属性上下限1-85
function ImpGetMinMaxStat(stat_id)
  return 1, 85
end

--Hide Passive Blue Perks 隐藏佣兵被动系蓝色天赋
local function HidePassiveBluishPerks()
--"BuildingConfidence",--站稳脚跟
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(494742880689, --[[CombatAction BuildingConfidence DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_building_confidence",
	IdDefault = "BuildingConfidencedefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "BuildingConfidence",
})
--"BunsPerk",--无所不能
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(496185040855, --[[CombatAction BunsPerk DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_buns_perk",
	IdDefault = "BunsPerkdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "BunsPerk",
})
--"DangerClose",--危险距离
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(439812642795, --[[CombatAction DangerClose DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_danger_close",
	IdDefault = "DangerClosedefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "DangerClose",
})
--"DedicatedCamper",--巧胜于勤
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(224326165572, --[[CombatAction DedicatedCamper DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_dedicated_camper",
	IdDefault = "DedicatedCamperdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "DedicatedCamper",
})
--"FleetingShadow",--飞逝之影
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(719706520870, --[[CombatAction FleetingShadow DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_fleeting_shadow",
	IdDefault = "FleetingShadowdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "FleetingShadow",
})
--"FoxPerk",--相貌出众
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(321475789120, --[[CombatAction FoxPerk DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_fox_perk",
	IdDefault = "FoxPerkdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "FoxPerk",
})
--"GruntyPerk",--Überraschung来一个惊喜吧！
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(310989078300, --[[CombatAction GruntyPerk DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_grunty_perk",
	IdDefault = "GruntyPerkdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "GruntyPerk",
})
--"HawksEye",--鹰眼
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(710075976136, --[[CombatAction HawksEye DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_hawks_eye",
	IdDefault = "HawksEyedefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "HawksEye",
})
--"JackOfAllTrades",--万事通
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(985157282912, --[[CombatAction JackOfAllTrades DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_jack_of_all_trades",
	IdDefault = "JackOfAllTradesdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "JackOfAllTrades",
})
--KillingWind,--重载突击
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(623714906755, --[[CombatAction KillingWind DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_killing_wind",
	IdDefault = "KillingWinddefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "KillingWind",
})
--LightStep,--脚步轻盈
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(620581238795, --[[CombatAction LightStep DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_light_step",
	IdDefault = "LightStepdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "LightStep",
})
--"MakeThemBleed",--血流成河
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(958256324680, --[[CombatAction MakeThemBleed DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_make_them_bleed",
	IdDefault = "MakeThemBleeddefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "MakeThemBleed",
})
--NailsPerk,--一针见血
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(247936211509, --[[CombatAction NailsPerk DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_nails_perk",
	IdDefault = "NailsPerkdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "NailsPerk",
})
--NaturalHealing,--自然恩赐
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(154407600177, --[[CombatAction NaturalHealing DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_natural_healing",
	IdDefault = "NaturalHealingdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "NaturalHealing",
})
--SecondStoryMan,--窃贼
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(208299655551, --[[CombatAction SecondStoryMan DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_second_man_story",
	IdDefault = "SecondStoryMandefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "SecondStoryMan",
})
--ShoulderToShoulder,--肩并肩
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(935618242248, --[[CombatAction ShoulderToShoulder DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_shoulder_to_shoulder",
	IdDefault = "ShoulderToShoulderdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "ShoulderToShoulder",
})
--SidneyPerk,--自鸣得意
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(943208194004, --[[CombatAction SidneyPerk DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_sidney_perk",
	IdDefault = "SidneyPerkdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "SidneyPerk",
})
--Spotter,--顶级侦查员
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(558757719170, --[[CombatAction Spotter DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_spotter",
	IdDefault = "Spotterdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "Spotter",
})
--TagTeam,--双人组合
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(378289237011, --[[CombatAction TagTeam DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_tag_team",
	IdDefault = "TagTeamdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "TagTeam",
})
--VengefulTemperament,--心怀芥蒂
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(708228622280, --[[CombatAction VengefulTemperament DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_vengeful_temperament",
	IdDefault = "VengefulTemperamentdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "VengefulTemperament",
})
--WeGotThis,--目标清除
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(824128303298, --[[CombatAction WeGotThis DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_we_got_this",
	IdDefault = "WeGotThisdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "WeGotThis",
})
--WeaponPersonalization,--体力活
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(598595177377, --[[CombatAction WeaponPersonalization DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_weapon_personalization",
	IdDefault = "WeaponPersonalizationdefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "WeaponPersonalization",
})
--YouSeeIgor--你瞧，伊戈尔
PlaceObj('CombatAction', {
	ActionType = "Passive",
	ActivePauseBehavior = "instant",
	Comment = "passive",
	ConfigurableKeybind = false,
	DisplayName = T(193034765297, --[[CombatAction YouSeeIgor DisplayName]] "<placeholder>"),
	GetActionDescription = function (self, units)
		return GetSignatureActionDescription(self)
	end,
	GetActionDisplayName = function (self, units)
		return GetSignatureActionDisplayName(self)
	end,
	GetUIState = function (self, units, args)
		local unit = units[1]
		local cost = self:GetAPCost(unit, args)
		if cost < 0 then return "hidden" end
		if not unit:UIHasAP(cost) then return "disabled" end
		return "enabled"
	end,
	Icon = "UI/Icons/Hud/perk_you_see_igor",
	IdDefault = "YouSeeIgordefault",
	KeybindingFromAction = "actionRedirectSignatureAbility",
	RequireState = "any",
	Run = function (self, unit, ap, ...)
		return false
	end,
	ShowIn = false,
	SortKey = 100,
	group = "SignatureAbilities",
	id = "YouSeeIgor",
})
end

--Enable Multiple I.M.P. 允许创建多个IMP佣兵
local function Enable_Multi_IMP()
	g_ImpTest = false
end

--IMPConst Adjust IMP佣兵证书价格 & 最大属性点
local function IMPConst()
	const.Imp.CertificateCost = 0 -- Default = 6999
	const.Imp.MaxStatPoints = 550 -- Default = 550
end

--ApplyIMP IMP模组游戏内生效
function OnMsg.ModsReloaded()
	IMPConst()
	if not CurrentModOptions["PassiveBluishPerks_Visibility"] then
        return HidePassiveBluishPerks()
	end
end
function OnMsg.DataLoaded()
	IMPConst()
	if not CurrentModOptions["PassiveBluishPerks_Visibility"] then
        return HidePassiveBluishPerks()
	end
end
function OnMsg.OptionsApply()
	IMPConst()
	if not CurrentModOptions["PassiveBluishPerks_Visibility"] then
        return HidePassiveBluishPerks()
	end
end


-- ========== GENERATED BY XTemplate Editor (Alt-F3) DO NOT EDIT MANUALLY! ==========
function OnMsg.ModsReloaded()
PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "Zulu PDA",
	id = "PDAImpDialog",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Background', RGBA(215, 159, 80, 255),
		'MouseCursor', "UI/Cursors/Pda_Cursor.tga",
		'InitialMode', "start_page",
		'InternalModes', "start_page,home,login,logout,test,test_result_stats,test_result_perks,error,pet_intro, imp_confirm,imp_confirm_intro, final_confirm, outcome, pswd_reset, title_text, home, gallery, construction",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				self.clicked_links = {}
				self.impconfirm = {}
				self.logined = g_ImpTest and g_ImpTest.loggedin and (not netInGame or NetIsHost())
				
				AddPageToBrowserHistory("imp")
				
				XDialog.Open(self, ...)
				
				self:SetFocus()
				
				ObjModified("right panel")
				ObjModified("left panel")
				ObjModified("imp header")
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CanClose(self)",
			'func', function (self)
				local popupHost = GetDialog("PDADialog")
				local popup_expected_response = false
				popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")
				if not popupHost then return true end
				
				local hired = self.imp_hired
				if not hired then
					return true
				end
				
				local popup = SpecifyMercSectorPopup({ self.imp_hired })
				popup_expected_response = false
				
				self:CreateThread("popup-response", function()
						local resp = popup:Wait()
						if resp ~= popup_expected_response then return end
						
						self.imp_hired = false
						
						-- Run in another thread as it can call CanClose again.
						local pdaDiag = GetDialog("PDADialog")
						CreateRealTimeThread(function()
							if mode == "close" then
								if mode_param then
									assert(false) -- Hopefully not a thing anymore (explore from browser)
									UIEnterSectorInternal(table.unpack(mode_param))
									return
								end
								pdaDiag:Close()
							elseif mode == "sub_mode" then
								local parentDlg = GetDialog(self.parent)
								if mode_param then
									parentDlg:SetMode(table.unpack(mode_param))
								end
							else
								pdaDiag:SetMode(mode, mode_param, "skip_can_close")
							end
						end)
				end)
				
				return true
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDialogModeChange(self, mode, dialog)",
			'func', function (self, mode, dialog)
				self.logined = g_ImpTest and g_ImpTest.loggedin and (not netInGame or NetIsHost())
				
				-- bottom button toolbar position
				local toolbar = self.idContent.idActionBar
				if mode == "login" or mode == "pswd_reset" or mode == "final_confirm" then
					toolbar:SetMargins(box(0, 10, 0, 0))
					toolbar:SetDock(false)
				else
					toolbar:SetMargins(box(0, 0, 0, 0))
					toolbar:SetDock("bottom")
				end
				
				if mode=="home" or mode=="imp_confirm" or  mode=="imp_confirm_intro" then
					self.idPageTitle:SetText(T(778146627766, "Institute for mercenary profiling"))
				end		
				
				if mode=="login" then
					self.idPageTitle:SetText(T(964519094365, "I.M.P. - Authentication"))
				end
				if mode=="pet_intro" or mode=="test" then
					self.idPageTitle:SetText(T(202272969464, "Personality Evaluation test (P.E.T.)"))
				end
				if mode=="test_result_stats" or mode=="test_result_perks" or mode=="final_confirm" then
					self.idPageTitle:SetText(T(432178756962, "I.M.P. mercenary certificate"))
				end
				
				if mode=="imp_confirm" or mode == "imp_confirm_intro" then
					self.logined = true
					g_ImpTest.loggedin = true
					ObjModified("header links")
				end
				
				if (mode=="start_page" or mode=="imp_confirm") and self.logined and self:GotoLastTestPlace() then
					ObjModified("header links")
					return 
				end
				
				if(mode == "start_page") then
					self:SetMode("home")
					return
				end
				
				if mode == "login" and self.logined then
					self:GotoLastTestPlace()
					return
				end
				
				if mode=="login" then
					self.impconfirm = {}
					self.logined = false
					g_ImpTest.loggedin = false
					ObjModified("header links")
				end
				
				if mode == "test_result_stats" or mode == "test" then
					ObjModified("header links")
				end
				
				if mode == "logout" then
					
					-- consider putting this in a "reset merc function"
					g_ImpTest.confirmed = nil
					g_ImpTest.answers = nil
					g_ImpTest.final = nil
					g_ImpTest.result = nil
					g_ImpTest.last_opened_question = nil
					g_ImpTest.clicked_links = nil
					
					self.impconfirm = {}
					self.logined = false
					g_ImpTest.loggedin = false
					ObjModified("header links")
					self:SetMode("home")
					return
				end
				
				ObjModified("pda_url")
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "GetURL(self, mode, mode_param)",
			'func', function (self, mode, mode_param)
				if mode=="gallery" then
					return Untranslated("http://www.imp.org/gallery")
				elseif mode=="title_text" then
					if mode_param == "contacts" then
						return Untranslated("http://www.imp.org/contacts")
					else
						return Untranslated("http://www.imp.org/testimonials")
					end
				elseif mode == "construction" then
					return Untranslated("http://www.imp.org/construction")
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetMode(self, mode,...)",
			'func', function (self, mode,...)
				if mode~=self.Mode then
					XDialog.SetMode(self, mode, ...)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "GotoLastTestPlace(self)",
			'func', function (self)
				if self.logined and not (g_ImpTest and g_ImpTest.final and g_ImpTest.final.created) then
					if g_ImpTest and g_ImpTest.final and g_ImpTest.confirmed then
						self:SetMode("test_result_stats")
						return true
					end
					
					if not g_ImpTest or not g_ImpTest.last_opened_question then
						self:SetMode("imp_confirm")
						return true
					else
						self:OpenQuestion(g_ImpTest.last_opened_question)
						return true
					end
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source, ...)",
			'func', function (self, shortcut, source, ...)
				--				print("imp",shortcut)
				if shortcut=="ButtonB" or shortcut=="Escape" then
					local host = self.parent
					host = GetDialog(GetDialog(host).parent)
					if host then
						host:CloseAction(host)
					end
					return "break"
				end
				local mode = self:GetMode()
				if mode=="test" or mode=="imp_confirm" or mode=="imp_confirm_intro" or mode=="final_confirm" then
					local 	list = self.idContent.idAnswers.idList
					if shortcut=="DPadUp" or shortcut=="Up" then
						list:SelPrev()
					end
					if shortcut=="DPadDown" or shortcut=="Down" then
						list:SelNext()
					end
				end
				--start_page,login,test,test_result_stats,test_result_perks,error,pet_intro, imp_confirm,imp_confirm_intro, final_confirm, outcome, pswd_reset, title_text, home, gallery
				local actions = self:GetShortcutActions(shortcut)
				for _, action in ipairs(actions) do
				--					print("imp state",action.ActionId, action:ActionState(self))
					local state = action:ActionState(self)
					if state ~= "disabled" and state~="hidden" then
						action:OnAction(self,"gamepad")
						return "break"
					end
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "StartTest(self)",
			'func', function (self)
				g_ImpTest = g_ImpTest or {}
				g_ImpTest.answers = {}
				ResetVisitedHyperlinks(g_ImpTest)
				self:OpenQuestion(1)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OpenQuestion(self, idx)",
			'func', function (self, idx)
				if g_ImpTest then
					g_ImpTest.last_opened_question = idx
					VisitHyperlink(g_ImpTest, "Question_"..tostring(idx))
					if idx == "outcome" then
						GetDialog(self):SetMode("outcome")
					else
						GetDialog(self):SetMode("test")
						self.idContent:SetContext({question = idx, preset = ImpQuestions["Question"..idx] })
					end
					ObjModified("left panel")
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "PrevQuestion(self)",
			'func', function (self)
				local idx = g_ImpTest.last_opened_question - 1
				if idx > 0 then
					self:OpenQuestion(idx)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "NextQuestion(self)",
			'func', function (self)
				local idx = g_ImpTest.last_opened_question + 1
				if idx <= 10 then
					self:OpenQuestion(idx)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CanFinishMercCreation",
			'func', function (self, ...)
				return self:CheckMercName() and self:CheckMercNick() and self:CheckMercStats() and self:CheckMercPerksPersonal() and self:CheckMercPerksTactical()
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CanAdvanceToMercPerks",
			'func', function (self, ...)
				return self:CheckMercName() and self:CheckMercNick() and self:CheckMercStats()
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CheckMercName",
			'func', function (self, ...)
				return g_ImpTest and g_ImpTest.final and g_ImpTest.final.name ~= "" and TDevModeGetEnglishText(g_ImpTest.final.name) ~= ""
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CheckMercNick",
			'func', function (self, ...)
				return g_ImpTest and g_ImpTest.final and g_ImpTest.final.nick ~= "" and TDevModeGetEnglishText(g_ImpTest.final.nick) ~= ""
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CheckMercStats",
			'func', function (self, ...)
				return ImpGetUnassignedStatPoints() >= 0 --属性点未分配完全仍然可以完成IMP创建
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CheckMercPerksPersonal",
			'func', function (self, ...)
				return g_ImpTest.final and g_ImpTest.final.perks and g_ImpTest.final.perks.personal and #g_ImpTest.final.perks.personal == 0 --个性天赋上限
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "CheckMercPerksTactical",
			'func', function (self, ...)
				return g_ImpTest.final and g_ImpTest.final.perks and g_ImpTest.final.perks.tactical and #g_ImpTest.final.perks.tactical >= 2 and #g_ImpTest.final.perks.tactical <= g_MaxTacticalPerksCount --战术天赋上限
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "box",
			'Image', "UI/PDA/imp_background",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "idCloseAction",
			'ActionName', T(208185069032, --[[XTemplate PDAImpDialog ActionName]] "Close"),
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnAction', function (self, host, source, ...)
				local pda = GetDialog("PDADialog")
				pda:CloseAction(host)
			end,
			'FXMouseIn', "buttonRollover",
			'FXPress', "buttonPress",
			'FXPressDisabled', "IactDisabled",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "idPrevAnswer",
			'ActionName', T(457748418323, --[[XTemplate PDAImpDialog ActionName]] "PrevAnswer"),
			'ActionGamepad', "DPadDown",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "idNextAnswer",
			'ActionName', T(623631017672, --[[XTemplate PDAImpDialog ActionName]] "NextAnswer"),
			'ActionGamepad', "DPadUp",
		}),
		PlaceObj('XTemplateWindow', {
			'HAlign', "center",
			'MinWidth', 1076,
			'MaxWidth', 1076,
			'MaxHeight', 849,
		}, {
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateWindow', {
					'comment', "header",
					'__context', function (parent, context) return "imp header" end,
					'Id', "idHeader",
					'IdNode', true,
					'Margins', box(0, 4, 0, 0),
					'Dock', "top",
					'HAlign', "center",
					'VAlign', "top",
					'MinWidth', 1076,
					'MinHeight', 136,
					'MaxWidth', 1076,
					'Background', RGBA(88, 92, 68, 255),
				}, {
					PlaceObj('XTemplateWindow', {
						'Margins', box(26, 0, 26, 0),
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "line",
							'Margins', box(0, 0, 0, 48),
							'VAlign', "bottom",
							'MinHeight', 2,
							'MaxHeight', 2,
							'Background', RGBA(124, 130, 96, 255),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "logo",
							'__class', "XImage",
							'HAlign', "center",
							'VAlign', "center",
							'Image', "UI/PDA/imp_logo",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "update date",
							'__class', "XText",
							'Margins', box(0, 24, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'TextStyle', "PDAIMPHeaderText",
							'Translate', true,
							'Text', T(364351203998, --[[XTemplate PDAImpDialog Text]] "Last updated\nMarch 16 2001"),
						}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 24, 0, 0),
							'HAlign', "right",
							'VAlign', "top",
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateWindow', {
								'comment', "visitors",
								'__class', "XText",
								'HAlign', "right",
								'VAlign', "top",
								'TextStyle', "PDAIMPHeaderText",
								'Translate', true,
								'Text', T(526568593337, --[[XTemplate PDAImpDialog Text]] "Visitors counter"),
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "counter",
								'__context', function (parent, context) return "imp counter" end,
								'__class', "XContextImage",
								'Margins', box(0, -4, 0, 0),
								'HAlign', "right",
								'VAlign', "top",
								'Image', "UI/PDA/imp_counter",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local val = GetImpMenuCounter()
									if not val then
										ImpInitCounter()
										val = GetImpMenuCounter()
									end	
									local digits  = {}
									digits[1] = val/10000
									val = val - digits[1]*10000
									digits[2] = val/1000
									val = val - digits[2]*1000
									digits[3] = val/100
									val = val - digits[3]*100
									digits[4] = val/10
									digits[5] = val%10
									self.idCounter:SetText(table.concat(digits, " "))
								end,
							}, {
								PlaceObj('XTemplateWindow', {
									'comment', "visitors",
									'__class', "XText",
									'Id', "idCounter",
									'Margins', box(2, 0, 0, 0),
									'TextStyle', "PDAIMPCounter",
									'Text', "0 1 2 3 4",
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "links left",
							'__context', function (parent, context) return "header links" end,
							'__class', "XContextWindow",
							'Id', "idLeftLinks",
							'IdNode', true,
							'HAlign', "left",
							'VAlign', "bottom",
							'LayoutMethod', "HList",
							'LayoutHSpacing', 6,
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local test_completed = g_ImpTest and g_ImpTest.confirmed
								self:ResolveId("idLogIn"):SetEnabled(not dlg.logined and not (test_completed and g_ImpTest.final.created))
								self:ResolveId("idIntroduction"):SetEnabled(dlg.logined and not test_completed)
								self:ResolveId("idTest"):SetEnabled(dlg.logined and not test_completed)
								self:ResolveId("idProfile"):SetEnabled(dlg.logined and test_completed)
								self:ResolveId("idHome"):SetEnabled(true)
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'comment', "log in",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idLogIn",
								'LinkId', "login",
								'dlg_mode', "login",
								'Text', T(659488137546, --[[XTemplate PDAImpDialog Text]] "Log In"),
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 22,
								'MaxWidth', 2,
								'MaxHeight', 22,
								'Background', RGBA(124, 130, 96, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "home",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idHome",
								'LinkId', "home",
								'dlg_mode', "home",
								'Text', T(805144021337, --[[XTemplate PDAImpDialog Text]] "Home"),
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 22,
								'MaxWidth', 2,
								'MaxHeight', 22,
								'Background', RGBA(124, 130, 96, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "introduction",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idIntroduction",
								'LinkId', "introduction",
								'dlg_mode', "imp_confirm_intro",
								'Text', T(126748905760, --[[XTemplate PDAImpDialog Text]] "I.M.P."),
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 22,
								'MaxWidth', 2,
								'MaxHeight', 22,
								'Background', RGBA(124, 130, 96, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "test",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idTest",
								'LinkId', "test",
								'Text', T(704793011318, --[[XTemplate PDAImpDialog Text]] "Test"),
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnClick(self, dlg)",
									'func', function (self, dlg)
										if not g_ImpTest.last_opened_question then 
											GetDialog(self):StartTest()
										else
											GetDialog(self):OpenQuestion(g_ImpTest.last_opened_question)
										end
									end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 22,
								'MaxWidth', 2,
								'MaxHeight', 22,
								'Background', RGBA(124, 130, 96, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "profile",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idProfile",
								'LinkId', "profile",
								'dlg_mode', "test_result_stats",
								'Text', T(156322128717, --[[XTemplate PDAImpDialog Text]] "Profile"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "links right",
							'__context', function (parent, context) return "header links" end,
							'__class', "XContextWindow",
							'IdNode', true,
							'HAlign', "right",
							'VAlign', "bottom",
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								self.idLogOut:SetEnabled(dlg.logined)
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'comment', "log out",
								'__template', "PDAImpHyperlinkHeader",
								'Id', "idLogOut",
								'LinkId', "logout",
								'dlg_mode', "logout",
								'Text', T(761514198458, --[[XTemplate PDAImpDialog Text]] "Log out"),
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnClick(self, dlg)",
									'func', function (self, dlg)
										g_ImpTest.loggedin=false
										dlg:SetMode(self.dlg_mode)
									end,
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "footer",
					'__context', function (parent, context) return "imp footer" end,
					'Id', "idFooter",
					'Dock', "bottom",
					'VAlign', "bottom",
				}, {
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "VList",
						'LayoutVSpacing', 20,
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "links",
							'HAlign', "center",
							'VAlign', "top",
							'LayoutMethod', "HList",
							'LayoutHSpacing', 8,
						}, {
							PlaceObj('XTemplateTemplate', {
								'comment', "rss feed",
								'__template', "PDAImpHyperlink",
								'HAlign', "center",
								'MinHeight', 20,
								'LinkId', "browse",
								'Text', T(212384058717, --[[XTemplate PDAImpDialog Text]] "RSS Feed"),
								'TextHAlign', "center",
								'TextVAlign', "center",
								'ErrParam', "Error404",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 20,
								'MaxWidth', 2,
								'MaxHeight', 20,
								'Background', RGBA(76, 62, 255, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "service",
								'__template', "PDAImpHyperlink",
								'HAlign', "center",
								'MinHeight', 20,
								'LinkId', "service",
								'Text', T(821269390672, --[[XTemplate PDAImpDialog Text]] "Services"),
								'TextHAlign', "center",
								'TextVAlign', "center",
								'ErrParam', "Error408",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 20,
								'MaxWidth', 2,
								'MaxHeight', 20,
								'Background', RGBA(76, 62, 255, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "search",
								'__template', "PDAImpHyperlink",
								'HAlign', "center",
								'MinHeight', 20,
								'OnContextUpdate', function (self, context, ...)
									XContextWindow.OnContextUpdate(self, context)
									local dlg =  GetDialog(self)
									local pdaBrowser = GetPDABrowserDialog()
									-- VisitHyperlink(pdaBrowser, "PDABrowserErrorBack")
									if HyperlinkVisited(pdaBrowser, self:GetProperty("LinkId")) then
										self.idLink:SetTextStyle("PDAIMPHyperLinkClicked")
										self.idLink:OnSetRollover(true)
									end
								end,
								'LinkId', "search",
								'Text', T(111393156310, --[[XTemplate PDAImpDialog Text]] "Search"),
								'TextHAlign', "center",
								'TextVAlign', "center",
								'ErrParam', "Error500",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 20,
								'MaxWidth', 2,
								'MaxHeight', 20,
								'Background', RGBA(76, 62, 255, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "help",
								'__template', "PDAImpHyperlink",
								'HAlign', "center",
								'MinHeight', 20,
								'LinkId', "help",
								'Text', T(296296892071, --[[XTemplate PDAImpDialog Text]] "Help"),
								'TextHAlign', "center",
								'TextVAlign', "center",
								'ErrParam', "UnderConstruction",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnClick(self, dlg)",
									'func', function (self, dlg)
										dlg:SetMode("construction")
									end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "line",
								'HAlign', "center",
								'VAlign', "center",
								'MinWidth', 2,
								'MinHeight', 20,
								'MaxWidth', 2,
								'MaxHeight', 20,
								'Background', RGBA(76, 62, 255, 255),
							}),
							PlaceObj('XTemplateTemplate', {
								'comment', "contacts",
								'__template', "PDAImpHyperlink",
								'HAlign', "center",
								'MinHeight', 20,
								'LinkId', "contacts",
								'Text', T(687237737248, --[[XTemplate PDAImpDialog Text]] "Contacts"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnClick(self, dlg)",
									'func', function (self, dlg)
										dlg:SetMode("title_text","contacts")
									end,
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplate",
					'IdNode', false,
					'HAlign', "center",
					'MinWidth', 1076,
					'MaxWidth', 1076,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idPageTitle",
						'HAlign', "center",
						'VAlign', "top",
						'MinWidth', 56,
						'MinHeight', 56,
						'TextStyle', "PDAIMPPageTitle",
						'Translate', true,
						'Text', T(589427374438, --[[XTemplate PDAImpDialog Text]] "Institute for mercenary profiling"),
						'TextHAlign', "center",
						'TextVAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 56, 0, 8),
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "left",
							'__context', function (parent, context) return "left panel" end,
							'__class', "XContentTemplate",
							'Id', "idLeft",
							'IdNode', false,
							'Dock', "left",
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 180,
							'MinHeight', 560,
							'MaxWidth', 180,
							'Background', RGBA(230, 222, 202, 255),
						}, {
							PlaceObj('XTemplateWindow', {
								'Margins', box(20, 20, 0, 0),
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateMode', {
									'mode', "test,outcome",
								}, {
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return {1,2,3,4,5,6,7,8,9,10} end,
										'run_after', function (child, context, item, i, n, last)
											local hyperlink = Untranslated("<h OpenQuestion "..i.." IMP>")
											child.idText:SetText(T{604647005264, "<underline><hl>Question</underline></h> <style PDAIMPHyperLinkSuffix>(<idx>)</style>", hl = hyperlink, idx = i })
											child.idText:SetTextStyle(
												i == g_ImpTest.last_opened_question and "PDAIMPHyperLinkSelected" or
												(HyperlinkVisited(g_ImpTest, "Question_" .. tostring(i)) and "PDAIMPHyperLinkClicked"  or "PDAIMPHyperLink"))
										end,
									}, {
										PlaceObj('XTemplateWindow', {
											'IdNode', true,
											'LayoutMethod', "HList",
											'MouseCursor', "UI/Cursors/Pda_Hand.tga",
										}, {
											PlaceObj('XTemplateWindow', {
												'Margins', box(5, 0, 0, 0),
												'LayoutMethod', "VList",
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XText",
													'Id', "idText",
													'MouseCursor', "UI/Cursors/Pda_Hand.tga",
													'FXMouseIn', "buttonRollover",
													'FXPress', "buttonPress",
													'FXPressDisabled', "IactDisabled",
													'TextStyle', "PDAIMPHyperLink",
													'Translate', true,
													'Text', T(277259125133, --[[XTemplate PDAImpDialog Text]] "Question"),
												}, {
													PlaceObj('XTemplateFunc', {
														'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
														'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
															if hyperlink=="OpenQuestion" then
																GetDialog(self):OpenQuestion(argument)
															end
														end,
													}),
													}),
												}),
											}),
										}),
									PlaceObj('XTemplateWindow', {
										'IdNode', true,
										'LayoutMethod', "HList",
									}, {
										PlaceObj('XTemplateWindow', {
											'Margins', box(5, 0, 0, 0),
											'LayoutMethod', "VList",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'Id', "idText",
												'MouseCursor', "UI/Cursors/Pda_Hand.tga",
												'FXMouseIn', "buttonRollover",
												'FXPress', "buttonPress",
												'FXPressDisabled', "IactDisabled",
												'TextStyle', "PDAIMPHyperLink",
												'Translate', true,
												'Text', T(701534057921, --[[XTemplate PDAImpDialog Text]] "Question"),
											}, {
												PlaceObj('XTemplateFunc', {
													'name', "OnMouseButtonDown(self, pos, button)",
													'func', function (self, pos, button)
														GetDialog(self):OpenQuestion("outcome")
													end,
												}),
												PlaceObj('XTemplateFunc', {
													'name', "Open",
													'func', function (self, ...)
														self:SetText(T(177052366651, --[[XTemplate PDAImpOutcome Text]] "<underline>Outcome</underline>"))
														self:SetTextStyle(
															g_ImpTest.last_opened_question == "outcome" and "PDAIMPHyperLinkSelected" or
															(HyperlinkVisited(g_ImpTest, "Question_outcome") and "PDAIMPHyperLinkClicked" or "PDAIMPHyperLink"))
													end,
												}),
												}),
											}),
										}),
									}),
								PlaceObj('XTemplateMode', {
									'mode', "home,login,logout,test_result_stats,test_result_perks,error,pswd_reset,pet_intro, imp_confirm,imp_confirm_intro, final_confirm, title_text, home, gallery, construction",
								}, {
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return ImpLeftPageLinks() end,
										'run_after', function (child, context, item, i, n, last)
											child.idLink:SetLinkId(item.link_id)
											child.idLink:SetText(item.text)
											local dlg = GetDialog(child)
											child.idLink.idLink:SetTextStyle(dlg.clicked_links and dlg.clicked_links[item.link_id] and "PDAIMPHyperLinkClicked"  or "PDAIMPHyperLink")
											if item.error then
												child.idLink:SetErrParam(item.error)
											end
											if item.link_id=="mercs" then	
												child.idLink.OnClick = function(this, dlg)
														dlg:SetMode("title_text","words")
												end
											end
											if item.link_id=="gallery" then
												child.idLink.OnClick = function(this, dlg)
														dlg:SetMode("gallery")
												end
											end
										end,
									}, {
										PlaceObj('XTemplateWindow', {
											'IdNode', true,
											'LayoutMethod', "HList",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XImage",
												'Image', "UI/PDA/hm_circle",
												'ImageScale', point(600, 600),
												'ImageColor', RGBA(0, 0, 0, 255),
											}),
											PlaceObj('XTemplateTemplate', {
												'__template', "PDAImpHyperlink",
												'Id', "idLink",
												'Margins', box(5, 0, 0, 0),
											}),
											}),
										}),
									}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(10, 0, 10, 20),
								'Dock', "box",
								'HAlign', "left",
								'VAlign', "bottom",
								'TextStyle', "PDAIMPCopyrightText",
								'Translate', true,
								'Text', T(236432374390, --[[XTemplate PDAImpDialog Text]] "<copyright> IMP Corp 2001"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "right",
							'__context', function (parent, context) return "right panel" end,
							'__class', "XContextWindow",
							'Id', "idRight",
							'IdNode', true,
							'Dock', "right",
							'HAlign', "right",
							'VAlign', "top",
							'MinWidth', 180,
							'MinHeight', 560,
							'MaxWidth', 180,
							'LayoutMethod', "VList",
							'Background', RGBA(230, 222, 202, 255),
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
								XContextWindow.OnContextUpdate(self, context, ...)
								local hyperlink = Untranslated("<h OpenMonthMerc month_merc IMP underline>")
								self.idText:SetText(T{225920505057, "<hl><underline>A.I.M. merc of the month<underline></h>", hl=hyperlink})
								self.idDots:SetText(T{312104275561, "<hl><underline>...<underline></h>", hl=hyperlink})
								local dlg = GetDialog(self)
								self.idText:SetTextStyle(dlg.clicked_links["month_merc"] and "PDAIMPHyperLinkClicked"  or "PDAIMPHyperLink")
								
								local data = ImpMercOfTheMonth()
								if data then
									self.idPortrait:SetImage(data.Portrait)
									self.idName:SetText(data.Name)
									self.idBio:SetText(data.Bio)
								end
							end,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(16, 20, 16, 0),
								'Dock', "top",
								'HAlign', "left",
								'VAlign', "top",
								'MinWidth', 140,
								'MaxWidth', 140,
								'MouseCursor', "UI/Cursors/Pda_Hand.tga",
								'FXMouseIn', "buttonRollover",
								'FXPress', "buttonPress",
								'FXPressDisabled', "IactDisabled",
								'TextStyle', "PDAIMPHyperLink",
								'Translate', true,
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
									'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
										if  hyperlink=="OpenMonthMerc" then
											PlayFX("buttonPress","start") 
											self:SetTextStyle("PDAIMPHyperLinkClicked")
											local dlg = GetDialog(self)
											dlg.clicked_links[argument] = true	
											OpenAIMAndSelectMerc(g_ImpTest.month_merc)
										end
									end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'Margins', box(16, 0, 16, 0),
								'Dock', "top",
								'HAlign', "left",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idPortraitBG",
									'IdNode', false,
									'MinWidth', 120,
									'MinHeight', 136,
									'MaxWidth', 120,
									'MaxHeight', 136,
									'Image', "UI/Hud/portrait_background",
									'ImageFit', "stretch",
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idPortrait",
									'MinWidth', 120,
									'MinHeight', 136,
									'MaxWidth', 120,
									'MaxHeight', 136,
									'Image', "UI/MercsPortraits/Igor",
									'ImageFit', "stretch",
									'ImageRect', box(36, 0, 264, 251),
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idName",
								'Margins', box(16, 10, 16, 0),
								'Dock', "top",
								'MinWidth', 140,
								'MaxWidth', 140,
								'TextStyle', "PDAIMPMercName",
								'Translate', true,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idDots",
								'Margins', box(16, -10, 16, 16),
								'Padding', box(4, 2, 2, 2),
								'Dock', "bottom",
								'HAlign', "left",
								'VAlign', "top",
								'MinWidth', 140,
								'MaxWidth', 140,
								'MouseCursor', "UI/Cursors/Pda_Hand.tga",
								'FXMouseIn', "buttonRollover",
								'FXPress', "buttonPress",
								'FXPressDisabled', "IactDisabled",
								'TextStyle', "PDAIMPHyperLink",
								'Translate', true,
								'Text', T(804387271590, --[[XTemplate PDAImpDialog Text]] "..."),
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
									'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
										if  hyperlink=="OpenMonthMerc" then
											PlayFX("buttonPress","start") 
											self:SetTextStyle("PDAIMPHyperLinkClicked")
											local dlg = GetDialog(self)
											dlg.clicked_links[argument] = true	
											OpenAIMAndSelectMerc(g_ImpTest.month_merc)
										end
									end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idBio",
								'Margins', box(16, 5, 16, 0),
								'Dock', "top",
								'VAlign', "top",
								'MinWidth', 140,
								'MinHeight', 276,
								'MaxWidth', 140,
								'MaxHeight', 276,
								'OnLayoutComplete', function (self)
									-- to prevent text from being cut-off at the bottom, we force the content_box to be an integer multiple of the line size (which is font_height plus line_height)
									local old_height = self.content_box:maxy() - self.content_box:miny()
									local line_height = self.font_height + self.font_linespace
									local new_height = floatfloor(old_height/line_height)*line_height
									
									-- 0.9 was eyeballed for no visible cutoff; removing the line would create too much empty space
									if ((0.0 + old_height)/line_height) % 1 <= 0.9  then
										local cb = self.content_box
										self.content_box = box(cb:minx(), cb:miny(), cb:maxx(), cb:miny() + new_height)
									end
								end,
								'TextStyle', "PDAIMPMercBio",
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "center",
							'__class', "XContentTemplate",
							'Id', "idContent",
							'Margins', box(8, 0, 8, 0),
							'HAlign', "center",
							'VAlign', "top",
							'MinWidth', 700,
							'MinHeight', 560,
							'MaxWidth', 700,
							'LayoutMethod', "VList",
							'OnContextUpdate', function (self, context, ...)
								XContentTemplate.OnContextUpdate(self, context,...)
								local dlg = GetDialog(self)
								if dlg:GetMode()=="test" then
									dlg.mode_param = Untranslated("Question"..context.question)
									ObjModified("pda_url")
								end
							end,
						}, {
							PlaceObj('XTemplateMode', {
								'mode', "test",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpAnswers",
									'HeaderButtonId', "idTest",
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idStartOver",
									'ActionName', T(640196796709, --[[XTemplate PDAImpDialog ActionName]] "Start Over"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "LeftThumbClick",
									'OnAction', function (self, host, source, ...)
										host:StartTest()
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idSkip",
									'ActionName', T(808369493896, --[[XTemplate PDAImpDialog ActionName]] "Skip"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightThumbClick",
									'ActionState', function (self, host)
										local context = host.idContent:GetContext()
										local idx = context and context.question or 0
										return idx ~= 10 and "enabled" or "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										host:OpenQuestion("outcome")
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idPrev",
									'ActionName', T(549570728431, --[[XTemplate PDAImpDialog ActionName]] "Prev"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "LeftShoulder",
									'ActionState', function (self, host)
										local context = host.idContent:GetContext()
										local idx = context and context.question or 0
										return idx > 1 and "enabled" or "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										host:PrevQuestion()
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idNext",
									'ActionName', T(655064233565, --[[XTemplate PDAImpDialog ActionName]] "Next"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightShoulder",
									'ActionState', function (self, host)
										local context = host and host.idContent:GetContext()
										local idx = context and context.question or 0
										if idx == 10 then return "hidden" end
										if not context then return "disabled" end
										local item_idx = table.find(g_ImpTest.answers, "id",  context.preset.id)
										if g_ImpTest.answers[item_idx] then return "enabled" end
										return "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										host:NextQuestion()
									end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "idFinish",
									'ActionName', T(426594514812, --[[XTemplate PDAImpDialog ActionName]] "Finish"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightShoulder",
									'ActionState', function (self, host)
										local context = host and host.idContent:GetContext()
										local idx = context and context.question or 0
										if idx < 10 then return "hidden" end
										local item_idx = table.find(g_ImpTest.answers, "id",  context.preset.id)
										if g_ImpTest.answers[item_idx] then return "enabled" end
										return "disabled"
									end,
									'OnAction', function (self, host, source, ...)
										host:OpenQuestion("outcome")
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "test_result_stats",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__context', function (parent, context) return CreateImpTestResultContext() end,
									'__template', "PDAImpResultMerc",
									'HeaderButtonId', "idProfile",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "perks",
									'ActionId', "idPerks",
									'ActionName', T(655064233565, --[[XTemplate PDAImpDialog ActionName]] "Next"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightShoulder",
									'ActionState', function (self, host)
										return GetDialog(self.host):CanAdvanceToMercPerks() and "enabled" or "disabled"
									end,
									'OnActionEffect', "mode",
									'OnActionParam', "test_result_perks",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "test_result_perks",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__context', function (parent, context) return CreateImpTestResultContext() end,
									'__template', "PDAImpResultMerc",
									'HeaderButtonId', "idProfile",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "stats",
									'ActionId', "idStats",
									'ActionName', T(549570728431, --[[XTemplate PDAImpDialog ActionName]] "Prev"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "LeftShoulder",
									'OnActionEffect', "mode",
									'OnActionParam', "test_result_stats",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "done",
									'ActionId', "idDone",
									'ActionName', T(131832481511, --[[XTemplate PDAImpDialog ActionName]] "Done"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'ActionState', function (self, host)
										return GetDialog(self.host):CanFinishMercCreation() and "enabled" or "disabled"
									end,
									'OnActionEffect', "mode",
									'OnActionParam', "final_confirm",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "home",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpStartPage",
									'HeaderButtonId', "idHome",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idOK",
									'ActionName', T(175732041340, --[[XTemplate PDAImpDialog ActionName]] "OK"),
									'ActionToolbar', "ActionBar",
									'ActionShortcut', "Enter",
									'ActionGamepad', "ButtonX",
									'ActionState', function (self, host)--启用创建IMP按钮（多个IMP功能解锁）
										return "enabled"
									end,
									'OnActionEffect', "mode",
									'OnActionParam', "login",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "login",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpLogIn",
									'HeaderButtonId', "idLogIn",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idOK",
									'ActionName', T(175732041340, --[[XTemplate PDAImpDialog ActionName]] "OK"),
									'ActionToolbar', "ActionBar",
									'ActionShortcut', "Enter",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "mode",
									'OnActionParam', "imp_confirm",
									'OnAction', function (self, host, source, ...)
										local ctrl = host.idContent.idLogInInfo
										local text  = ctrl.idEditPswd:GetText()
										local passCheck = string.lower(text) == string.lower(const.Imp.TestPswd)
										local netCheck = not netInGame or NetIsHost()
										if netCheck and passCheck then
											host:SetMode("imp_confirm")
											g_ImpTest.loggedin = true
										else
											local presets = not passCheck and Presets.IMPErrorPswdTexts.Default or Presets.IMPErrorNetClientTexts.Default
											local count = #presets
											local login_err_idx = (g_ImpTest.login_err_idx or 0) + 1
											if login_err_idx> count then
												login_err_idx = 1
											end
											g_ImpTest.login_err_idx = login_err_idx
											ctrl.idError:SetText(presets[login_err_idx].text)
											ctrl.idError:SetVisible(true)
										end
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "imp_confirm,imp_confirm_intro",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpConfirm",
									'HeaderButtonId', "idIntroduction",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idOK",
									'ActionName', T(655064233565, --[[XTemplate PDAImpDialog ActionName]] "Next"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'ActionState', function (self, host)
										return (host.impconfirm.next or  host.impconfirm.skip) and "enabled" or "disabled"
									end,
									'OnActionParam', "pet_intro",
									'OnAction', function (self, host, source, ...)
										if host.impconfirm.next then
											host:SetMode("pet_intro")
										elseif host.impconfirm.skip then
											g_ImpTest.confirmed = true
											host:SetMode("test_result_stats")
										end
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "final_confirm",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpFinalConfirm",
									'HeaderButtonId', "idProfile",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "done",
									'ActionId', "idSelect",
									'ActionName', T(993621221616, --[[XTemplate PDAImpDialog ActionName]] "Select"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'ActionState', function (self, host)
										return (host.impconfirm.confirm and CanPay(const.Imp.CertificateCost) or host.impconfirm.back) and "enabled" or "disabled"--启用多个IMP佣兵证书支付按钮
									end,
									'OnAction', function (self, host, source, ...)
										if host.impconfirm.confirm and CanPay(const.Imp.CertificateCost) then
											local merc_id = g_ImpTest.final.merc_template.id
											g_ImpTest.final.created = true
											g_ImpTest.loggedin = false
											SetCustomFilteredUserTexts({ g_ImpTest.final.name, g_ImpTest.final.nick }) -- in case My Team is open before player open IMPWeb to create merc; the UI updates before the NetSync event runs and attempts to translate the user texts
											NetSyncEvent("HireIMPMerc", g_ImpTest, merc_id, const.Imp.CertificateCost)
											SpecifyMercSectorPopup({ merc_id })
											OpenAIMAndSelectMerc()
										elseif host.impconfirm.back then
											host:SetMode("test_result_stats")
										end
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "pet_intro",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpPETIntro",
									'HeaderButtonId', "idTest",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idTest",
									'ActionName', T(728933977679, --[[XTemplate PDAImpDialog ActionName]] "Test"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnAction', function (self, host, source, ...)
										host:StartTest()
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "outcome",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__context', function (parent, context) return CreateImpTestResultContext() end,
									'__template', "PDAImpOutcome",
									'HeaderButtonId', "idTest",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "back",
									'ActionId', "idBack",
									'ActionName', T(351426544644, --[[XTemplate PDAImpDialog ActionName]] "Back"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "LeftShoulder",
									'OnAction', function (self, host, source, ...)
										GetDialog(host):OpenQuestion(10)
									end,
								}),
								PlaceObj('XTemplateAction', {
									'comment', "confirm",
									'ActionId', "idConfirm",
									'ActionName', T(524975808890, --[[XTemplate PDAImpDialog ActionName]] "Confirm"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnAction', function (self, host, source, ...)
										g_ImpTest.confirmed = true
										host:SetMode("test_result_stats")
									end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "title_text",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpText",
									'HeaderButtonId', "idHome",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idBack",
									'ActionName', T(351426544644, --[[XTemplate PDAImpDialog ActionName]] "Back"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "back",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "pswd_reset",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpPswdReset",
									'HeaderButtonId', "idLogIn",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idBack",
									'ActionName', T(351426544644, --[[XTemplate PDAImpDialog ActionName]] "Back"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "back",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "gallery",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpGallery",
									'HeaderButtonId', "idHome",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idBack",
									'ActionName', T(467176861358, --[[XTemplate PDAImpDialog ActionName]] "Back"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "back",
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "construction",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PDAImpErrorConstruction",
									'HeaderButtonId', "idHome",
								}),
								PlaceObj('XTemplateAction', {
									'comment', "ok",
									'ActionId', "idBack",
									'ActionName', T(971938007854, --[[XTemplate PDAImpDialog ActionName]] "Back"),
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "back",
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__context', function (parent, context) return "action bar" end,
								'__class', "XToolBarList",
								'Id', "idActionBar",
								'ZOrder', 3,
								'Dock', "bottom",
								'HAlign', "center",
								'VAlign', "bottom",
								'LayoutHSpacing', 20,
								'DrawOnTop', true,
								'Background', RGBA(255, 255, 255, 0),
								'Toolbar', "ActionBar",
								'Show', "text",
								'ButtonTemplate', "PDACommonButtonIMP",
							}),
							}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return not InitialConflictNotStarted() end,
			'__template', "PDAStartButton",
			'Dock', "box",
			'VAlign', "bottom",
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
		PlaceObj('XTemplateTemplate', {
			'__template', "PDABrowserBanners",
		}),
		}),
})
-- ========== GENERATED BY XTemplate Editor (Alt-F3) DO NOT EDIT MANUALLY! ==========
PlaceObj('XTemplate', {
	group = "Zulu PDA",
	id = "PDAImpResultMerc",
	PlaceObj('XTemplateProperty', {
		'id', "HeaderButtonId",
		'editor', "text",
		'translate', false,
		'Set', function (self, value)
			self.HeaderButtonId = value
		end,
		'Get', function (self)
			return self.HeaderButtonId
		end,
		'name', T(727563685948, --[[XTemplate PDAImpResultMerc name]] "HeaderButtonId"),
	}),
	PlaceObj('XTemplateWindow', {
		'LayoutMethod', "VList",
		'LayoutVSpacing', 8,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				XWindow.Open(self,...)
				local nameEdit = self:ResolveId("idMercInfo"):ResolveId("idEditName")
				local nickEdit = self:ResolveId("idMercInfo"):ResolveId("idEditNick")
				if not GetUIStyleGamepad() then
					nameEdit:SetFocus(true)
					nameEdit:SetFocusOrder(point(0,0))
					nickEdit:SetFocusOrder(point(0, 1))
				else
					nameEdit:SetFocusOrder(false)
					nickEdit:SetFocusOrder(false)
				end
				PDAImpHeaderEnable(self)
				ObjModified(g_ImpTest.final)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
				XWindow.OnDelete(self,...)
				PDAImpHeaderDisable(self)
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return CreateImpTestPortraitContext() end,
			'__class', "XContextFrame",
			'Id', "idMercInfo",
			'Image', "UI/PDA/imp_panel",
			'FrameBox', box(8, 8, 8, 8),
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
				assert(g_ImpTest.final.nick and g_ImpTest.final.name)
				self.idEditName:SetText(g_ImpTest.final.name)
				self.idEditNick:SetText(g_ImpTest.final.nick)
				self.idRemPoints:SetText(ImpGetUnassignedStatPoints())
			end,
		}, {
			PlaceObj('XTemplateWindow', {
				'Margins', box(16, 12, 12, 12),
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateTemplate', {
					'comment', "prev",
					'__template', "PDASmallButton",
					'VAlign', "center",
					'MinWidth', 24,
					'MinHeight', 24,
					'MaxWidth', 24,
					'MaxHeight', 24,
					'ScaleModifier', point(1000, 1000),
					'OnPress', function (self, gamepad)
						local idx = g_ImpTest.final.merc_template.idx
						local imppresets = Presets.UnitDataCompositeDef.IMP
						idx = idx-1
						if idx<1 then
							idx = #imppresets
						end
						local preset = imppresets[idx]
						g_ImpTest.final.merc_template= {idx =idx, id = preset.id}
						local node= self:ResolveId("node")
						node.idPortrait:SetContext(preset, true)
					end,
					'FlipX', true,
					'CenterImage', "UI/PDA/T_Icon_Play",
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(4, 0, 0, 0),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'IdNode', false,
						'MinWidth', 120,
						'MinHeight', 136,
						'MaxWidth', 120,
						'MaxHeight', 136,
						'Image', "UI/Hud/portrait_background",
						'ImageFit', "stretch",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XContextImage",
						'Id', "idPortrait",
						'MinWidth', 120,
						'MinHeight', 136,
						'MaxWidth', 120,
						'MaxHeight', 136,
						'Image', "UI/MercsPortraits/Igor",
						'ImageFit', "largest",
						'ImageRect', box(14, 0, 282, 273),
						'ContextUpdateOnOpen', true,
						'OnContextUpdate', function (self, context, ...)
							self:SetImage(context.Portrait)
						end,
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "next",
					'__template', "PDASmallButton",
					'Margins', box(4, 0, 0, 0),
					'VAlign', "center",
					'MinWidth', 24,
					'MinHeight', 24,
					'MaxWidth', 24,
					'MaxHeight', 24,
					'ScaleModifier', point(1000, 1000),
					'OnPress', function (self, gamepad)
						local idx = g_ImpTest.final.merc_template.idx
						local imppresets = Presets.UnitDataCompositeDef.IMP
						idx = idx+1
						if idx>#imppresets then
							idx = 1
						end
						local preset = imppresets[idx]
						g_ImpTest.final.merc_template= {idx =idx, id = preset.id}
						local node= self:ResolveId("node")
						node.idPortrait:SetContext(preset, true)
					end,
					'CenterImage', "UI/PDA/T_Icon_Play",
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 0, 0, 0),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'IdNode', false,
						'Image', "UI/PDA/imp_panel_2",
						'FrameBox', box(5, 5, 5, 5),
					}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(8, 12, 4, 4),
						'VAlign', "center",
						'MinWidth', 465,
						'MaxWidth', 465,
						'LayoutMethod', "VList",
						'LayoutVSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'VAlign', "center",
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__context', function (parent, context) return g_ImpTest.final end,
								'__class', "XText",
								'Id', "idName",
								'HAlign', "left",
								'VAlign', "center",
								'MinWidth', 140,
								'MaxWidth', 140,
								'HandleMouse', false,
								'TextStyle', "PDAIMPContentTitle",
								'OnContextUpdate', function (self, context, ...)
									self:SetTextStyle(GetDialog(self):CheckMercName() and "PDAIMPContentTitle" or "PDAIMPContentTitleRed")
								end,
								'Translate', true,
								'Text', T(980371909346, --[[XTemplate PDAImpResultMerc Text]] "Name"),
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XFrame",
								'IdNode', false,
								'HAlign', "right",
								'VAlign', "center",
								'MinWidth', 324,
								'MinHeight', 39,
								'MaxWidth', 324,
								'Image', "UI/PDA/imp_bar",
								'FrameBox', box(5, 5, 5, 5),
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XEdit",
									'Id', "idEditName",
									'Margins', box(10, 0, 10, 0),
									'BorderWidth', 0,
									'HAlign', "center",
									'VAlign', "center",
									'MinWidth', 324,
									'MaxWidth', 324,
									'Background', RGBA(240, 240, 240, 0),
									'MouseCursor', "UI/Cursors/Pda_Hand.tga",
									'FocusOrder', point(0, 0),
									'FocusedBorderColor', RGBA(240, 240, 240, 0),
									'FocusedBackground', RGBA(240, 240, 240, 0),
									'DisabledBorderColor', RGBA(240, 240, 240, 0),
									'DisabledBackground', RGBA(240, 240, 240, 0),
									'TextStyle', "PDAIMPEdit",
									'UserText', true,
									'UserTextType', "name",
									'OnTextChanged', function (self)
										g_ImpTest.final.name = self:GetText()
										PlayFX("Typing", "start")
										GetDialog(self):ActionsUpdated()
										ObjModified(g_ImpTest.final)
									end,
									'MaxLen', 20,
									'AutoSelectAll', true,
									'HintColor', RGBA(240, 240, 240, 0),
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source, ...)",
										'func', function (self, shortcut, source, ...)
											if GetUIStyleGamepad() then return "break" end
											if shortcut == "Enter" or shortcut == "Tab" or shortcut == "Shift-Tab" then
												local dir = shortcut == "Shift-Tab" and "prev" or "next"
												local focus = self:ResolveId("node"):GetRelativeFocus(self.desktop:GetKeyboardFocus():GetFocusOrder(), dir)
												self:SetFocus(false)
												if focus then 
													focus:SetFocus()
												end
												return "break"
											elseif shortcut == "Escape" then
												-- shortcut is ignored and will be passed onto the close dialog action
											else
												return XEdit.OnShortcut(self, shortcut, source)
											end
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnSetFocus(self, old_focus)",
										'func', function (self, old_focus)
											if GetUIStyleGamepad() then
												self:OpenControllerTextInput()
												self:SetFocus(false)
											else
												XEdit.OnSetFocus(self, old_focus)
											end
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnKillFocus",
										'func', function (self, ...)
											if self:GetText() then
												g_ImpTest.final.name = self:GetText()
											end
											XEdit.OnKillFocus(self)
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnMouseButtonDoubleClick(self, pos, button)",
										'func', function (self, pos, button)
											if GetUIStyleGamepad() then return "break" end
										end,
									}),
									}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__context', function (parent, context) return g_ImpTest.final end,
								'__class', "XText",
								'Id', "idNick",
								'HAlign', "left",
								'VAlign', "center",
								'MinWidth', 140,
								'MaxWidth', 140,
								'HandleMouse', false,
								'TextStyle', "PDAIMPContentTitle",
								'OnContextUpdate', function (self, context, ...)
									self:SetTextStyle(GetDialog(self):CheckMercNick() and "PDAIMPContentTitle" or "PDAIMPContentTitleRed")
								end,
								'Translate', true,
								'Text', T(235545241609, --[[XTemplate PDAImpResultMerc Text]] "Nickname"),
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XFrame",
								'IdNode', false,
								'HAlign', "right",
								'VAlign', "center",
								'MinWidth', 324,
								'MinHeight', 39,
								'MaxWidth', 324,
								'Image', "UI/PDA/imp_bar",
								'FrameBox', box(5, 5, 5, 5),
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XEdit",
									'Id', "idEditNick",
									'Margins', box(10, 0, 10, 0),
									'BorderWidth', 0,
									'HAlign', "center",
									'VAlign', "center",
									'MinWidth', 324,
									'MaxWidth', 324,
									'Background', RGBA(240, 240, 240, 0),
									'MouseCursor', "UI/Cursors/Pda_Hand.tga",
									'FocusOrder', point(0, 1),
									'FocusedBorderColor', RGBA(240, 240, 240, 0),
									'FocusedBackground', RGBA(240, 240, 240, 0),
									'DisabledBorderColor', RGBA(240, 240, 240, 0),
									'DisabledBackground', RGBA(240, 240, 240, 0),
									'TextStyle', "PDAIMPEdit",
									'UserText', true,
									'UserTextType', "name",
									'OnTextChanged', function (self)
										g_ImpTest.final.nick = self:GetText()
										PlayFX("Typing", "start")
										GetDialog(self):ActionsUpdated()
										ObjModified(g_ImpTest.final)
									end,
									'MaxLen', 8,
									'AutoSelectAll', true,
									'HintColor', RGBA(240, 240, 240, 0),
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source, ...)",
										'func', function (self, shortcut, source, ...)
											if GetUIStyleGamepad() then return "break" end
											if shortcut == "Enter" or shortcut == "Tab" or shortcut == "Shift-Tab" then
												local dir = shortcut == "Shift-Tab" and "prev" or "next"
												local focus = self:ResolveId("node"):GetRelativeFocus(self.desktop:GetKeyboardFocus():GetFocusOrder(), dir)
												self:SetFocus(false)
												if focus then 
													focus:SetFocus()
												end
												return "break"
											elseif shortcut == "Escape" then
												-- shortcut is ignored and will be passed onto the close dialog action
											else
												return XEdit.OnShortcut(self, shortcut, source)
											end
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnKillFocus",
										'func', function (self, ...)
											if self:GetText() then
												g_ImpTest.final.nick = self:GetText()
											end
											XEdit.OnKillFocus(self)
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnSetFocus(self, old_focus)",
										'func', function (self, old_focus)
											if GetUIStyleGamepad() then
												self:OpenControllerTextInput()
												self:SetFocus(false)
											else
												XEdit.OnSetFocus(self, old_focus)
											end
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnMouseButtonDoubleClick(self, pos, button)",
										'func', function (self, pos, button)
											if GetUIStyleGamepad() then return "break" end
										end,
									}),
									}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'VAlign', "center",
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__context', function (parent, context) return g_ImpTest.final end,
								'__class', "XText",
								'Id', "idtxtRemPoints",
								'HAlign', "left",
								'VAlign', "center",
								'MinWidth', 340,
								'MaxWidth', 340,
								'HandleMouse', false,
								'TextStyle', "PDAIMPContentTitle",
								'OnContextUpdate', function (self, context, ...)
									self:SetTextStyle(GetDialog(self):CheckMercStats() and "PDAIMPContentTitle" or "PDAIMPContentTitleRed")
								end,
								'Translate', true,
								'Text', T(289079036582, --[[XTemplate PDAImpResultMerc Text]] "Attribute Points"),
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__context', function (parent, context) return g_ImpTest.final end,
								'__class', "XText",
								'Id', "idRemPoints",
								'HAlign', "right",
								'VAlign', "center",
								'MinWidth', 124,
								'MaxWidth', 124,
								'HandleMouse', false,
								'TextStyle', "PDAIMPContentTitle",
								'OnContextUpdate', function (self, context, ...)
									self:SetTextStyle(GetDialog(self):CheckMercStats() and "PDAIMPContentTitle" or "PDAIMPContentTitleRed")
								end,
								'TextHAlign', "right",
								'TextVAlign', "center",
							}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return "GamepadUIStyleChanged" end,
				'__class', "XContextWindow",
				'Id', "idControllerSupport",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					local nameEdit = self:ResolveId("idEditName")
					local nickEdit = self:ResolveId("idEditNick")
					if not GetUIStyleGamepad() then
						nameEdit:SetFocusOrder(point(0,0))
						nickEdit:SetFocusOrder(point(0, 1))
					else
						nameEdit:SetFocus(false)
						nickEdit:SetFocus(false)
						nameEdit:SetFocusOrder(false)
						nickEdit:SetFocusOrder(false)
					end
				end,
			}),
			}),
		PlaceObj('XTemplateMode', {
			'mode', "test_result_stats",
		}, {
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return SubContext(context,{unit_data =  CreateImpMercData(g_ImpTest)}) end,
				'__class', "XContentTemplate",
				'Id', "idStats",
				'MaxWidth', 670,
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "RecalcStatPoints",
					'func', function (self, ...)
						local sum = 0
						local list = self.idStatsList
						for _, child in ipairs(list) do
							sum = sum + child.idSlider.Scroll
						end
						local rem = const.Imp.MaxStatPoints - sum
						for _, child in ipairs(list) do
							child.idMin:SetEnabled(child.idSlider.Scroll>child.min)
							child.max_with_rem = Min(child.max,child.idSlider.Scroll + rem)
							child.idMax:SetEnabled(child.idSlider.Scroll<child.max_with_rem)
						end
						local node= self:ResolveId("node")
						local ctrl = node.idMercInfo.idRemPoints
						ctrl:SetText(rem)
						
						GetDialog(self):ActionsUpdated()
						ObjModified(g_ImpTest.final)
					end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextFrame",
					'IdNode', false,
					'Image', "UI/PDA/imp_panel",
					'FrameBox', box(8, 8, 8, 8),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'IdNode', false,
						'Margins', box(240, 16, 12, 16),
						'Image', "UI/PDA/imp_panel_2",
						'FrameBox', box(5, 5, 5, 5),
					}),
					PlaceObj('XTemplateWindow', {
						'Id', "idStatsList",
						'Margins', box(30, 22, 30, 22),
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateForEach', {
							'array', function (parent, context) return context and context.stats end,
							'run_after', function (child, context, item, i, n, last)
								rawset(child,"stat",item.stat)
								rawset(child,"stat_idx",i)
								local min, max = ImpGetMinMaxStat(child.stat)
								child.idSlider:SetMin(0)
								child.idSlider:SetMax(max)
								child.idSlider.idDisabledZone:SetVisible(min>0)
								
								rawset(child,"min",min)
								rawset(child,"max",max)
								rawset(child, "max_with_rem", max)
								
								local stat = table.find_value(UnitPropertiesStats:GetProperties(), "id", item.stat)
								local statName = stat.name
								child.idStat:SetText(statName)
								child.idSlider:ScrollTo(item.value)
								child.idStat:SetContext(context)
								
								child.idStat.RolloverTitle = statName
								child.idStat.RolloverText = stat.help
							end,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XContextWindow",
								'IdNode', true,
								'MinHeight', 30,
								'MaxHeight', 30,
								'LayoutMethod', "HList",
								'LayoutHSpacing', 10,
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local stat = table.find_value(UnitPropertiesStats:GetProperties(), "id", self.stat)
									local statName = stat.name
									self.idStat:SetText(statName)
									self.idStat:SetContext(context)
									
									self.idStat.RolloverTitle = statName
									self.idStat.RolloverText = stat.help
								end,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'RolloverTemplate', "RolloverGenericYellow",
									'RolloverAnchor', "center-top",
									'RolloverText', T(392129244821, --[[XTemplate PDAImpResultMerc RolloverText]] "text"),
									'RolloverTitle', T(806873059629, --[[XTemplate PDAImpResultMerc RolloverTitle]] "title"),
									'Id', "idStat",
									'Padding', box(0, 0, 0, 0),
									'MinWidth', 220,
									'TextStyle', "PDAIMPContentTitle",
									'Translate', true,
									'Text', T(980371909346, --[[XTemplate PDAImpResultMerc Text]] "Name"),
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XContextControl",
									'IdNode', false,
									'VAlign', "center",
									'LayoutMethod', "HList",
									'RolloverOnFocus', true,
									'MouseCursor', "UI/Cursors/Pda_Hand.tga",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "SetSelected(self, selected)",
										'func', function (self, selected)
											self:SetFocus(selected)
										end,
									}),
									PlaceObj('XTemplateTemplate', {
										'__template', "PDASmallButton",
										'Id', "idMin",
										'Margins', box(0, 2, 0, 0),
										'VAlign', "center",
										'MinWidth', 24,
										'MinHeight', 24,
										'MaxWidth', 24,
										'MaxHeight', 24,
										'ScaleModifier', point(1000, 1000),
										'RepeatStart', 200,
										'RepeatInterval', 100,
										'OnPress', function (self, gamepad)
											local slider = self:ResolveId("node").idSlider
											local value = slider:GetScroll()
											slider:ScrollTo(Max(value-1,0))
										end,
										'FlipX', true,
										'CenterImage', "UI/PDA/T_Icon_Play",
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XScrollThumb",
										'Id', "idSlider",
										'VAlign', "center",
										'MinWidth', 364,
										'MinHeight', 28,
										'MouseCursor', "UI/Cursors/Pda_Hand.tga",
										'Horizontal', true,
									}, {
										PlaceObj('XTemplateFunc', {
											'name', "ScrollTo(self,value)",
											'func', function (self,value)
												local child = self.parent:ResolveId("node")
												value = Clamp(value, child.min, child.max_with_rem)
												
												-- patch the scroll's screen position to match the clamped value
												if self.current_pos then
													local size = self.content_box:sizex() - self:GetThumbSize()
													local min_pos = MulDivTrunc(child.min - self.Min, size, self.Max - self.Min + 1)
													local max_pos = MulDivTrunc(child.max_with_rem - self.Min, size, self.Max - self.Min + 1)
													if child.max_with_rem == self.Max then
														max_pos = size
													end
													self.current_pos = Clamp(self.current_pos, min_pos, max_pos)
												end
												
												local res = XScrollThumb.ScrollTo(self, value)
												self.idValue:SetText(self.Scroll)
												local ctrl_stats = child.parent:ResolveId("node")
												local context = ctrl_stats:GetContext()
												context.stats[child.stat_idx].value = self.Scroll
												ctrl_stats:SetContext(context)
												
												local dlg = GetDialog(self)
												local stats = dlg.idContent.idStats
												stats:RecalcStatPoints()
												g_ImpTest.final = g_ImpTest.final or {}	
												g_ImpTest.final.stats = g_ImpTest.final.stats or {}	
												g_ImpTest.final.stats[child.stat_idx].value = self.Scroll
												
												dlg:ActionsUpdated()
												
												return res
											end,
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'ZOrder', 0,
											'Image', "UI/PDA/imp_bar_2",
											'FrameBox', box(5, 5, 5, 5),
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XFrame",
											'Id', "idDisabledZone",
											'ZOrder', 0,
											'HAlign', "left",
											'VAlign', "top",
											'MinWidth', 113,
											'MinHeight', 28,
											'MaxWidth', 113,
											'MaxHeight', 28,
											'Image', "UI/PDA/imp_bar_2_a",
											'FrameBox', box(5, 5, 5, 5),
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XImage",
											'Id', "idThumb",
											'IdNode', false,
											'Padding', box(3, 3, 3, 3),
											'VAlign', "center",
											'MouseCursor', "UI/Cursors/Pda_Hand.tga",
											'Image', "UI/PDA/imp_stat_pad",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'Id', "idValue",
												'Padding', box(0, 0, 0, 0),
												'HAlign', "center",
												'VAlign', "center",
												'HandleKeyboard', false,
												'HandleMouse', false,
												'TextStyle', "PDAIMPStatSlider",
											}),
											}),
										}),
									PlaceObj('XTemplateTemplate', {
										'__template', "PDASmallButton",
										'Id', "idMax",
										'Margins', box(0, 2, 0, 0),
										'VAlign', "center",
										'MinWidth', 24,
										'MinHeight', 24,
										'MaxWidth', 24,
										'MaxHeight', 24,
										'ScaleModifier', point(1000, 1000),
										'RepeatStart', 200,
										'RepeatInterval', 100,
										'OnPress', function (self, gamepad)
											local slider = self:ResolveId("node").idSlider
											local value = slider:GetScroll()
											slider:ScrollTo(Min(value+1,100))
										end,
										'CenterImage', "UI/PDA/T_Icon_Play",
									}),
									}),
								}),
							}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateMode', {
			'mode', "test_result_perks",
		}, {
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return SubContext(context,{unit_data =  CreateImpMercData(g_ImpTest)}) end,
				'__class', "XContentTemplate",
				'Id', "idPerks",
				'MaxWidth', 670,
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContextFrame",
					'IdNode', false,
					'Image', "UI/PDA/imp_panel_perks",
					'FrameBox', box(8, 8, 8, 8),
				}, {
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 14, 0, 16),
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "line",
							'__class', "XImage",
							'Margins', box(8, 8, 8, 6),
							'VAlign', "center",
							'Transparency', 141,
							'Image', "UI/PDA/separate_line_vertical",
							'ImageFit', "stretch-x",
						}),
						PlaceObj('XTemplateWindow', {
							'__context', function (parent, context) return g_ImpTest.final end,
							'__class', "XText",
							'Id', "idTacticalPerk",
							'Margins', box(8, 0, 0, 0),--战术天赋图标边距
							'Padding', box(0, 0, 0, 0),
							'MinWidth', 250,
							'TextStyle', "PDAIMPContentTitle",
							'OnContextUpdate', function (self, context, ...)
								self:SetTextStyle(GetDialog(self):CheckMercPerksTactical() and "PDAIMPContentTitle" or "PDAIMPContentTitleRed")
							end,
							'Translate', true,
							'Text', T(747438157331, --[[XTemplate PDAImpResultMerc Text]] "Tactical perks 200/200"),--战术天赋选择上限
						}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(16, 8, 16, 0),--图标间距
							'LayoutMethod', "Grid",
							'LayoutHSpacing', 6,--图标间距
							'LayoutVSpacing', 6,--图标间距
							'UniformColumnWidth', true,
							'UniformRowHeight', true
						}, {
							PlaceObj('XTemplateForEach', {
								'array', function (parent, context) return ImpGettaclPerks() end,--添加战术天赋
								'__context', function (parent, context, item, i, n) return context.unit_data end,
								'run_after', function (child, context, item, i, n, last)
									local perk = CharacterEffectDefs[item]
									child.idimgPerk:SetImage(perk.Icon)
									
									child:SetGridX(i-(i-1)/15*15)
									child:SetGridY((i-1)/15+1)
									rawset(child, "perk",item)		
									rawset(child, "yellow", true)
									
									child:SetRolloverTitle(T{perk.DisplayName, perk})
									child:SetRolloverText(T{perk.Description, perk})
								end,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XContextWindow",
									'RolloverTemplate', "PDAPerkRollover",
									'RolloverAnchor', "custom",
									'RolloverOffset', box(0, 0, 0, 10),
									'IdNode', true,
									'HandleMouse', true,
									'MouseCursor', "UI/Cursors/Pda_Hand.tga",
									'ContextUpdateOnOpen', true,
									'OnContextUpdate', function (self, context, ...)
										local tactical = g_ImpTest.final.perks.tactical
										local selected = false
										for _, perkData in ipairs(tactical) do
										    if perkData.perk == self.perk then
											    selected = true
												break
										    end
										end
										self.idimgPerk:SetTransparency(selected and 0 or 125)
										self.idimgPerk:SetDesaturation(selected and 0 or 255)
										self.idBack:SetTransparency(selected and 125 or 200)
										local text = self:ResolveId("node").idTacticalPerk
										text:SetText(T{540824911540, "Tactical perks <max>/200", max = #tactical})--战术天赋选择上限
										
										ObjModified(g_ImpTest.final)
									end,
								}, {
									PlaceObj('XTemplateWindow', {--方框尺寸
										'Id', "idBack",
										'HAlign', "left",
										'VAlign', "top",
										'MinWidth', 30,
										'MinHeight', 30,
										'MaxWidth', 30,
										'MaxHeight', 30,
										'Background', RGBA(88, 92, 68, 255),
									}),
									PlaceObj('XTemplateWindow', {--图标尺寸
										'__class', "XImage",
										'Id', "idimgPerk",
										'HAlign', "left",
										'VAlign', "top",
										'MinWidth', 30,
										'MinHeight', 30,
										'MaxWidth', 30,
										'MaxHeight', 30,
										'FXMouseIn', "buttonRollover",
										'FXPress', "buttonPress",
										'FXPressDisabled', "IactDisabled",
										'ImageFit', "scale-down",
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnMouseButtonDown(self, pos, button)",
										'func', function (self, pos, button)
											if button == "L" then
												PlayFX("buttonPress", "start")
											
												g_ImpTest.final.perks = g_ImpTest.final.perks or {}
												local tactical = g_ImpTest.final.perks.tactical or {}
												--检查是否已选择当前天赋
												local perkIndex = nil
												for i, perkData in ipairs(tactical) do
													if perkData.perk == self.perk then
													    perkIndex = i
														break
													end
												end
												--如果已选择当前天赋，则取消选择
												if perkIndex then
													table.remove(tactical, perkIndex)
												else	
													--如果已选择了最大数量的天赋，则移除第一个选择再添加新选择
													if #tactical >= g_MaxTacticalPerksCount then
													    table.remove(tactical, 1)
													end
													table.insert(tactical, {perk = self.perk})
												end
												g_ImpTest.final.perks.tactical = tactical or {}
												local dlg =GetDialog(self)
												if dlg then dlg:ActionsUpdated() end
												self:ResolveId("node"):OnContextUpdate()
												return "break"
											end
										end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnSetRollover(self, rollover)",
										'func', function (self, rollover)
											if rollover then PlayFX("buttonRollover", "start") end
										end,
									}),
									}),
								}),
							}),
						}),
					}),
				}),
			}),
		}),
    })
end