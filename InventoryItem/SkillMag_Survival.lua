UndefineClass('SkillMag_Survival')
DefineClass.SkillMag_Survival = {
	__parents = { "MiscItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "MiscItem",
	Repairable = false,
	Icon = "UI/Icons/Items/mag_an_apple_a_day",
	DisplayName = T(713133202518, --[[ModItemInventoryItemCompositeDef SkillMag_Survival DisplayName]] "Survival Instinct"),
	DisplayNamePlural = T(313878002898, --[[ModItemInventoryItemCompositeDef SkillMag_Survival DisplayNamePlural]] "Survival Instinct"),
	Description = T(707098617829, --[[ModItemInventoryItemCompositeDef SkillMag_Survival Description]] "Doctors really hate this one simple trick."),
	AdditionalHint = T(769271035160, --[[ModItemInventoryItemCompositeDef SkillMag_Survival AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Used through the Item Menu\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Single use\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Adds Survival Instinct"),
	UnitStat = "Health",
	Valuable = 1,
	Cost = 5000,
	MaxStock = 1,
	RestockWeight = 10,
	effect_moment = "on_use",
	Effects = {
		PlaceObj('UnitAddStatusEffect', {
			Status = "SurvivalInstinct",
			TargetUnit = "current unit",
		}),
	},
	action_name = T(581172471321, --[[ModItemInventoryItemCompositeDef SkillMag_Survival action_name]] "READ"),
	destroy_item = true,
}

