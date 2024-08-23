extends Control



func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		#if esc is pressed, quit the game
			get_tree().quit()


