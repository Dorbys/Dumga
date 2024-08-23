extends Control

@onready var slot_1 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot1
@onready var slot_2 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot2
@onready var slot_3 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot3
@onready var slot_4 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot4
@onready var slot_5 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot5
@onready var slot_6 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot6
@onready var slot_7 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot7
@onready var slot_8 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot8
@onready var slot_9 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot9
@onready var slot_10 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot10
@onready var slot_11 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot11
@onready var slot_12 = $Adding_BCG/VBoxContainer/HBoxContainer/Slot12
@onready var slot2_1 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot1
@onready var slot2_2 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot2
@onready var slot2_3 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot3
@onready var slot2_4 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot4
@onready var slot2_5 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot5
@onready var slot2_6 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot6
@onready var slot2_7 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot7
@onready var slot2_8 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot8
@onready var slot2_9 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot9
@onready var slot2_10 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot10
@onready var slot2_11 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot11
@onready var slot2_12 = $Adding_BCG/VBoxContainer/HBoxContainer2/Slot12
@onready var slot3_1 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot1
@onready var slot3_2 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot2
@onready var slot3_3 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot3
@onready var slot3_4 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot4
@onready var slot3_5 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot5
@onready var slot3_6 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot6
@onready var slot3_7 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot7
@onready var slot3_8 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot8
@onready var slot3_9 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot9
@onready var slot3_10 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot10
@onready var slot3_11 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot11
@onready var slot3_12 = $Adding_BCG/VBoxContainer/HBoxContainer3/Slot12

@onready var added_slot_1 = $Added_BCG/VBoxContainer/HBoxContainer/Slot1
@onready var added_slot_2 = $Added_BCG/VBoxContainer/HBoxContainer/Slot2
@onready var added_slot_3 = $Added_BCG/VBoxContainer/HBoxContainer/Slot3
@onready var added_slot_4 = $Added_BCG/VBoxContainer/HBoxContainer/Slot4
@onready var added_slot_5 = $Added_BCG/VBoxContainer/HBoxContainer/Slot5
@onready var added_slot_6 = $Added_BCG/VBoxContainer/HBoxContainer/Slot6
@onready var added_slot_7 = $Added_BCG/VBoxContainer/HBoxContainer/Slot7
@onready var added_slot_8 = $Added_BCG/VBoxContainer/HBoxContainer/Slot8
@onready var added_slot_9 = $Added_BCG/VBoxContainer/HBoxContainer/Slot9
@onready var added_slot_10 = $Added_BCG/VBoxContainer/HBoxContainer/Slot10
@onready var added_slot_11 = $Added_BCG/VBoxContainer/HBoxContainer/Slot11
@onready var added_slot_12 = $Added_BCG/VBoxContainer/HBoxContainer/Slot12
@onready var added_slot2_1 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot1
@onready var added_slot2_2 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot2
@onready var added_slot2_3 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot3
@onready var added_slot2_4 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot4
@onready var added_slot2_5 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot5
@onready var added_slot2_6 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot6
@onready var added_slot2_7 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot7
@onready var added_slot2_8 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot8
@onready var added_slot2_9 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot9
@onready var added_slot2_10 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot10
@onready var added_slot2_11 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot11
@onready var added_slot2_12 = $Added_BCG/VBoxContainer/HBoxContainer2/Slot12
@onready var added_slot3_1 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot1
@onready var added_slot3_2 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot2
@onready var added_slot3_3 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot3
@onready var added_slot3_4 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot4
@onready var added_slot3_5 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot5
@onready var added_slot3_6 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot6
@onready var added_slot3_7 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot7
@onready var added_slot3_8 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot8
@onready var added_slot3_9 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot9
@onready var added_slot3_10 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot10
@onready var added_slot3_11 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot11
@onready var added_slot3_12 = $Added_BCG/VBoxContainer/HBoxContainer3/Slot12

@onready var UI_layer = $".."

