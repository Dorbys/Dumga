extends TextureButton

@onready var manager = $"../../Manager"
#we connect like this even though this isn't in the same scene in the editor
#we know this will spawn as child of UI_layer






# Called when the node enters the scene tree for the first time.
#func _ready():
#	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass






























func _on_pressed():
	queue_free()
	#delete myself at the end of frame

func _on_yes_pressed():
	manager.end_turn()
	queue_free()
	
func _on_no_pressed():
	queue_free()
	#delete myself at the end of frame







