// RMH_ERP
// Hand jobs / fingering / breast grope / hand milking. No machine milker.

/datum/interaction/lewd
	abstract = TRUE
	lewd = TRUE
	color = "pink"

/datum/interaction/lewd/handjob
	name = "Handjob"
	description = "Jerk them off. Hold a beaker to catch fluid."
	category = INTERACTION_CAT_HANDS
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	target_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_TARGET = CLIMAX_PENIS)
	message = list(
		"jerks %TARGET% off.",
		"works %TARGET%'s shaft with their hand.",
		"strokes %TARGET%.",
	)
	sound_possible = list(
		'modular_rmh/sounds/fap1.ogg',
		'modular_rmh/sounds/fap2.ogg',
		'modular_rmh/sounds/fap3.ogg',
		'modular_rmh/sounds/fap4.ogg',
		'modular_rmh/sounds/fap5.ogg',
	)
	sound_use = TRUE
	user_arousal = 3
	target_pleasure = 12
	target_arousal = 8

/datum/interaction/lewd/handjob/post_interaction(mob/living/user, mob/living/target)
	try_hand_collect(user, target, ORGAN_SLOT_PENIS)

/datum/interaction/lewd/finger
	name = "Finger"
	description = "Finger them."
	category = INTERACTION_CAT_HANDS
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	target_required_parts = list(ORGAN_SLOT_VAGINA = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_TARGET = CLIMAX_VAGINA)
	message = list(
		"fingers %TARGET%.",
		"works their fingers inside %TARGET%.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
		'modular_rmh/sounds/squelch3.ogg',
	)
	sound_use = TRUE
	user_arousal = 3
	target_pleasure = 12
	target_arousal = 8

/datum/interaction/lewd/titgrope
	name = "Grope Breasts"
	description = "Grope their breasts."
	category = INTERACTION_CAT_HANDS
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	target_required_parts = list(ORGAN_SLOT_BREASTS = REQUIRE_GENITAL_ANY)
	message = list(
		"gropes %TARGET%'s breasts.",
		"squeezes %TARGET%'s chest.",
		"teases %TARGET%'s nipples.",
	)
	user_arousal = 2
	target_pleasure = 6
	target_arousal = 5

/datum/interaction/lewd/hand_milk
	name = "Hand Milk"
	description = "Milk them by hand into a held container, or just onto the floor."
	category = INTERACTION_CAT_HANDS
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	target_required_parts = list(ORGAN_SLOT_BREASTS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_TARGET = CLIMAX_BREASTS)
	message = list(
		"milks %TARGET% by hand.",
		"squeezes warm milk from %TARGET%'s breasts.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
	)
	sound_use = TRUE
	user_arousal = 2
	target_pleasure = 8
	target_arousal = 6

/datum/interaction/lewd/hand_milk/post_interaction(mob/living/user, mob/living/target)
	try_hand_collect(user, target, ORGAN_SLOT_BREASTS)

/datum/interaction/proc/try_hand_collect(mob/living/user, mob/living/target, slot)
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/human_target = target
	var/obj/item/organ/genital/genital = human_target.get_organ_slot(slot)
	if(!genital?.reagents)
		return
	var/obj/item/held = user.get_active_held_item()
	if(istype(held) && held.is_refillable())
		var/moved = genital.try_fill_container(held, rand(3, 8))
		if(moved)
			user.visible_message(span_notice("[user] catches some fluid in [held]."))
		return
	genital.reagents.remove_all(rand(2, 5))
