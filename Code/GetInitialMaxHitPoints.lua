--local function ReplaceGetInitialMaxHitPoints()
--end
--
--function UnitProperties:GetInitialMaxHitPoints()
--	local mod = self:GetProperty("villain") and const.Combat.LieutenantHpMod or 100
--	local maxhp = MulDivRound(self:GetProperty("Health"), mod, 100)
--	local hpPerLevel = self:GetLevel()
--	--maxhp = maxhp + hpPerLevel
--	if HasPerk(self, "BeefedUp") then
--		maxhp = MulDivRound(maxhp, 100 + CharacterEffectDefs.BeefedUp:ResolveValue("bonus_health"), 100)
--	elseif HasPerk(self, "BonusHPRoles") then
--		maxhp = MulDivRound(maxhp, 100 + CharacterEffectDefs.BonusHPRoles:ResolveValue("bonus_health"), 100)
--	end
--	return maxhp
--end