// RMH_ERP
// Humans (and anything that subtypes them) get genital mutant organs.
// should_visual_organ_apply_to() still skips insertion when the pref is None.

/datum/species/human/New()
	. = ..()
	mutant_organs |= ERP_GENITAL_ORGANS
