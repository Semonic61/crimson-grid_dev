// RMH_ERP

/mob/living/carbon/human/examine(mob/user)
	. = ..()
	if(!erp_content_enabled())
		return
	if(!ishuman(user))
		return
	if(user != src && user.client && !user.client.prefs?.read_preference(/datum/preference/toggle/erp))
		return
	for(var/slot in list(ORGAN_SLOT_BREASTS, ORGAN_SLOT_PENIS, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_VAGINA, ORGAN_SLOT_ANUS))
		var/obj/item/organ/genital/genital = get_organ_slot(slot)
		if(!genital?.is_exposed())
			continue
		. += span_notice(genital.get_description_string())
