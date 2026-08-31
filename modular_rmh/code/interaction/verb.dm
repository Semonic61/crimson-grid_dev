// RMH_ERP

/mob/living/verb/erp_interact()
	set name = "Interact"
	set category = "IC"
	set desc = "Open the interaction panel on yourself or someone you are targeting."

	if(!erp_content_enabled())
		to_chat(src, span_warning("ERP content is disabled on this server."))
		return

	var/mob/living/target = src
	if(isliving(pulling))
		target = pulling
	else if(isliving(usr.client?.mob))
		var/atom/hovered = client?.mouse_object_ref?.resolve()
		if(isliving(hovered) && get_dist(src, hovered) <= 1)
			target = hovered

	var/datum/component/interactable/panel = target.GetComponent(/datum/component/interactable)
	if(!panel)
		to_chat(src, span_warning("They cannot be interacted with."))
		return
	panel.open_menu(src, target)
