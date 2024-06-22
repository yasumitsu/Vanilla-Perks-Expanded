UndefineClass('Caretaker')
DefineClass.Caretaker = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnUnitBandaged",
			Handler = function (self, target, healer, patient, hp_restored)
				if target == healer then
					local tempHp = MulDivRound(healer.Medical, self:ResolveValue("medicalPercent"), 100)
					if patient.command == "DownedRally" then
						patient:AddStatusEffect("GritAfterRally", tempHp)
					else
						patient:ApplyTempHitPoints(tempHp)
					end	
				end
			end,
		}),
	},
	DisplayName = T(767416055321, --[[ModItemCharacterEffectCompositeDef Caretaker DisplayName]] "Painkiller"),
	Description = T(991823627830, --[[ModItemCharacterEffectCompositeDef Caretaker Description]] "When you end you turn bandaging an ally, you grant <color EmStyle><StatPercent('Medical', medicalPercent)></color> <color EmStyle>Grit</color> to this ally (based on Medical)."),
	Icon = "UI/Icons/Perks/Caretaker",
	Tier = "Gold",
	Stat = "Medical",
	StatValue = 90,
}

