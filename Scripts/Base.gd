extends Node

var PLAYER_PFPS_TEXTURES = []

var UNIT_TURN_PROGRESS_BAR_MAX_VALUE = 48000


var player_names = ["Afrosirka", "Dorbys", "Manyjak", "Random9", "Thor"]
var player_speeds = [180, 150, 140,130, 120]
#Default speed = 120



func _ready():
	
	
	######################################################
	var dir = DirAccess.open("res://Assets/pfps/")

	dir.list_dir_begin()
	#we start going through the folder
	var file_name = dir.get_next()

	while file_name.ends_with(".jpg") or file_name.ends_with(".png"):
		var texture = load("res://Assets/pfps/" + file_name)
		PLAYER_PFPS_TEXTURES.append(texture)
		file_name = dir.get_next()
		file_name = dir.get_next() 	#It's twice here ON PURPOSE cuz .import
	#we fill the array PLAYER_PFPS_TEXTURES with jpgs or pngs of that folder
	#######################################################
	
	
	
	
	

