extends Node

@onready var label = $Label
@onready var ui_layer = $"../../../../../../UI_Layer"

@export var character_loader: PackedScene = preload("res://Scenes/Character_loader/Character_loader.tscn")
@export var folder_path: String



func _ready():
	# Extract the folder name from the path
	var path_arr = folder_path.split("/")
	#splits the path into multiple strings and puts them into array
	var folder_name = path_arr[-1]
	#we only need the last element of that string
	label.text = folder_name





func _on_pressed():
	var another = character_loader.instantiate()
	another.dir_path = folder_path
	ui_layer.add_child(another)


