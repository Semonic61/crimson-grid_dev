// RMH_ERP
// Always-visible character prefs (no relevant_organ) so they show for every splat.
// apply_to_human writes dna.features; regenerate_organs + should_visual_organ_apply_to
// actually inserts/removes the organ.

/datum/preference/choiced/erp_genital
	abstract_type = /datum/preference/choiced/erp_genital
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	should_generate_icons = TRUE
	var/feature_key
	var/obj/item/organ/genital/organ_path

/datum/preference/choiced/erp_genital/init_possible_values()
	return assoc_to_keys_features(SSaccessories.feature_list[feature_key])

/datum/preference/choiced/erp_genital/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/erp_genital/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features[feature_key] = value
	var/obj/item/organ/genital/existing = target.get_organ_slot(initial(organ_path.slot))
	if(value == SPRITE_ACCESSORY_NONE)
		if(existing)
			existing.Remove(target)
			qdel(existing)
		return
	if(!existing)
		existing = new organ_path
		existing.Insert(target)
	existing.genital_style = value
	existing.update_overlay_sprite()

/datum/preference/choiced/erp_genital/icon_for(value)
	if(value == SPRITE_ACCESSORY_NONE)
		return uni_icon('icons/mob/landmarks.dmi', "x")
	var/obj_icon = initial(organ_path.icon)
	var/obj_state = initial(organ_path.icon_state)
	return uni_icon(obj_icon, obj_state)

/datum/preference/choiced/erp_genital/penis
	savefile_key = "feature_penis"
	feature_key = FEATURE_PENIS
	organ_path = /obj/item/organ/genital/penis

/datum/preference/choiced/erp_genital/testicles
	savefile_key = "feature_testicles"
	feature_key = FEATURE_TESTICLES
	organ_path = /obj/item/organ/genital/testicles

/datum/preference/choiced/erp_genital/vagina
	savefile_key = "feature_vagina"
	feature_key = FEATURE_VAGINA
	organ_path = /obj/item/organ/genital/vagina

/datum/preference/choiced/erp_genital/breasts
	savefile_key = "feature_breasts"
	feature_key = FEATURE_BREASTS
	organ_path = /obj/item/organ/genital/breasts

/datum/preference/choiced/erp_genital/anus
	savefile_key = "feature_anus"
	feature_key = FEATURE_ANUS
	organ_path = /obj/item/organ/genital/anus

/datum/preference/numeric/erp_genital_size
	abstract_type = /datum/preference/numeric/erp_genital_size
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	minimum = 1
	maximum = 5
	step = 1
	var/obj/item/organ/genital/organ_path

/datum/preference/numeric/erp_genital_size/create_default_value()
	return 2

/datum/preference/numeric/erp_genital_size/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	var/obj/item/organ/genital/existing = target.get_organ_slot(initial(organ_path.slot))
	if(existing)
		existing.set_size(value)

/datum/preference/numeric/erp_genital_size/penis
	savefile_key = "penis_size"
	organ_path = /obj/item/organ/genital/penis

/datum/preference/numeric/erp_genital_size/testicles
	savefile_key = "testicles_size"
	organ_path = /obj/item/organ/genital/testicles

/datum/preference/numeric/erp_genital_size/breasts
	savefile_key = "breasts_size"
	organ_path = /obj/item/organ/genital/breasts
	minimum = 0
	maximum = 8

/datum/preference/color/erp_genital_color
	abstract_type = /datum/preference/color/erp_genital_color
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	var/obj/item/organ/genital/organ_path

/datum/preference/color/erp_genital_color/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	var/obj/item/organ/genital/existing = target.get_organ_slot(initial(organ_path.slot))
	if(existing)
		existing.color = value
		target.update_body_parts()

/datum/preference/color/erp_genital_color/penis
	savefile_key = "penis_color"
	organ_path = /obj/item/organ/genital/penis

/datum/preference/color/erp_genital_color/vagina
	savefile_key = "vagina_color"
	organ_path = /obj/item/organ/genital/vagina

/datum/preference/color/erp_genital_color/breasts
	savefile_key = "breasts_color"
	organ_path = /obj/item/organ/genital/breasts
