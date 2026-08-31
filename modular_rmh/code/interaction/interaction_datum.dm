// RMH_ERP
// Adapted from Skyrat/SPLURT /datum/interaction without JSON loaders or vore flags.

/datum/interaction
	var/id
	var/name = "broken interaction"
	var/description = "broken"
	var/list/message = list()
	var/category = INTERACTION_CAT_SOCIAL
	var/usage = INTERACTION_OTHER
	var/lewd = FALSE
	var/abstract = FALSE
	var/list/user_required_parts = list()
	var/list/target_required_parts = list()
	var/list/interaction_requires = list()
	var/user_pleasure = 0
	var/user_arousal = 0
	var/target_pleasure = 0
	var/target_arousal = 0
	var/sound_use = FALSE
	var/list/sound_possible = list()
	var/sound_range = 1
	var/color = "blue"
	var/list/cum_genital = list()
	var/list/additional_details = list()

/datum/interaction/proc/allow_act(mob/living/user, mob/living/target)
	if(!user || !target)
		return FALSE
	if(target == user && usage == INTERACTION_OTHER)
		return FALSE
	if(target != user && usage == INTERACTION_SELF)
		return FALSE
	if(lewd && !user.erp_allowed(target))
		return FALSE
	if(get_dist(user, target) > 1 && user != target)
		return FALSE

	if(length(user_required_parts))
		if(!ishuman(user))
			return FALSE
		var/mob/living/carbon/human/human_user = user
		for(var/slot in user_required_parts)
			if(!human_user.has_genital(user_required_parts[slot] || REQUIRE_GENITAL_EXPOSED, slot))
				return FALSE

	if(length(target_required_parts))
		if(!ishuman(target))
			return FALSE
		var/mob/living/carbon/human/human_target = target
		for(var/slot in target_required_parts)
			if(!human_target.has_genital(target_required_parts[slot] || REQUIRE_GENITAL_EXPOSED, slot))
				return FALSE

	for(var/requirement in interaction_requires)
		switch(requirement)
			if(INTERACTION_REQUIRE_SELF_HAND)
				if(!user.get_empty_held_index_for_side() && isnull(user.get_active_held_item()))
					return FALSE
			if(INTERACTION_REQUIRE_TARGET_HAND)
				if(!target.get_empty_held_index_for_side() && isnull(target.get_active_held_item()))
					return FALSE
			if(INTERACTION_REQUIRE_SELF_MOUTH)
				if(user.is_mouth_covered())
					return FALSE
			if(INTERACTION_REQUIRE_TARGET_MOUTH)
				if(target.is_mouth_covered())
					return FALSE
	return TRUE

/datum/interaction/proc/act(mob/living/user, mob/living/target)
	if(!allow_act(user, target))
		return FALSE

	var/msg = pick(message)
	msg = replacetext(replacetext(msg, "%TARGET%", "[target]"), "%USER%", "[user]")
	if(lewd)
		user.visible_message(span_pink(msg), span_pink(msg))
	else
		user.visible_message(span_notice(msg), span_notice(msg))

	if(sound_use && length(sound_possible))
		var/play = TRUE
		if(user.client && !user.client.prefs?.read_preference(/datum/preference/toggle/erp/sounds))
			play = FALSE
		if(play)
			playsound(user, pick(sound_possible), 50, TRUE, sound_range)

	user.adjust_erp_arousal(user_arousal)
	user.adjust_erp_pleasure(user_pleasure, src, target)
	if(target != user)
		target.adjust_erp_arousal(target_arousal)
		target.adjust_erp_pleasure(target_pleasure, src, user)

	post_interaction(user, target)
	return TRUE

/datum/interaction/proc/post_interaction(mob/living/user, mob/living/target)
	return
