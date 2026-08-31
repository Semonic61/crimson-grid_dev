// RMH_ERP
// Re-open SSaccessories.setup_lists so genital feature lists exist without
// editing the upstream subsystem file.
//
// NOTE: code/controllers/subsystem/sprite_accessories.dm #undefs both of
// these macros at the end of its own file, so by the time this file is
// compiled (it's included near END_INCLUDE) they no longer exist. Redefine
// them locally — init_sprite_accessory_subtypes() itself is a real proc on
// the subsystem, so it stays reachable regardless of include order.
#define DEFAULT_SPRITE_LIST "default_sprites"
#define INIT_OPTIONAL_ACCESSORY(sprite_accessory) init_sprite_accessory_subtypes(sprite_accessory, add_blank = TRUE)[DEFAULT_SPRITE_LIST]

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	feature_list[FEATURE_PENIS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/penis)
	feature_list[FEATURE_TESTICLES] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/testicles)
	feature_list[FEATURE_VAGINA] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/vagina)
	feature_list[FEATURE_BREASTS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/breasts)
	feature_list[FEATURE_ANUS] = INIT_OPTIONAL_ACCESSORY(/datum/sprite_accessory/genital/anus)

#undef INIT_OPTIONAL_ACCESSORY
#undef DEFAULT_SPRITE_LIST
