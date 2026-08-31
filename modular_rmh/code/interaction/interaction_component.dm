// RMH_ERP
// Owns the MobInteraction TGUI. Slimmer than WhiteMoon's 21k-line component:
// no vore, no toys tab, no simulated NPC genitals.

/datum/component/interactable
	dupe_mode = COMPONENT_DUPE_UNIQUE
	var/mob/living/self
	var/mob/living/interacting_with
	var/list/auto_interaction_info = list()

/datum/component/interactable/Initialize(...)
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	self = parent

/datum/component/interactable/RegisterWithParent()
	RegisterSignal(parent, COMSIG_CLICK_CTRL_SHIFT, PROC_REF(on_ctrl_shift_click))

/datum/component/interactable/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_CLICK_CTRL_SHIFT)

/datum/component/interactable/Destroy(force)
	self = null
	interacting_with = null
	return ..()

/datum/component/interactable/proc/on_ctrl_shift_click(mob/living/source, mob/user)
	SIGNAL_HANDLER
	if(!isliving(user))
		return
	INVOKE_ASYNC(src, PROC_REF(open_menu), user, source)

/datum/component/interactable/proc/open_menu(mob/living/user, mob/living/target)
	if(!erp_content_enabled())
		to_chat(user, span_warning("ERP content is disabled on this server."))
		return
	if(!user.client)
		return
	interacting_with = user
	ui_interact(user)

/datum/component/interactable/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MobInteraction")
		ui.open()

/datum/component/interactable/ui_state(mob/user)
	return GLOB.conscious_state

/datum/component/interactable/ui_data(mob/living/user)
	var/mob/living/target = self
	var/list/data = list()
	data["isTargetSelf"] = (user == target)
	data["interactingWith"] = (user == target) ? "Interacting with yourself" : "Interacting with [target]"
	data["pleasure"] = user.erp_pleasure
	data["maxPleasure"] = ERP_MAX_PLEASURE
	data["arousal"] = user.erp_arousal
	data["maxArousal"] = ERP_MAX_AROUSAL
	data["pain"] = 0
	data["maxPain"] = 100
	data["theirPleasure"] = target.erp_pleasure
	data["theirMaxPleasure"] = ERP_MAX_PLEASURE
	data["theirArousal"] = target.erp_arousal
	data["theirMaxArousal"] = ERP_MAX_AROUSAL
	data["theirPain"] = 0
	data["theirMaxPain"] = 100
	data["selfAttributes"] = get_attribute_list(user)
	data["theirAttributes"] = get_attribute_list(target)
	data["ref_user"] = REF(user)
	data["ref_self"] = REF(target)
	data["self"] = target.name
	data["block_interact"] = get_dist(user, target) > 1 && user != target
	data["favorite_interactions"] = list()
	data["auto_interaction_info"] = auto_interaction_info
	data["auto_interaction_speed_values"] = list(1, 2, 3, 4, 5)
	data["can_erp"] = user.erp_allowed(target)

	var/list/categories = list()
	var/list/interactions_by_cat = list()
	var/list/descriptions = list()
	var/list/colors = list()
	var/list/additional = list()

	for(var/datum/interaction/interaction as anything in SSinteractions.get_available(user, target))
		if(!(interaction.category in categories))
			categories += interaction.category
			interactions_by_cat[interaction.category] = list()
		interactions_by_cat[interaction.category] += interaction.id
		descriptions[interaction.id] = interaction.description
		colors[interaction.id] = interaction.color
		additional[interaction.id] = interaction.additional_details

	data["categories"] = categories
	data["interactions"] = interactions_by_cat
	data["descriptions"] = descriptions
	data["colors"] = colors
	data["additional_details"] = additional
	data["genitals"] = get_genital_data(user)
	data["content_prefs"] = get_content_prefs(user)
	return data

