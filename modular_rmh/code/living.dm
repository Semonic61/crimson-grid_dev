// RMH_ERP

/mob/living
	/// 0-100. Decays slowly. Drives genital arousal sprites.
	var/erp_arousal = 0
	/// 0-100. Hits ERP_CLIMAX_THRESHOLD to climax.
	var/erp_pleasure = 0
	/// Last interaction used for climax messaging.
	var/datum/interaction/erp_last_interaction
	var/mob/living/erp_last_partner

/mob/living/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/interactable)

/mob/living/Destroy()
	erp_last_interaction = null
	erp_last_partner = null
	return ..()

/mob/living/proc/adjust_erp_arousal(amount)
	erp_arousal = clamp(erp_arousal + amount, 0, ERP_MAX_AROUSAL)
	sync_genital_arousal()

/mob/living/proc/adjust_erp_pleasure(amount, datum/interaction/interaction, mob/living/partner)
	erp_pleasure = clamp(erp_pleasure + amount, 0, ERP_MAX_PLEASURE)
	if(interaction)
		erp_last_interaction = interaction
		erp_last_partner = partner
	if(erp_pleasure >= ERP_CLIMAX_THRESHOLD)
		erp_climax(interaction, partner)

/mob/living/proc/sync_genital_arousal()
	if(!iscarbon(src))
		return
	var/mob/living/carbon/carbon_source = src
	var/new_state = AROUSAL_NONE
	if(erp_arousal >= 70)
		new_state = AROUSAL_FULL
	else if(erp_arousal >= 30)
		new_state = AROUSAL_PARTIAL
	for(var/slot in list(ORGAN_SLOT_PENIS, ORGAN_SLOT_VAGINA, ORGAN_SLOT_BREASTS, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_ANUS))
		var/obj/item/organ/genital/genital = carbon_source.get_organ_slot(slot)
		if(!genital)
			continue
		if(genital.aroused == new_state)
			continue
		genital.set_aroused(new_state)

/mob/living/carbon/human/proc/has_genital(requirement, slot)
	var/obj/item/organ/genital/genital = get_organ_slot(slot)
	if(isnull(genital))
		return FALSE
	switch(requirement)
		if(REQUIRE_GENITAL_EXPOSED)
			return genital.is_exposed()
		if(REQUIRE_GENITAL_UNEXPOSED)
			return !genital.is_exposed()
		else
			return TRUE

/mob/living/proc/erp_allowed(mob/living/target)
	if(!erp_content_enabled())
		return FALSE
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return FALSE
	if(target && target != src && target.client && !target.client.prefs?.read_preference(/datum/preference/toggle/erp))
		return FALSE
	return TRUE
