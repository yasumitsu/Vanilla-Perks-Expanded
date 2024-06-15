UndefineClass('BonusHPRoles')
DefineClass.BonusHPRoles = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnExplorationTick",
			Handler = function (self, target)
				local lvl = target:GetLevel()
				local bonus = self:ResolveValue("bonus_health") * lvl
				self:SetParameter("bonus_health", bonus)
				RecalcMaxHitPoints(target)
			end,
		}),
	},
	DisplayName = "",
	Description = "",
	OnAdded = function (self, obj)
		RecalcMaxHitPoints(obj)
	end,
	OnRemoved = function (self, obj)
		RecalcMaxHitPoints(obj)
	end,
	Stat = "Health",
	StatValue = 70,
}

