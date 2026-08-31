// RMH_ERP

/obj/item/organ/genital/anus
	name = "anus"
	desc = "An anus."
	icon = 'modular_rmh/icons/obj/genitals/anus.dmi'
	icon_state = "anus"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/anus
	genital_location = GROIN

/datum/bodypart_overlay/mutant/genital/anus
	feature_key = FEATURE_ANUS
	layers = list(EXTERNAL_BEHIND = BODY_BEHIND_LAYER)

/obj/item/organ/genital/anus/get_sprite_suffix()
	return "anus"

/obj/item/organ/genital/anus/get_description_string()
	return "You see an anus."
