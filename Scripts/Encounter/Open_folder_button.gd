extends Node

@onready var label = $Label
@onready var character_adder = $"../../../../.."

@export var folder_path: String



func _ready():
	# Extract the folder name from the path
	var path_arr = folder_path.split("/")
	#splits the path into multiple strings and puts them into array
	var folder_name = path_arr[-1]
	#we only need the last element of that string
	label.text = folder_name





func _on_pressed():
	character_adder.clear_slots()
	character_adder.open_folder(folder_path)

