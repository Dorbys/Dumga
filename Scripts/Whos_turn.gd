extends ColorRect

@onready var ui_layer = $"../UI_layer"

@export var warning_window: PackedScene


var anything_happened = true
#if nothing happens, we want to ask whether user truly wants to end the turn
#starts at true, just so we can click go outright, its set to false at
	#start of each players turn

var disappear_time = 0.2
#do_something button gonna disappear upon clicking
#grayed out probly better




# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func new_units_turn(unit_name):
	%Player_label.text = "It's " + unit_name +"'s turn"
	anything_happened = false
	%Do_something.modulate.a = 1


func no_action_taken_warning():
	var warning = warning_window.instantiate()
	ui_layer.add_child(warning)











func _on_do_something_pressed():
	anything_happened = true
	
	var tween = create_tween()
	tween.tween_property(%Do_something, "modulate:a", 0, disappear_time)
						#what we modify
										#which property (modulate:a is transparency)
												#final value
														#change duration
	#tweening is doing something over a period of time
	
	
	
	
	
	
	
	
	

