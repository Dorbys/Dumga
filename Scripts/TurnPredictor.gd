extends ColorRect

@onready var manager = $"../Manager"

var predicted_pfps = []
var unit_speeds = []
var texture_nodes = []
#this stores nodes where we will be replacing textures

var progress_bars = []
#this array is filled by ProgressBarManager during start()

var slot_count = 11
#how many texture slots for predictions does this scene have

var topper
#node that is gonna take turn
#used for rendering it on top of others if multiple reach max_value at the same time


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
		
	texture_nodes = [%T0, %T1, %T2, %T3, %T4, %T5, %T6, %T7, %T8, %T9, %T10]
	#Using the Unique name of the node we don't have to @onready load it
		#I use both somewhat incosistently
		#if care about local name = @onready | if dont care abt name = this way 
		
	#we don't fill progress_bars since Progbar manager does that
	
		
func start_up():
	for i in len(manager.character_array):
		predicted_pfps.append(manager.pfp_array[i])
		#we copy the profile pngs from the manager script into our array
	for i in len(manager.character_array):
		unit_speeds.append(int((manager.character_array[i].rychlost)))
		#we copy the player speeds from the manager script into our array	



func make_prediction():
	var completed_laps = []
	for i in slot_count:
		completed_laps.append(0)
	#the distance progress bar needs to reach will be increased using this
	#allows for predicting each unit multiple times
	
	var furthest_overstep
	var least_steps
	#because we aren't calcing speed to 48000 but how much will you step
		#behind 48000 on the step you reach it
		#because we have to be consistent how we calc who gets to play

		#calcing without this would be easier but dunno how we would pause the calc
	
	var speedest_index
	#for keeping track of who to put as the texture
	
	var my_steps
	#for actually calcing time
	
	var my_overstep
	#var for calcing overstep
	
		
	for i in slot_count:
		furthest_overstep = -1
		speedest_index = -1
		least_steps = 99999999999999999
		for j in len(manager.character_array):
			my_steps = ceil(((Base.UNIT_TURN_PROGRESS_BAR_MAX_VALUE *(1 + completed_laps[j])) - progress_bars[j].value) / unit_speeds[j])
			if my_steps < least_steps:
				my_overstep = progress_bars[j].value  + (unit_speeds[j]*my_steps)
				least_steps = my_steps
				furthest_overstep = my_overstep
				speedest_index = j
			
			if my_steps == least_steps:	
				my_overstep = progress_bars[j].value  + (unit_speeds[j]*my_steps)
				if  my_overstep >= furthest_overstep:
					furthest_overstep = my_overstep
					speedest_index = j
		#now we have speedest index of who's the next to take turn
		texture_nodes[i].texture = predicted_pfps[speedest_index]
		#so we set it's png on the slot
		if i == 0:
			topper = progress_bars[speedest_index]
		#Index 0 is %T0 which is the big one for current player
			#which is what topper represents
			#since we call it from manager
		completed_laps[speedest_index] += 1
		#and increase it's completed laps by 1 so that we don't get it as 
			#fastest every calc
				
		

