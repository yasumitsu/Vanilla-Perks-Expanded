UndefineClass('CustomPDA')
DefineClass.CustomPDA = {
	__parents = { "InventoryStack" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "InventoryStack",
	Repairable = false,
	Icon = "UI/Icons/Items/custom_pda",
	DisplayName = T(759765204122, --[[ModItemInventoryItemCompositeDef CustomPDA DisplayName]] "Livewire's PDA"),
	DisplayNamePlural = T(181529049205, --[[ModItemInventoryItemCompositeDef CustomPDA DisplayNamePlural]] "Livewire's PDAs"),
	Description = T(720580044293, --[[ModItemInventoryItemCompositeDef CustomPDA Description]] "Useful for accessing the web and hacking military grade computers."),
	AdditionalHint = T(615384185665, --[[ModItemInventoryItemCompositeDef CustomPDA AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Grants additional Intel when hacking\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Has cute stickers on it"),
	locked = true,
	RestockWeight = 0,
	MaxStacks = 20,
}

