#define FLOW_SPEED_SLOW "slow"
#define FLOW_SPEED_NORMAL "normal"
#define	FLOW_SPEED_FAST "fast"

/turf/simulated/liquid
	name = "water"
	desc = "A pool of water."
	icon = 'code/cactus/icons/turfs.dmi'
	icon_state = "water"
	var/reagent_id = "water"
	var/depth = 16 //how many pixels deep is it
	var/viscosity = 1 //how hard it is to move through
	var/flowing = 0 //if it's moving
	var/flow_speed = FLOW_SPEED_SLOW
	dir = 2 //which direction it's flowing

/turf/simulated/liquid/MakeSlippery(wet_setting = TURF_WET_WATER)
	return

/turf/simulated/liquid/MakeDry(wet_setting = TURF_WET_WATER)
	return

/turf/simulated/liquid/Entered()
	..()
	if(isliving(src))
		var/mob/living/M = src
		M.update_liquid_turf_overlays()

/turf/simulated/liquid/Exited()
	..()
	if(isliving(src))
		var/mob/living/M = src
		M.update_liquid_turf_overlays()

/mob/living/proc/update_liquid_turf_overlays()
	if(loc & istype(loc, /turf/simulated/liquid))
		var/turf/simulated/liquid/L = loc
		var/mask_state = "mask_16"
		var/icon/mask = new /icon('code/cactus/icons/turfs.dmi', mask_state)
		switch(src.type)
			if(/mob/living/carbon/human)
				var/mob/living/carbon/human/H = src
				for(var/x in H.overlays_standing)
					if(isicon(x))
						var/icon/i = x
						i.Blend(mask,ICON_SUBTRACT)
					if(islist(x))
						var/list/l = x
						for(var/x2 in l)//don't go any deeper, fuck this
							if(isicon(x2))
								var/icon/i2 = x2
								i2.Blend(mask,ICON_SUBTRACT)
				//H.icon.Blend(mask,ICON_SUBTRACT)
			else
				return