@export var base_scene: PackedScene
@export var add_character_button: PackedScene
@export var remove_character_button: PackedScene
@export var open_folder_button: PackedScene
@export var start_encounter_warning: PackedScene

var dir_path = "user://characters"
var slot_array
var added_slot_array
var deep_folder_array = []
# this array stores folder except '/characters' which we go down through
	#so that we know how to get BACK

func _ready():
	slot_array = [
slot_1,slot_2,slot_3,slot_4,slot_5,slot_6,slot_7,slot_8,slot_9,slot_10,slot_11,slot_12,
slot2_1,slot2_2,slot2_3,slot2_4,slot2_5,slot2_6,slot2_7,slot2_8,slot2_9,slot2_10,slot2_11,slot2_12,
slot3_1,slot3_2,slot3_3,slot3_4,slot3_5,slot3_6,slot3_7,slot3_8,slot3_9,slot3_10,slot3_11,slot3_12]
	added_slot_array = [
added_slot_1,added_slot_2,added_slot_3,added_slot_4,added_slot_5,added_slot_6,added_slot_7,added_slot_8,added_slot_9,added_slot_10,added_slot_11,added_slot_12,
added_slot2_1,added_slot2_2,added_slot2_3,added_slot2_4,added_slot2_5,added_slot2_6,added_slot2_7,added_slot2_8,added_slot2_9,added_slot2_10,added_slot2_11,added_slot2_12,
added_slot3_1,added_slot3_2,added_slot3_3,added_slot3_4,added_slot3_5,added_slot3_6,added_slot3_7,added_slot3_8,added_slot3_9,added_slot3_10,added_slot3_11,added_slot3_12]

	open_folder(dir_path)
	
func open_folder(folder_path):
	if folder_path != "user://characters":
		deep_folder_array.append(folder_path)
		%Back_button.visible = true
		
	var dir = DirAccess.open(folder_path)

	dir.list_dir_begin()
	var file_name = dir.get_next()
	var index = 0

	while file_name != "":

		if dir.current_is_dir():
			var another = open_folder_button.instantiate()
			another.folder_path = folder_path + "/" + file_name
			slot_array[index].add_child(another)
			index += 1
		
		file_name = dir.get_next()
		
	
	dir = DirAccess.open(folder_path)
	dir.list_dir_begin()
	file_name = dir.get_next()
	
	while file_name != "":

		if file_name.ends_with(".tres"):
			var another = add_character_button.instantiate()
			another.saved_character = load(folder_path + "//" + file_name)
			slot_array[index].add_child(another)
			index += 1

		file_name = dir.get_next()
		
		
func clear_slots():
	var i = 0
	while slot_array[i].get_child_count() > 1:
		slot_array[i].get_child(1).queue_free()
		i += 1

func _on_back_button_pressed():
	clear_slots()
	if len(deep_folder_array)>1:
		open_folder(deep_folder_array[-1])
		deep_folder_array.pop_back()
	else:
		open_folder("user://characters")
		deep_folder_array.pop_back()
		%Back_button.visible = false
		
		
var adding_head = 0
func add_this_character(the_character):
	var another = remove_character_button.instantiate()
	another.my_array_position = adding_head
	another.saved_character = the_character
	added_slot_array[adding_head].add_child(another)
	adding_head += 1
	
func remove_this_character(caller, array_position):
	if array_position == adding_head-1:
		caller.queue_free()
	else: 
		caller.queue_free()
		var i = array_position + 1
		while i < adding_head:
			var target = added_slot_array[i].get_child(1)
			target.reparent(added_slot_array[i-1])
			target.my_array_position -= 1
			i += 1
		
	adding_head -=1

func _on_done_button_pressed():
	var another = start_encounter_warning.instantiate()
	another.caller = self
	UI_layer.add_child(another)

func start_encounter():
	var another = base_scene.instantiate()
	UI_layer.add_child(another)
	for i in adding_head:
		another.manager.character_array.append(added_slot_array[i].get_child(1).saved_character)
		#this line adds all the characters we want to add into the base scene's array
	another.manager.start()
	queue_free()


func _on_close_button_pressed():
	queue_free()
