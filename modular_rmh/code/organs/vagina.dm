// RMH_ERP

/obj/item/organ/genital/vagina
	name = "vagina"
	desc = "A female reproductive organ."
	icon = 'modular_rmh/icons/obj/genitals/vagina.dmi'
	icon_state = "vagina"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/vagina
	genital_location = GROIN
	internal_fluid_datum = /datum/reagent/consumable/femcum
	internal_fluid_maximum = 25

/datum/bodypart_overlay/mutant/genital/vagina
	feature_key = FEATURE_VAGINA
	layers = list(EXTERNAL_FRONT = BODY_FRONT_LAYER)

/obj/item/organ/genital/vagina/get_sprite_suffix()
	var/wet = (aroused >= AROUSAL_PARTIAL) ? "1" : "0"
	return "[LOWER_TEXT(genital_style)]_[wet]"

/obj/item/organ/genital/vagina/get_description_string()
	var/style_text = LOWER_TEXT(genital_style)
	var/text = "You see a [style_text] vagina."
	if(aroused >= AROUSAL_PARTIAL)
		text += " It's glistening."
	return text
