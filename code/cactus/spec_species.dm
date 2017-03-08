//Any non-human species. These are generally rewarded to donators for their support.
/datum/spec_species
	var/id = "def"
	var/name = "Default"
	var/mob_type//as a mob typepath
	var/whitelisted = TRUE//Keep this TRUE or it'll show up for everyone
	var/list/whitelist = list()//Leave blank if it should be allowed for anyone who has donated.
	var/blacklisted = FALSE//Any specifiic people barred from this? Maybe they abuse it or whatever.
	var/list/blacklist = list()//List them here.
	var/colored = FALSE//If the sprite is greyscaled and able to be colored.

proc/get_spec_racelist(var/mob/user)//This proc returns a list of species that 'user' has available to them. It searches the list of ckeys attached to the 'whitelist' var for a species and also checks if they're an admin.
	var/list/spec_list = list()
	for(var/spath in typesof(/datum/spec_species))
		var/datum/spec_species/S = new spath()
		var/list/wlist = S.whitelist
		var/list/blist = S.blacklist
		if(S.blacklisted && (blist.Find(user.ckey) || blist.Find(user.key)))
			continue//they're blacklisted, so continue to the next species
		if(S.whitelisted && (wlist.Find(user.ckey) || wlist.Find(user.key) || user.client.holder))  //If your ckey is on the species whitelist or you're an admin:
			spec_list[S.id] = S.type                                             	//Add the species to their available species list.

	return spec_list

proc/has_spec_race(var/mob/user)
	if(!user.key || !user.ckey)
		CRASH("No ckey found for [user].")
	var/list/keys = list()
	for(var/spath in typesof(/datum/spec_species))
		var/datum/spec_species/S = new spath()
		if(S.whitelist.len)
			keys |= S.whitelist
	if(keys.len)
		if( (keys.Find(user.ckey) || keys.Find(user.key)) )
			return TRUE
		else
			return FALSE
	return FALSE

/datum/spec_species/alien
	id = "alien"
	name = "Alien"
	mob_type = /mob/living/carbon/alien/humanoid/hunter/snowflake
	whitelist = list("TalkingCactus")
	colored = TRUE

/datum/spec_species/lustyalien
	id = "lustyalien"
	name = "Lusty Xenomorph Maid"
	mob_type = /mob/living/carbon/alien/humanoid/hunter/lusty
	whitelist = list("TalkingCactus")

/mob/living/carbon/alien/humanoid/hunter/snowflake
	name = "alien"
	caste = "flake"
	maxHealth = 100
	health = 100
	icon_state = "alienflake_s"
	unique_name = 0
	languages = 1
	has_fine_manipulation = 1

/mob/living/carbon/alien/humanoid/hunter/snowflake/IsAdvancedToolUser()
	return 1