/datum/component/interactable/proc/get_attribute_list(mob/living/who)
	var/list/attrs = list()
	if(!ishuman(who))
		return list("are here.")
	var/mob/living/carbon/human/human = who
	for(var/slot in list(ORGAN_SLOT_PENIS, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_VAGINA, ORGAN_SLOT_BREASTS, ORGAN_SLOT_ANUS))
		var/obj/item/organ/genital/genital = human.get_organ_slot(slot)
		if(!genital)
			continue
		attrs += genital.get_description_string()
	if(!length(attrs))
		attrs += "have no visible genitals."
	return attrs

/datum/component/interactable/proc/get_genital_data(mob/living/user)
	var/list/out = list()
	if(!ishuman(user))
		return out
	var/mob/living/carbon/human/human = user
	for(var/slot in list(ORGAN_SLOT_PENIS, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_VAGINA, ORGAN_SLOT_BREASTS, ORGAN_SLOT_ANUS))
		var/obj/item/organ/genital/genital = human.get_organ_slot(slot)
		if(!genital)
			continue
		out += list(list(
			"name" = genital.name,
			"slot" = slot,
			"visibility" = genital.visibility_preference,
			"aroused" = genital.aroused,
			"can_arouse" = TRUE,
			"always_accessible" = genital.always_accessible,
		))
	return out

/datum/component/interactable/proc/get_content_prefs(mob/living/user)
	if(!user.client)
		return list()
	return list(
		"erp_pref" = user.client.prefs.read_preference(/datum/preference/toggle/erp),
		"erp_sounds_pref" = user.client.prefs.read_preference(/datum/preference/toggle/erp/sounds),
		"erp_autocum_pref" = user.client.prefs.read_preference(/datum/preference/toggle/erp/autocum),
		"erp_status" = user.client.prefs.read_preference(/datum/preference/choiced/erp_status),
	)

/datum/component/interactable/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/living/user = ui.user
	if(!isliving(user))
		return
	switch(action)
		if("interact")
			var/datum/interaction/interaction = SSinteractions.interactions[params["interaction"]]
			if(!interaction)
				return TRUE
			interaction.act(user, self)
			return TRUE
		if("genital_visibility")
			if(!ishuman(user))
				return TRUE
			var/mob/living/carbon/human/human = user
			var/obj/item/organ/genital/genital = human.get_organ_slot(params["genital"])
			if(!genital)
				return TRUE
			var/new_vis = text2num(params["visibility"])
			if(new_vis in list(GENITAL_NEVER_SHOW, GENITAL_HIDDEN_BY_CLOTHES, GENITAL_ALWAYS_SHOW))
				genital.set_visibility(new_vis)
			return TRUE
		if("genital_arousal")
			if(!ishuman(user))
				return TRUE
			var/mob/living/carbon/human/human = user
			var/obj/item/organ/genital/genital = human.get_organ_slot(params["genital"])
			if(!genital)
				return TRUE
			var/new_state = text2num(params["arousal"])
			if(new_state in list(AROUSAL_NONE, AROUSAL_PARTIAL, AROUSAL_FULL))
				genital.set_aroused(new_state)
			return TRUE
		if("toggle_genital_accessibility")
			if(!ishuman(user))
				return TRUE
			var/mob/living/carbon/human/human = user
			var/obj/item/organ/genital/genital = human.get_organ_slot(params["genital"])
			if(!genital)
				return TRUE
			genital.always_accessible = !genital.always_accessible
			return TRUE
		if("pref")
			if(!user.client)
				return TRUE
			var/pref_key = params["pref"]
			switch(pref_key)
				if("erp_pref")
					user.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/toggle/erp], !user.client.prefs.read_preference(/datum/preference/toggle/erp))
				if("erp_sounds_pref")
					user.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/toggle/erp/sounds], !user.client.prefs.read_preference(/datum/preference/toggle/erp/sounds))
				if("erp_autocum_pref")
					user.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/toggle/erp/autocum], !user.client.prefs.read_preference(/datum/preference/toggle/erp/autocum))
			return TRUE
	return FALSE
