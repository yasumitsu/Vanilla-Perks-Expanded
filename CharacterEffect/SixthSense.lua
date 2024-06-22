UndefineClass('SixthSense')
DefineClass.SixthSense = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnEndTurn",
			Handler = function (self, target)
				local cover_id
				if g_Combat and target:IsAware() then
					cover_id = GetHighestCover(target)
				end
				if not cover_id and g_Combat:AreEnemiesAware(g_CurrentTeam) then
					target:ApplyTempHitPoints(self:ResolveValue("tempHitPoints"))
				end
			end,
		}),
	},
	DisplayName = T(293683380382, --[[ModItemCharacterEffectCompositeDef SixthSense DisplayName]] "Open Ground Tactics"),
	Description = T(409442475139, --[[ModItemCharacterEffectCompositeDef SixthSense Description]] "+<tempHitPoints> Grit each time you end turn out of cover."),
	Icon = "Mod/PerksExpanded/Images/magic-ball3",
	Tier = "Bronze",
	Stat = "Wisdom",
	StatValue = 70,
}

