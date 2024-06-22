UndefineClass('BurstControl')
DefineClass.BurstControl = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Handler = function ()
				--	for i = 1, num_shots do
				--		local shot_miss, shot_crit, shot_cth
				--		shot_cth = self:GetShotChanceToHit(attack_results.chance_to_hit - shot_attack_args.cth_loss_per_shot * (i - 1))
				--		shot_cth = attacker:CallReactions_Modify("OnCalcShotChanceToHit", shot_cth, attacker, target, i, num_shots)
				--		if target_unit then
				--			shot_cth = target_unit:CallReactions_Modify("OnCalcShotChanceToHit", shot_cth, attacker, target, i, num_shots)
				--		end
				--		if shot_attack_args.multishot then
				--			roll = attack_results.attack_roll[i]
				--			shot_miss = roll > shot_cth
				--			shot_crit = (not shot_miss) and (attack_results.crit_roll[i] <= attack_results.crit_chance)
				--			-- update global miss/crit for the attack
				--			miss = miss and shot_miss
				--			crit = crit or shot_crit
				--		else
				--			shot_miss = (not stealth_kill or i > 1) and roll > shot_cth
				--			shot_crit = crit and (i == 1)
				--		end
				--		local data = band(shot_cth, sfCthMask)
				--		data = bor(data, band(shift(roll, sfRollOffset), sfRollMask))
				--		data = bor(data, shot_miss and 0 or sfHit)
				--		data = bor(data, shot_crit and sfCrit or 0)
				--		data = bor(data, (shot_attack_args.multishot or (i == 1)) and sfLeading or 0)
				--		if shot_miss and shot_cth > 0 then
				--			local shot_graze_threshold = self:GetShotGrazeTheshold(graze_threshold)
				--			shot_graze_threshold = attacker:CallReactions_Modify("OnCalcShotGrazeThreshold", shot_graze_threshold, attacker, target, i, num_shots)
				--			if target_unit then
				--				shot_graze_threshold = target_unit:CallReactions_Modify("OnCalcShotGrazeThreshold", shot_graze_threshold, attacker, target, i, num_shots)
				--			end
				--			if roll < shot_cth + shot_graze_threshold then
				--				data = bor(data, sfAllowGrazing)
				--				num_grazing = num_grazing + 1
				--			end
				--		end
				--		shots_data[i] = data
				--		num_hits = num_hits + (shot_miss and 0 or 1)
				--		num_misses = num_misses + (shot_miss and 1 or 0)
				--		if not prediction then
				--			NetUpdateHash("FirearmShot", attacker, target, shot_attack_args.action_id, shot_attack_args.stance, self.class, self.id, self == shot_attack_args.weapon, shot_attack_args.occupied_pos, shot_attack_args.step_pos, shot_attack_args.angle, shot_attack_args.anim, shot_attack_args.can_use_covers, shot_attack_args.ignore_smoke, shot_attack_args.penetration_class, shot_attack_args.range, shot_cth, roll, shot_miss)
				--		end
				--	end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnFirearmAttackStart",
			Handler = function (self, target, attacker, attack_target, action, attack_args)
				if target == attacker and (action.id == "BurstFire") then
					attack_args.num_shots = attack_args.num_shots + 1
					attack_args.damage_bonus = attack_args.damage_bonus + self:ResolveValue("dmg_bonus")
					attack_args.cth_loss_per_shot = attack_args.cth_loss_per_shot - self:ResolveValue("cth_loss")
					return attack_args
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnFirearmAttackStart",
			Handler = function (self, target, attacker, attack_target, action, attack_args)
				if target == attacker and (action.id == "BurstFire") then
					attack_args.num_shots = attack_args.num_shots + 1
					attack_args.damage_bonus = attack_args.damage_bonus + self:ResolveValue("dmg_bonus")
					attack_args.cth_loss_per_shot = self:ResolveValue("cth_loss")
					return attack_args
				end
			end,
		}),
	},
	DisplayName = T(473007244961, --[[ModItemCharacterEffectCompositeDef BurstControl DisplayName]] "Burst Control"),
	Description = T(620919217507, --[[ModItemCharacterEffectCompositeDef BurstControl Description]] "Increased <color EmStyle>number of shots and damage</color> for <color EmStyle>Burst attacks</color> at the cost of a small penalty for <color EmStyle>accuracy after the recoil.</color>."),
	Icon = "Mod/PerksExpanded/Images/machine-gun (68).png",
	Tier = "Gold",
	Stat = "Marksmanship",
	StatValue = 90,
}

