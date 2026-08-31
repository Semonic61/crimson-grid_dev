// RMH_ERP
// Master switch. Leave off on production until staff want the panel live.
// Also respects the existing nsfw_content config used by flavor text.

/datum/config_entry/flag/erp_content

/proc/erp_content_enabled()
	return CONFIG_GET(flag/erp_content)
