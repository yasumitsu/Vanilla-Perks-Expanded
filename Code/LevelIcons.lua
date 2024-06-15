function GetMercIcon(prefix, level)
	
	if CurrentModOptions["LevelIcons"] == true then

		local iconLevel = Min(level, 50)
		if level > 10 then
			iconLevel = iconLevel < 50 and "" .. tostring(iconLevel) or tostring(iconLevel)
			return "Mod/PerksExpanded/Images/" .. prefix .. "_level_" .. iconLevel
		end
		iconLevel = iconLevel < 10 and "0" .. tostring(iconLevel) or tostring(iconLevel)
		return "Mod/PerksExpanded/Images/" .. prefix .. "_level_" .. iconLevel

	else
	-- vanilla 
	
		local iconLevel = Min(level, 10)
		iconLevel = iconLevel < 10 and "0" .. tostring(iconLevel) or tostring(iconLevel)
		return "UI/Hud/" .. prefix .. "_level_" .. iconLevel
	
	end
end

--Mod/PerksExpanded/Images/Sniper_emblem_BLU_(beta).png


-- camouflage kit
-- stealth armor
-- AI assistant (visor)
-- exoskeleton
-- fireproof
-- 
