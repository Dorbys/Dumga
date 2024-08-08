extends Control

@onready var ui_layer = $UI_Layer

@export var character_creator: PackedScene
@export var character_loader: PackedScene





# Called when the node enters the scene tree for the first time.
func _ready():
	make_the_char_folder_mb()
	make_the_pfp_folder_mb()

func make_the_char_folder_mb():
	var dir = DirAccess.open("user://")
	
	# Define the folder path you want to create
	var folder_path = "user://characters"
	
	# Check if the folder already exists
	if dir.dir_exists(folder_path):
		print("Folder already exists.")
	else:
		# Attempt to create the folder
		var result = dir.make_dir(folder_path)
		
		if result == OK:
			print("Folder created successfully.")
		else:
			print("Failed to create folder. Error code: ", result)	
			
func make_the_pfp_folder_mb():
	var dir = DirAccess.open("user://")
	
	# Define the folder path you want to create
	var folder_path = "user://profile_pictures"
	
	# Check if the folder already exists
	if dir.dir_exists(folder_path):
		print("Folder already exists.")
	else:
		# Attempt to create the folder
		var result = dir.make_dir(folder_path)
		
		if result == OK:
			print("Folder created successfully.")
		else:
			print("Failed to create folder. Error code: ", result)	


func _on_creator_button_pressed():
	var another = character_creator.instantiate()
	ui_layer.add_child(another)
	



func _on_loader_button_pressed():
	var another = character_loader.instantiate()
	ui_layer.add_child(another)


func _on_exit_button_pressed():
	get_tree().quit()
