// RMH_ERP

/datum/interaction/lewd/masturbate_penis
	name = "Masturbate (Penis)"
	description = "Touch yourself."
	category = INTERACTION_CAT_SELF
	usage = INTERACTION_SELF
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	user_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_USER = CLIMAX_PENIS)
	message = list(
		"strokes themselves.",
		"touches themselves.",
	)
	sound_possible = list(
		'modular_rmh/sounds/fap1.ogg',
		'modular_rmh/sounds/fap2.ogg',
		'modular_rmh/sounds/fap3.ogg',
	)
	sound_use = TRUE
	user_pleasure = 10
	user_arousal = 8

/datum/interaction/lewd/masturbate_vagina
	name = "Masturbate (Vagina)"
	description = "Touch yourself."
	category = INTERACTION_CAT_SELF
	usage = INTERACTION_SELF
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	user_required_parts = list(ORGAN_SLOT_VAGINA = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_USER = CLIMAX_VAGINA)
	message = list(
		"fingers themselves.",
		"touches themselves.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
	)
	sound_use = TRUE
	user_pleasure = 10
	user_arousal = 8

/datum/interaction/lewd/self_milk
	name = "Milk Yourself"
	description = "Milk yourself by hand into a held container."
	category = INTERACTION_CAT_SELF
	usage = INTERACTION_SELF
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	user_required_parts = list(ORGAN_SLOT_BREASTS = REQUIRE_GENITAL_EXPOSED)
	message = list(
		"milks themselves.",
		"squeezes milk from their own breasts.",
	)
	sound_use = TRUE
	sound_possible = list('modular_rmh/sounds/squelch1.ogg')
	user_pleasure = 6
	user_arousal = 5

/datum/interaction/lewd/self_milk/post_interaction(mob/living/user, mob/living/target)
	try_hand_collect(user, user, ORGAN_SLOT_BREASTS)
