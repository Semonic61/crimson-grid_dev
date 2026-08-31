// RMH_ERP
// Re-open SSaccessories.setup_lists so genital feature lists exist without
// editing the upstream subsystem file.

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	feature_list[FEATURE_PENIS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/penis)
	feature_list[FEATURE_TESTICLES] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/testicles)
	feature_list[FEATURE_VAGINA] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/vagina)
	feature_list[FEATURE_BREASTS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/breasts)
	feature_list[FEATURE_ANUS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/anus)
