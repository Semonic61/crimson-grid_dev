// RMH_ERP

SUBSYSTEM_DEF(interactions)
	name = "Interactions"
	ss_flags = SS_NO_INIT
	wait = 2 SECONDS
	var/list/datum/interaction/interactions = list()

/datum/controller/subsystem/interactions/PreInit()
	for(var/path in subtypesof(/datum/interaction))
		var/datum/interaction/interaction = new path
		if(interaction.abstract)
			qdel(interaction)
			continue
		if(!interaction.id)
			interaction.id = "[path]"
		interactions[interaction.id] = interaction

/datum/controller/subsystem/interactions/fire(resumed)
	for(var/mob/living/living_mob as anything in GLOB.alive_mob_list)
		if(!living_mob.erp_arousal && !living_mob.erp_pleasure)
			continue
		living_mob.erp_arousal = max(0, living_mob.erp_arousal - ERP_AROUSAL_DECAY)
		living_mob.erp_pleasure = max(0, living_mob.erp_pleasure - ERP_PLEASURE_DECAY)
		if(living_mob.erp_arousal < 30)
			living_mob.sync_genital_arousal()
