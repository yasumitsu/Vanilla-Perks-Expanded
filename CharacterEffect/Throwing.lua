UndefineClass('Throwing')
DefineClass.Throwing = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				target:AddStatusEffect("FirstThrow")
			end,
		}),
	},
	DisplayName = T(113649016654, --[[ModItemCharacterEffectCompositeDef Throwing DisplayName]] "Throwing"),
	Description = T(227695453891, --[[ModItemCharacterEffectCompositeDef Throwing Description]] "Extended <color EmStyle>Range</color> of all thrown weapons.\n\nDramatically reduced <color EmStyle>AP</color> cost for first <color EmStyle>Knife</color> or <color EmStyle>Grenade</color> throw each turn."),
	OnAdded = function (self, obj)
		obj:AddStatusEffect("FirstThrow")
	end,
	Icon = "UI/Icons/Perks/Throwing",
	Tier = "Silver",
	Stat = "Explosives",
	StatValue = 80,
}

