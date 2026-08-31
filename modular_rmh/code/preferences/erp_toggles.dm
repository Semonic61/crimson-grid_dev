// RMH_ERP

/datum/preference/toggle/erp
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "erp_pref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = FALSE

/datum/preference/toggle/erp/is_accessible(datum/preferences/preferences)
	. = ..()
	if(!.)
		return FALSE
	return erp_content_enabled() || CONFIG_GET(flag/nsfw_content)

/datum/preference/toggle/erp/sounds
	savefile_key = "erp_sounds_pref"
	default_value = TRUE

/datum/preference/toggle/erp/autocum
	savefile_key = "erp_autocum_pref"
	default_value = TRUE

/datum/preference/choiced/erp_status
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status"
	should_generate_icons = FALSE

/datum/preference/choiced/erp_status/init_possible_values()
	return list("Yes", "Ask", "Check OOC", "No")

/datum/preference/choiced/erp_status/create_default_value()
	return "Ask"

/datum/preference/choiced/erp_status/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return
