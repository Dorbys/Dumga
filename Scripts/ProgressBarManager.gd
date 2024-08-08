extends Control


@export var progress_bar: PackedScene
#this is how to spawn a preconstructed scene
# dont use '=' , only works with ':'

@onready var predict_rect = $"../PredictRect"
#this is loaded by the base_scene 
	#so it can make problems when moving stuff around in there
	#since we are using relative adresses


@onready var whos_turn = $"../Whos_turn"
#to tell there who's turn it is





var population = 0
#this will keep track of how many children this node has
#each child = 1 unit_progress_bar

var my_bars = []
#array which we can sort by turn progress, used for Z indexing
#Z indexing = which image is on top of which

var MAX_VALUE_VAR = Base.UNIT_TURN_PROGRESS_BAR_MAX_VALUE
#we steal the value from 'Base' script so that it can be edited in 1 place
	#and the change takes place in all scripts
	#Use rarely
#the higher the more steps can be done -> smaller differences in speed can 

var remainder_multiplier = 0.0
#if bar with speed 100 needs only 50 value to get to max
#	the bar gets 50 value and this is set to 50/100
# 	so that other bars also progress only by half a step

var started = false
#temporary bool because I start it by clicking button instead of ready()

#var forcing_end_of_turn = false
#used if we want to end turn without doing any action
	#due to the nature of TTRPGS we can't implement all actions
#used primarly as a warning 
#nevermind, probly not gonna need it

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
	
	
func start():
	if started == false:
		started = true
		switch_on_or_off()
		#turns off _process function
		#so that progress bars don't start until we tell them to
		#since their progression is being done here
		
		for i in 5:
			var new_bar = progress_bar.instantiate()
			#spawns a copy of the progressbar scene
			
			new_bar.unit_pfp = Base.PLAYER_PFPS_TEXTURES[i]
			#we set variables that have to be set before the scene actually enters
			#the scene tree
			new_bar.unit_speed = Base.player_speeds[i]
			new_bar.name = Base.player_names[i]
			#this changes the name of a node, which are displayed 
			#	on the left in the scene manager
			
			predict_rect.progress_bars.append(new_bar)
			#bar is added to array, but still doesn't actually exist
			#the array is in the TurnPredictor node's script
			
			add_child(new_bar)
			#the progress bar enters scene tree as child of Manager
			#now it actually exists
	else: print("don't start me again :<")

		
var switch = 1
#dunno how to check for whether process is active so I made my own
#starts at one cuz process starts on
func switch_on_or_off():
	print("switching")
	if switch == 1:
		set_process(false)
		switch = 0
	else:
		population = get_child_count()
		#refresh population
		
		set_process(true)
		#switch is set to 1 inside process once

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var anyone_gonna_play = false
	for i in population:
		var target = get_child(i)
		if target.check_value >= MAX_VALUE_VAR:
			target.start_new_lap()
		#the unit that has played last turn is reset here
		
		target.check_value += target.unit_speed
		#we measure how big of a step the unit is gonna make
		if target.check_value >= MAX_VALUE_VAR:
			anyone_gonna_play = true
			#if someone's step would reach "the finish line"
				#they're gonna play a turn, need to keep track of that
				
	if switch == 0: 
		switch = 1
		predict_rect.make_prediction()
		#we make new prediction of who's gonna take next turns
		
		
	###############			YES PLAYING PART			########################
	if anyone_gonna_play == true:
		var pushback = 2
		#if two units happen to "play at the same time" by max value
			#on the same tick, one of them is pushed back (without moving the png)
		var highest_check_value = 0
		var index_of_the_one_to_play = 0
		#we use these two vars to identify which bar has the highest right
			#to take turn
		for i in population:
			var target = get_child(i)
			if target.check_value >= highest_check_value or abs(highest_check_value-target.check_value) < 0.1:
				#the '=' is there in case two units have exactly same value
					#then the one with higher index is drawn
					#on top of the other one
					#so it should be the one to play
				highest_check_value = target.check_value
				index_of_the_one_to_play = i
				printerr("adding " +str(target.name) +" with check_value of: " +str(target.check_value))
		#now the 'index_of_the_one_to_play' contains what it's called
			else: 
				printerr("not adding " +str(target.name) +" with check_value of: " +str(target.check_value))

		var playing_progress_bar = get_child(index_of_the_one_to_play)
		#all the progressbars are children of this node, since we know the index
			#of the one to play, we can target that progress bar 
		remainder_multiplier = (MAX_VALUE_VAR - playing_progress_bar.value) / (playing_progress_bar.unit_speed * 1.0) #the times one is to make it a float 
		#if bar with speed 100 needs only 50 value to get to max
			#	the bar gets 50 value and this is set to 50/100
			# 	so that other bars also progress only by half a step
			
		for i in range(population -1, -1, -1):
			var target = get_child(i)
			var value_to_be_added = remainder_multiplier * target.unit_speed
			target.value += value_to_be_added
			target.check_value = target.value
			#CARE: check_value has the rounding problem, value doesn't since
				#cuz it's rounded internaly by godot since it can't be non-int
			target.update_pfp_position()
			
			if i == index_of_the_one_to_play and (target.value != MAX_VALUE_VAR or target.check_value != MAX_VALUE_VAR):
				push_error("Your remainder_multiplier doesn't work, value: " + str(target.value) + " check_value: " + str(target.check_value))
			#the index of the one to play should be equal to MAX_VALUE_VAR
				#but the rounding process might fuck this up
				#or maybe my formula is wrong
				
			if target.value == MAX_VALUE_VAR and i != index_of_the_one_to_play:
				push_error("this unit isn't supposed play, index: " + str(i))
				push_error(" value: " + str(target.value) + " check_value: " + str(target.check_value))

				var pushback_target = get_child(i)
				pushback_target.value -= pushback
				pushback_target.check_value = pushback_target.value
				#pushing back the slower unit that was also supposed to play 
				pushback += 2
				#in case even more units want to play at once
				
#		playing_progress_bar.render_on_top()
		#if progress bar with lower index made a bigger step, it played first
			#but had the same z index as the others on Max_value
			#meaning it would render under them	
				
		switch_on_or_off()
		print("it's " +str(Base.player_names[index_of_the_one_to_play]) +"'s turn")
		print("their values are: " +str(get_child(index_of_the_one_to_play).value) + " and " +str(get_child(index_of_the_one_to_play).check_value))
		predict_rect.topper.render_on_top()
		#the one to play should always render on top
			#but if there are two with the same z index,
			#the node with higher index is drawn on top
		whos_turn.visible = true
		whos_turn.new_units_turn(Base.player_names[index_of_the_one_to_play])
	###############			NOT PLAYING PART			########################
	elif anyone_gonna_play == false:		
	#could be 'else' instof 'elif' but this is looks clearer
		for i in population:
			var target = get_child(i)
			target.value += target.unit_speed
			target.update_pfp_position()

func _on_texture_button_pressed():
	if whos_turn.anything_happened == false :
		whos_turn.no_action_taken_warning()
	else:
		end_turn()

func end_turn():
	whos_turn.visible = false
	switch_on_or_off()

func _on_starter_pressed():
	start()
	visible = true
	predict_rect.visible = true
	predict_rect.make_prediction()
