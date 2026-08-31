// RMH_ERP

/obj/item/organ/genital/penis
	name = "penis"
	desc = "A male reproductive organ."
	icon = 'modular_rmh/icons/obj/genitals/penis.dmi'
	icon_state = "penis"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/penis
	genital_location = GROIN
	internal_fluid_datum = /datum/reagent/consumable/cum
	internal_fluid_maximum = 30
	var/girth = 9
	var/knotted = FALSE

/datum/bodypart_overlay/mutant/genital/penis
	feature_key = FEATURE_PENIS
	layers = list(EXTERNAL_FRONT = BODY_FRONT_LAYER, EXTERNAL_BEHIND = BODY_BEHIND_LAYER)

/obj/item/organ/genital/penis/get_sprite_suffix()
	var/size_affix
	var/measured = FLOOR(genital_size, 1)
	switch(measured)
		if(1 to 2)
			size_affix = "1"
		if(3 to 4)
			size_affix = "2"
		if(5 to 6)
			size_affix = "3"
		else
			size_affix = "4"
	var/erect = (aroused == AROUSAL_FULL) ? "1" : "0"
	return "[LOWER_TEXT(genital_style)]_[size_affix]_[erect]"

/obj/item/organ/genital/penis/get_description_string()
	var/style_text = LOWER_TEXT(genital_style) == "human" ? "" : "[LOWER_TEXT(genital_style)] "
	var/text = "You see a [style_text]penis."
	switch(aroused)
		if(AROUSAL_NONE)
			text += " It seems flaccid."
		if(AROUSAL_PARTIAL)
			text += " It's partially erect."
		if(AROUSAL_FULL)
			text += " It's fully erect."
	return text
