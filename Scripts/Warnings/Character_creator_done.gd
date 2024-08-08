extends TextureButton

@onready var finish_creation = $"../Finish_creation"
############################### HERE






func _on_pressed():
	queue_free()
	#delete myself at the end of frame

func _on_yes_pressed():
	finish_creation.create_character()
	queue_free()
	
func _on_no_pressed():
	queue_free()
	#delete myself at the end of frame







