// RMH_ERP

/obj/item/organ/genital/testicles
	name = "testicles"
	desc = "A pair of testicles."
	icon = 'modular_rmh/icons/obj/genitals/testicles.dmi'
	icon_state = "testicles"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/testicles
	genital_location = GROIN
	internal_fluid_datum = /datum/reagent/consumable/cum
	internal_fluid_maximum = 50

/datum/bodypart_overlay/mutant/genital/testicles
	feature_key = FEATURE_TESTICLES
	layers = list(EXTERNAL_ADJACENT = BODY_ADJ_LAYER, EXTERNAL_BEHIND = BODY_BEHIND_LAYER)

/obj/item/organ/genital/testicles/get_sprite_suffix()
	var/size_affix = clamp(FLOOR(genital_size, 1), 1, 5)
	return "pair_[size_affix]_s"

/obj/item/organ/genital/testicles/get_description_string()
	return "You see testicles."
