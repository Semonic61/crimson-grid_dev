// RMH_ERP
// Late-loading defines. Included from tgstation.dme after ~darkpack.

/// Feature keys stored on dna.features and SSaccessories.feature_list
#define FEATURE_PENIS "penis"
#define FEATURE_TESTICLES "testicles"
#define FEATURE_VAGINA "vagina"
#define FEATURE_BREASTS "breasts"
#define FEATURE_ANUS "anus"

/// Organ slots. get_all_slots() picks these up from the organ types.
#define ORGAN_SLOT_PENIS "penis"
#define ORGAN_SLOT_TESTICLES "testicles"
#define ORGAN_SLOT_VAGINA "vagina"
#define ORGAN_SLOT_BREASTS "breasts"
#define ORGAN_SLOT_ANUS "anus"

/// Visibility stored on the organ
#define GENITAL_NEVER_SHOW 1
#define GENITAL_HIDDEN_BY_CLOTHES 2
#define GENITAL_ALWAYS_SHOW 3

/// Arousal sprite/state
#define AROUSAL_NONE 1
#define AROUSAL_PARTIAL 2
#define AROUSAL_FULL 3

/// How an interaction checks a required genital
#define REQUIRE_GENITAL_ANY 1
#define REQUIRE_GENITAL_EXPOSED 2
#define REQUIRE_GENITAL_UNEXPOSED 3

/// Interaction usage
#define INTERACTION_SELF "self"
#define INTERACTION_OTHER "other"
#define INTERACTION_BOTH "both"

#define INTERACTION_CAT_SOCIAL "Social"
#define INTERACTION_CAT_HANDS "Hands"
#define INTERACTION_CAT_ORAL "Oral"
#define INTERACTION_CAT_SEX "Sex"
#define INTERACTION_CAT_SELF "Self"

#define INTERACTION_REQUIRE_SELF_HAND "self_hand"
#define INTERACTION_REQUIRE_TARGET_HAND "target_hand"
#define INTERACTION_REQUIRE_SELF_MOUTH "self_mouth"
#define INTERACTION_REQUIRE_TARGET_MOUTH "target_mouth"

#define CLIMAX_POSITION_USER "user"
#define CLIMAX_POSITION_TARGET "target"
#define CLIMAX_PENIS ORGAN_SLOT_PENIS
#define CLIMAX_VAGINA ORGAN_SLOT_VAGINA
#define CLIMAX_BREASTS ORGAN_SLOT_BREASTS

#define ERP_MAX_AROUSAL 100
#define ERP_MAX_PLEASURE 100
#define ERP_CLIMAX_THRESHOLD 100
#define ERP_AROUSAL_DECAY 0.4
#define ERP_PLEASURE_DECAY 0.8

#define ERP_GENITAL_ORGANS list( \
	/obj/item/organ/genital/penis, \
	/obj/item/organ/genital/testicles, \
	/obj/item/organ/genital/vagina, \
	/obj/item/organ/genital/breasts, \
	/obj/item/organ/genital/anus \
)

/// RMH_ERP span helpers — not defined anywhere upstream, needed by climax.dm / interaction_datum.dm
#define span_love(str) ("<span class='love'>" + str + "</span>")
#define span_pink(str) ("<span class='pink'>" + str + "</span>")
