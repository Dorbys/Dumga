extends TextureButton

@onready var label = $Label
@onready var character_adder = $"../../../../.."

@export var saved_character: Resource



func _ready():
#	loaded_resource = load(saved_character)
	#no loading required if the resource is exported to here
	label.text = saved_character.character_name
	
	
	
	




func _on_pressed():
	character_adder.add_this_character(saved_character)

