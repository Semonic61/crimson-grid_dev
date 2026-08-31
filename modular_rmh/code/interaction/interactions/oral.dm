// RMH_ERP

/datum/interaction/lewd/oral_penis
	name = "Oral (Penis)"
	description = "Go down on them."
	category = INTERACTION_CAT_ORAL
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_MOUTH)
	target_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_TARGET = CLIMAX_PENIS)
	message = list(
		"goes down on %TARGET%.",
		"takes %TARGET% into their mouth.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
	)
	sound_use = TRUE
	user_arousal = 5
	target_pleasure = 14
	target_arousal = 10

/datum/interaction/lewd/oral_vagina
	name = "Oral (Vagina)"
	description = "Eat them out."
	category = INTERACTION_CAT_ORAL
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_MOUTH)
	target_required_parts = list(ORGAN_SLOT_VAGINA = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_TARGET = CLIMAX_VAGINA)
	message = list(
		"eats %TARGET% out.",
		"presses their mouth between %TARGET%'s legs.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
	)
	sound_use = TRUE
	user_arousal = 5
	target_pleasure = 14
	target_arousal = 10

/datum/interaction/lewd/nipsuck
	name = "Suck Nipples"
	description = "Suck on their breasts. Transfers milk if they are lactating."
	category = INTERACTION_CAT_ORAL
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_MOUTH)
	target_required_parts = list(ORGAN_SLOT_BREASTS = REQUIRE_GENITAL_EXPOSED)
	message = list(
		"sucks on %TARGET%'s nipple.",
		"latches onto %TARGET%'s breast.",
	)
	user_arousal = 4
	target_pleasure = 7
	target_arousal = 6

/datum/interaction/lewd/nipsuck/post_interaction(mob/living/user, mob/living/target)
	if(!ishuman(target) || !user.reagents)
		return
	var/mob/living/carbon/human/human_target = target
	var/obj/item/organ/genital/breasts/breasts = human_target.get_organ_slot(ORGAN_SLOT_BREASTS)
	if(!breasts?.reagents)
		return
	breasts.reagents.trans_to(user, rand(2, 5), transferred_by = target)
