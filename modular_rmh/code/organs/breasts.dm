// RMH_ERP

/obj/item/organ/genital/breasts
	name = "breasts"
	desc = "A pair of breasts."
	icon = 'modular_rmh/icons/obj/genitals/breasts.dmi'
	icon_state = "breasts"
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/breasts
	genital_location = CHEST
	internal_fluid_datum = /datum/reagent/consumable/milk
	internal_fluid_maximum = 60
	var/lactating = TRUE

/datum/bodypart_overlay/mutant/genital/breasts
	feature_key = FEATURE_BREASTS
	layers = list(EXTERNAL_FRONT = BODY_FRONT_LAYER, EXTERNAL_BEHIND = BODY_BEHIND_LAYER)

/obj/item/organ/genital/breasts/get_sprite_suffix()
	var/size_affix = clamp(FLOOR(genital_size, 1), 0, 5)
	return "[LOWER_TEXT(genital_style)]_[size_affix]"

/obj/item/organ/genital/breasts/get_description_string()
	return "You see [LOWER_TEXT(genital_style)] breasts."

/obj/item/organ/genital/breasts/on_life(seconds_per_tick, times_fired)
	. = ..()
	if(!lactating || !reagents)
		return
	if(reagents.total_volume >= internal_fluid_maximum)
		return
	reagents.add_reagent(internal_fluid_datum, 0.15 * seconds_per_tick)
