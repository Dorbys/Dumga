extends TextureButton

@export var caller: Node
############################### HERE






func _on_pressed():
	queue_free()
	#delete myself at the end of frame

func _on_yes_pressed():
	caller.end_turn()
	queue_free()
	
func _on_no_pressed():
	queue_free()
	#delete myself at the end of frame







