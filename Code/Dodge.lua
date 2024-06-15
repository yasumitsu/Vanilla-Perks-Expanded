function Unit:DodgeCheck(effect)
	if g_Combat and g_Teams[g_Combat.team_playing] == self.team then return end -- Don't proc in your turn
	if self.stance == "Prone" or self:HasStatusEffect("ManningEmplacement") then return end
	
	local chance = effect:ResolveValue("chance")
	if not chance or (self:Random(100) < chance) then
		self:SetActionCommand("ChangeStance", nil, nil, "Crouch")
		--self:SetFootPlant(true)
		CreateFloatingText(self, { "Dodge"}, 4286349920, nil, 500)
		return true
	end
end


-- for maxlvl 10
-- level /2 * agility /20
-- DivRound(agility, 25) 
-- DivRound(level, 2) 

--self:SetFootPlant(true)
--local anim = self:GetActionRandomAnim("Dodge", self.stance)
--self:SetState(anim, const.eKeepComponentTargets)

--function Unit:LightningReactionCheck(effect)
--	if g_Combat and g_Teams[g_Combat.team_playing] == self.team then return end -- Don't proc in your turn
--	if self.stance == "Prone" or self:HasStatusEffect("ManningEmplacement") then return end
--	
--	local chance = effect:ResolveValue("chance")
--	if not chance or (self:Random(100) < chance) then
--		self:SetActionCommand("ChangeStance", nil, nil, "Prone")
--		CreateFloatingText(self, T(726050447294, "Lightning Reaction"), nil, nil, true)
--		return true
--	end
--end