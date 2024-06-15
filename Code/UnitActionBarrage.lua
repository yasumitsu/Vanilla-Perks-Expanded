function Unit:Barrage(action_id, cost_ap, args)
	args.attack_anim_delay = 50
	self:SetActionCommand("FirearmAttack", action_id, cost_ap, args)
end