// RMH_ERP

/datum/interaction/lewd/fuck_vagina
	name = "Fuck (Vagina)"
	description = "Have sex with them."
	category = INTERACTION_CAT_SEX
	usage = INTERACTION_OTHER
	user_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	target_required_parts = list(ORGAN_SLOT_VAGINA = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_USER = CLIMAX_PENIS, CLIMAX_POSITION_TARGET = CLIMAX_VAGINA)
	message = list(
		"fucks %TARGET%.",
		"thrusts into %TARGET%.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
		'modular_rmh/sounds/squelch3.ogg',
	)
	sound_use = TRUE
	user_pleasure = 12
	user_arousal = 10
	target_pleasure = 12
	target_arousal = 10

/datum/interaction/lewd/fuck_anus
	name = "Fuck (Anus)"
	description = "Have anal sex with them."
	category = INTERACTION_CAT_SEX
	usage = INTERACTION_OTHER
	user_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	target_required_parts = list(ORGAN_SLOT_ANUS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_USER = CLIMAX_PENIS)
	message = list(
		"fucks %TARGET% in the ass.",
		"thrusts into %TARGET%'s ass.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch2.ogg',
	)
	sound_use = TRUE
	user_pleasure = 11
	user_arousal = 10
	target_pleasure = 8
	target_arousal = 8

/datum/interaction/lewd/vaginal_ride
	name = "Ride (Vagina)"
	description = "Ride them."
	category = INTERACTION_CAT_SEX
	usage = INTERACTION_OTHER
	user_required_parts = list(ORGAN_SLOT_VAGINA = REQUIRE_GENITAL_EXPOSED)
	target_required_parts = list(ORGAN_SLOT_PENIS = REQUIRE_GENITAL_EXPOSED)
	cum_genital = list(CLIMAX_POSITION_USER = CLIMAX_VAGINA, CLIMAX_POSITION_TARGET = CLIMAX_PENIS)
	message = list(
		"rides %TARGET%.",
		"sinks down onto %TARGET%.",
	)
	sound_possible = list(
		'modular_rmh/sounds/squelch1.ogg',
		'modular_rmh/sounds/squelch3.ogg',
	)
	sound_use = TRUE
	user_pleasure = 12
	user_arousal = 10
	target_pleasure = 12
	target_arousal = 10
