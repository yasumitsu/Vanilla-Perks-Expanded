UndefineClass('Leader')
DefineClass.Leader = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCombatStarting",
			Handler = function (self, target, load_game)
				self:SetParameter("allyGrit", target:GetLevel())
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				-- from MMOcenaries Standalone_ Custom Perks
				
				local target_side = target and target.team and target.team.side or ''
				local target_pos = target:GetPos() or false
				local allycount = 0
				local squad = gv_Squads[target.Squad]
				local level = target:GetLevel()
				
				for _, id in ipairs(squad.units) do
					local unit = g_Units[id]
					if unit ~= target then
						local side = unit and unit.team and unit.team.side or ''
						if target_side ~= '' and side == target_side then
							local unit_pos = unit:GetPos() or false
							if target_pos and unit_pos then
								local dist = target_pos:Dist(unit_pos)
								if dist <= level * const.SlabSizeX then
									--allycount = allycount +1
									--print(unit)
									unit:AddStatusEffect("LeaderAuraBuff")
								end
							end
						end
					end
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('CheckGameRule', {
			Rule = "AdditionalPerks",
		}),
	},
	DisplayName = T(788341325420, --[[ModItemCharacterEffectCompositeDef Leader DisplayName]] "Leader"),
	Description = T(819229546378, --[[ModItemCharacterEffectCompositeDef Leader Description]] "This merc has high Leadership."),
	AddEffectText = "",
	RemoveEffectText = "",
	OnAdded = function (self, obj)
		obj:AddStatusEffectImmunity("Panicked", self.class)
		obj:AddStatusEffectImmunity("Berserk", self.class)
	end,
	OnRemoved = function (self, obj)
		obj:RemoveStatusEffectImmunity("Panicked", self.class)
		obj:AddStatusEffectImmunity("Berserk", self.class)
	end,
	Icon = "Mod/PerksExpanded/Images/napoleon.dds",
	Shown = true,
}

