extends ProgressBar

@onready var profile_control = $Profile_control
@onready var profile_picture = $Profile_control/Profile_picture

var unit_speed = 120
var unit_pfp
#the png that represents this progress bar is added here during creation of
#this progress bar in progress_bar_manager

var MAX_VALUE_VAR = Base.UNIT_TURN_PROGRESS_BAR_MAX_VALUE
#we steal the value from 'Base' script so that it can be edited in 1 place
	#and the change takes place in all scripts
	#Use rarely
#the higher the more steps can be done -> smaller differences in speed can 

var MINIMAL_Z_INDEX = -4096
#Z indexing = which image is rendered on top of which

var Max_range_creator = 6
#maximal range is 4096*2 (negative + positive z index range) +1
#Max_range_creator will divide progress bar value 
	#into closest to max range number
#48 000 /6 is like 8000

var check_value = 0
#we use this to check whether a progressbar would reach MAX_VALUE_VAR
#if not, it does normal step, if it does, only a portion of speed is added
#we need to make sure all other progressbars only increase by a portion of
	#their speed

var z_index_for_playing_progbar = 4000
#used when progress bar which should play renders under another
	#with the same value (max value) (because of having lower index


## Called when the node enters the scene tree for the first time.
func _ready():
	max_value = MAX_VALUE_VAR
	#sets the max value of ProgressBar node to 100000
	#Don't mind the fact I already set it in the editor, 
	#I want data I work with to be in the scripts explicitly
	profile_picture.texture = unit_pfp




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	value += unit_speed*2.0
##	var tween = create_tween().set_trans()
##	tween.tween_property(profile_control,"position:x", value/100.0, delta )
#	profile_control.position.x = value/100.0
	
func normal_step():
	value += unit_speed
	update_pfp_position()
	z_index = MINIMAL_Z_INDEX + (value/Max_range_creator)	#use () pls
	#-4096 is the lowest possible value of Z_index
	#I set max value of progress bar to 100 000

	
func update_pfp_position():
	profile_control.position.x = value/(Base.UNIT_TURN_PROGRESS_BAR_MAX_VALUE / size.x)
	#divided by 100 cuz there are 1000 pixels but 48 000 steps in progbar
							#	  size x           max val 
	z_index = MINIMAL_Z_INDEX + (value/Max_range_creator)  +1
					#+1 because Manager is supposed to be drawn behind them
	
func render_on_top():
	z_index = z_index_for_playing_progbar

func start_new_lap():
	check_value = 0
	value = 0
	update_pfp_position()
