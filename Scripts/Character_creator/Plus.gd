extends Button

@onready var current_points = $"../Current"
@onready var points_left = $"../../Title_container/Points_left"
@onready var maximum_count = $"../../../Panel_bcg/Info/HBoxContainer/Maximum_count"

@onready var finish_creation = $"../../../../Finish_creation"








func _on_pressed():
	var current = int(current_points.text)
	var remaining = int(points_left.text)
	var maximum = int(maximum_count.text)
	if remaining>0 and current < maximum:
		current_points.text = str(current+1)
		points_left.text = str(remaining-1)
	finish_creation.done_check()
