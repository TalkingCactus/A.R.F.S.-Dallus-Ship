/mob/living/simple_animal/hostile/carp
	name = "space carp"
	desc = "A ferocious, fang-bearing creature that resembles a fish."
	icon_state = "carp"
	icon_living = "carp"
	icon_dead = "carp_dead"
	icon_gib = "carp_gib"
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	taunt_chance = 30
	speed = 0
	maxHealth = 25
	health = 25

	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("gnashes")

	//Space carp aren't affected by cold.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("carp")
	flying = 1
	gold_core_spawnable = 1

/mob/living/simple_animal/hostile/carp/Process_Spacemove(movement_dir = 0)
	return 1	//No drifting in space for space carp!	//original comments do not steal

/mob/living/simple_animal/hostile/carp/AttackingTarget()
	..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjustStaminaLoss(8)

/mob/living/simple_animal/hostile/carp/holocarp
	icon_state = "holocarp"
	icon_living = "holocarp"
	maxbodytemp = INFINITY
	gold_core_spawnable = 0

/mob/living/simple_animal/hostile/carp/holocarp/death()
	..(1)
	ghostize()
	qdel(src)
	return

/mob/living/simple_animal/hostile/carp/megacarp
	icon = 'icons/mob/alienqueen.dmi'
	name = "Mega Space Carp"
	desc = "A ferocious, fang bearing creature that resembles a shark. This one seems especially ticked off."
	icon_state = "megacarp"
	icon_living = "megacarp"
	icon_dead = "megacarp_dead"
	icon_gib = "megacarp_gib"
	maxHealth = 65
	health = 65
	pixel_x = -16
	mob_size = MOB_SIZE_LARGE

	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/carp/baby
	name = "baby space carp"
	desc = "A baby version of the space carp. Aw..how cut- oh god its eating my face!"
	icon_state = "babycarp"
	icon_living = "babycarp"
	icon_dead = "babycarp_dead"
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	harm_intent_damage = 3
	melee_damage_lower = 1
	melee_damage_upper = 2
	faction = list("carp")
	taunt_chance = 30
	speed = 0
	maxHealth = 10
	health = 10

/mob/living/simple_animal/hostile/tacticalcarp
	name = "tactical carp"
	desc = "A carp with a armored sweater on."
	icon_state = "tactical_carp"
	icon_living = "tactical_carp"
	icon_dead = "tactical_carp_dead"
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	taunt_chance = 30
	speed = 0
	maxHealth = 60
	health = 60
	faction = list("carp")