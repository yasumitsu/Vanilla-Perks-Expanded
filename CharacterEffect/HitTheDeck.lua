UndefineClass('HitTheDeck')
DefineClass.HitTheDeck = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcMoveModifier",
			Handler = function (self, target, value, action)
				if action.id == "Move" then
					target:AddStatusEffect("HitTheDeckMoveMod")
				end
			end,
		}),
	},
	DisplayName = T(528467689923, --[[ModItemCharacterEffectCompositeDef HitTheDeck DisplayName]] "Hit The Deck"),
	Description = T(345357935343, --[[ModItemCharacterEffectCompositeDef HitTheDeck Description]] "Switching to <color EmStyle>Prone</color> is <color EmStyle>Free</color>.\n\nMoving in crouch or prone positions is less costly.\n\nAdditional <color EmStyle><explosiveLessDamage>% Damage</color> reduction from <color EmStyle>Explosives</color> when <color EmStyle>Prone</color>."),
	Icon = "UI/Icons/Perks/HitTheDeck",
	Tier = "Bronze",
	Stat = "Health",
	StatValue = 70,
}

