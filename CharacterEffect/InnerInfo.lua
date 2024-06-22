UndefineClass('InnerInfo')
DefineClass.InnerInfo = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	msg_reactions = {
		PlaceObj('MsgActorReactionEffects', {
			Handler = function () printf("bad function %s(%s): %s", name, params, err) end,
		}),
	},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnHackIntelDsicovered",
			Handler = function (self, target)
				local discoveredFor = DiscoverIntelForRandomSector(2, "no notification")
				if discoveredFor then
					CombatLog("important", T{312197955233, "Livewire used her custom PDA to discover additional Intel for <em><SectorName(sectorId)></em>", sectorId = discoveredFor})
				end
				target:AddToInventory("CustomPDA", 1)
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcHackMoneyGained",
			Handler = function (self, target, value)
				target:AddToInventory("CustomPDA", 1)
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				 --and ((IsKindOfClasses(weapon1, "Firearm") and weapon1:IsFullyModified()) or (IsKindOfClasses(weapon2, "Firearm") and weapon2:IsFullyModified())) then
				--	local bonus = target.Mechanical/10
				local ItemId = "CustomPDA"
				local bonus
				local pdaStacks = 0
				target:ForEachItem(false, function(item, slot)
					if item.class == ItemId then
						pdaStacks = item.Amount
					end
				end)
				if target == attacker   then
					bonus = Min(self:ResolveValue("maxBonus"), pdaStacks)
					ApplyCthModifier_Add(self, data, bonus)
				end
			end,
		}),
	},
	DisplayName = T(973384981010, --[[ModItemCharacterEffectCompositeDef InnerInfo DisplayName]] "Hack the System!"),
	Description = T(258443421203, --[[ModItemCharacterEffectCompositeDef InnerInfo Description]] "<color EmStyle>Gives</color> her 1% <color EmStyle>bonus</color> for <color EmStyle>chance to hit</color> every time she successfully hacks something."),
	Icon = "Mod/PerksExpanded/Images/hacker (2) 2.dds",
	Tier = "Personal",
}

