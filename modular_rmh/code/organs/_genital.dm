// RMH_ERP
// TG 2025 visual organ: /obj/item/organ + bodypart_overlay. Not Skyrat mutantpart_key.

/obj/item/organ/genital
	name = "genital"
	organ_flags = ORGAN_ORGANIC | ORGAN_UNREMOVABLE | ORGAN_EXTERNAL
	visual = TRUE
	color = "#fcccb3"
	/// Pref-facing style name, mirrors the sprite accessory.
	var/genital_style = "Human"
	var/genital_size = 2
	var/visibility_preference = GENITAL_HIDDEN_BY_CLOTHES
	var/aroused = AROUSAL_NONE
	var/always_accessible = FALSE
	var/genital_location = GROIN
	var/internal_fluid_datum
	var/internal_fluid_maximum = 0
	var/uses_skin_color = FALSE

/obj/item/organ/genital/Initialize(mapload)
	. = ..()
	if(internal_fluid_maximum > 0 && internal_fluid_datum)
		create_reagents(internal_fluid_maximum, REAGENT_HOLDER_ALIVE)
		reagents.add_reagent(internal_fluid_datum, internal_fluid_maximum * 0.4)

/obj/item/organ/genital/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
	. = ..()
	update_overlay_sprite()

/obj/item/organ/genital/proc/set_aroused(new_state)
	if(aroused == new_state)
		return
	aroused = new_state
	update_overlay_sprite()
	if(owner)
		owner.update_body_parts()

/obj/item/organ/genital/proc/set_visibility(new_vis)
	visibility_preference = new_vis
	if(owner)
		owner.update_body_parts()

/obj/item/organ/genital/proc/set_size(new_size)
	genital_size = new_size
	update_overlay_sprite()
	if(owner)
		owner.update_body_parts()

/obj/item/organ/genital/proc/get_sprite_suffix()
	return genital_style

/obj/item/organ/genital/proc/update_overlay_sprite()
	var/datum/bodypart_overlay/mutant/genital/overlay = bodypart_overlay
	if(!overlay)
		return
	overlay.sprite_suffix = get_sprite_suffix()

/obj/item/organ/genital/proc/is_exposed()
	if(always_accessible)
		return TRUE
	if(!owner || !ishuman(owner))
		return TRUE
	switch(visibility_preference)
		if(GENITAL_ALWAYS_SHOW)
			return TRUE
		if(GENITAL_HIDDEN_BY_CLOTHES)
			var/mob/living/carbon/human/human = owner
			if((human.w_uniform && human.w_uniform.body_parts_covered & genital_location) || (human.wear_suit && human.wear_suit.body_parts_covered & genital_location))
				return FALSE
			return TRUE
		else
			return FALSE

/obj/item/organ/genital/proc/get_description_string()
	return "You see \a [name]."

/obj/item/organ/genital/proc/try_fill_container(obj/item/reagent_containers/container, amount)
	if(!reagents || !container?.reagents)
		return 0
	return reagents.trans_to(container, amount, transferred_by = owner)

/datum/bodypart_overlay/mutant/genital
	layers = list(EXTERNAL_FRONT = BODY_FRONT_LAYER)
	color_source = ORGAN_COLOR_OVERRIDE
	var/sprite_suffix
	var/obj/item/organ/genital/attached_genital

/datum/bodypart_overlay/mutant/genital/New(obj/item/organ/attached_organ)
	. = ..()
	if(istype(attached_organ, /obj/item/organ/genital))
		attached_genital = attached_organ

/datum/bodypart_overlay/mutant/genital/override_color(rgb_value)
	if(attached_genital?.uses_skin_color)
		return rgb_value
	return attached_genital?.color || draw_color || rgb_value

/datum/bodypart_overlay/mutant/genital/get_base_icon_state()
	return sprite_suffix || sprite_datum?.icon_state || "human"

/datum/bodypart_overlay/mutant/genital/get_image(obj/item/bodypart/limb, layer_index, layer_real)
	var/mutable_appearance/appearance = ..()
	if(attached_genital && !attached_genital.is_exposed() && attached_genital.visibility_preference != GENITAL_ALWAYS_SHOW)
		appearance.alpha = 0
	return appearance

/// WhiteMoon/Skyrat sheets often store multiply layers as *_primary.
/datum/bodypart_overlay/mutant/genital/breasts/build_icon_state(layer_index, obj/item/bodypart/limb)
	return "[..()]_primary"
