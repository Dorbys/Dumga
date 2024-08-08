extends TextureButton

@onready var manager = $"../../Manager"
############################### HERE






func _on_pressed():
	queue_free()
	#delete myself at the end of frame

func _on_yes_pressed():
	manager.end_turn()
	queue_free()
	
func _on_no_pressed():
	queue_free()
	#delete myself at the end of frame







