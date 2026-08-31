// RMH_ERP

/mob/living/proc/erp_climax(datum/interaction/interaction, mob/living/partner)
	erp_pleasure = 0
	erp_arousal = max(erp_arousal - 40, 10)
	sync_genital_arousal()

	var/partner_text = partner ? "[partner]" : "the air"
	visible_message(
		span_love("<b>[src]</b> climaxes[partner ? " with [partner_text]" : ""]!"),
		span_love("You climax[partner ? " with [partner_text]" : ""]!"),
	)

	if(!iscarbon(src))
		return
	var/mob/living/carbon/carbon_source = src

	var/obj/item/organ/genital/penis/penis = carbon_source.get_organ_slot(ORGAN_SLOT_PENIS)
	var/obj/item/organ/genital/vagina/vagina = carbon_source.get_organ_slot(ORGAN_SLOT_VAGINA)
	var/obj/item/organ/genital/testicles/testicles = carbon_source.get_organ_slot(ORGAN_SLOT_TESTICLES)

	var/obj/item/organ/genital/source_organ = penis || vagina
	if(testicles?.reagents)
		source_organ = testicles

	if(!source_organ?.reagents)
		return

	var/transfer_amount = clamp(source_organ.reagents.total_volume * 0.35, 3, 15)
	if(partner)
		var/obj/item/held = partner.get_active_held_item()
		if(istype(held) && held.is_refillable())
			source_organ.try_fill_container(held, transfer_amount)
			to_chat(partner, span_notice("Some fluid spills into [held]."))
			return
		if(partner.reagents)
			source_organ.reagents.trans_to(partner, min(transfer_amount, 5), transferred_by = src)
			return
	source_organ.reagents.remove_all(transfer_amount)
