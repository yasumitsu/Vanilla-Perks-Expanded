UndefineClass('SkillMag_Regen')
DefineClass.SkillMag_Regen = {
	__parents = { "MiscItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "MiscItem",
	Repairable = false,
	Icon = "UI/Icons/Items/mag_the_red_wire",
	DisplayName = T(779194599933, --[[ModItemInventoryItemCompositeDef SkillMag_Regen DisplayName]] "Regen"),
	DisplayNamePlural = T(240266772545, --[[ModItemInventoryItemCompositeDef SkillMag_Regen DisplayNamePlural]] "Regen"),
	Description = T(154185974978, --[[ModItemInventoryItemCompositeDef SkillMag_Regen Description]] "Recently blew up after several issues."),
	AdditionalHint = T(951914419119, --[[ModItemInventoryItemCompositeDef SkillMag_Regen AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Used through the Item Menu\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Single use\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Adds Regen"),
	UnitStat = "Health",
	Valuable = 1,
	Cost = 5000,
	Tier = 2,
	MaxStock = 1,
	RestockWeight = 10,
	effect_moment = "on_use",
	Effects = {
		PlaceObj('UnitAddStatusEffect', {
			Status = "Regen",
			TargetUnit = "current unit",
		}),
	},
	action_name = T(515963026409, --[[ModItemInventoryItemCompositeDef SkillMag_Regen action_name]] "READ"),
	destroy_item = true,
}

