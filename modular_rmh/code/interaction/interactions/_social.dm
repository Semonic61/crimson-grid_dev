// RMH_ERP

/datum/interaction/kiss
	name = "Kiss"
	description = "Kiss them."
	category = INTERACTION_CAT_SOCIAL
	usage = INTERACTION_OTHER
	message = list(
		"kisses %TARGET%.",
		"leans in and kisses %TARGET%.",
	)
	user_arousal = 2
	target_arousal = 2
	color = "pink"

/datum/interaction/hug
	name = "Hug"
	description = "Hug them."
	category = INTERACTION_CAT_SOCIAL
	usage = INTERACTION_OTHER
	lewd = FALSE
	message = list(
		"hugs %TARGET%.",
		"wraps their arms around %TARGET%.",
	)
	color = "good"

/datum/interaction/caress
	name = "Caress"
	description = "Gently caress them."
	category = INTERACTION_CAT_SOCIAL
	usage = INTERACTION_OTHER
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	message = list(
		"caresses %TARGET%.",
		"runs a hand along %TARGET%.",
	)
	user_arousal = 1
	target_arousal = 2
	color = "pink"
