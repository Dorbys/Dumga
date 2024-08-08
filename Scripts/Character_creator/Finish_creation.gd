extends TextureButton

@onready var character_creator = $".."
@onready var done = $Done
@export var around_warning: PackedScene
@onready var character_name = $"../Name_picker/Character_name"

@onready var atributy_points_left = $"../Atributy/VBoxContainer/Title_container/Points_left"
@onready var zbrane_points_left = $"../Zbrane/VBoxContainer/Title_container/Points_left"
@onready var dovednosti_points_left = $"../Dovednosti/VBoxContainer/Title_container/Points_left"

#ATRIBUTES
@onready var sila = $"../Atributy/VBoxContainer/HBoxContainer/Current"
@onready var obratnost = $"../Atributy/VBoxContainer/HBoxContainer2/Current"
@onready var inteligence = $"../Atributy/VBoxContainer/HBoxContainer3/Current"
@onready var charisma = $"../Atributy/VBoxContainer/HBoxContainer4/Current"
@onready var vydrz = $"../Atributy/VBoxContainer/HBoxContainer5/Current"
@onready var stesti = $"../Atributy/VBoxContainer/HBoxContainer6/Current"
@onready var krasa = $"../Atributy/VBoxContainer/HBoxContainer7/Current"
@onready var magie = $"../Atributy/VBoxContainer/HBoxContainer8/Current"

#ZBRANE
@onready var jednorucni = $"../Zbrane/VBoxContainer/HBoxContainer3/Current"
@onready var obourucni = $"../Zbrane/VBoxContainer/HBoxContainer4/Current"
@onready var tycove = $"../Zbrane/VBoxContainer/HBoxContainer5/Current"
@onready var luky = $"../Zbrane/VBoxContainer/HBoxContainer6/Current"
@onready var kuse = $"../Zbrane/VBoxContainer/HBoxContainer7/Current"
@onready var vrhaci = $"../Zbrane/VBoxContainer/HBoxContainer8/Current"


@onready var skill = $"../Dovednosti/VBoxContainer/HBoxContainer/Stat"
@onready var skill2 = $"../Dovednosti/VBoxContainer/HBoxContainer2/Stat"
@onready var skill3 = $"../Dovednosti/VBoxContainer/HBoxContainer3/Stat"
@onready var skill4 = $"../Dovednosti/VBoxContainer/HBoxContainer4/Stat"
@onready var skill5 = $"../Dovednosti/VBoxContainer/HBoxContainer5/Stat"
@onready var skill6 = $"../Dovednosti/VBoxContainer/HBoxContainer6/Stat"
@onready var skill7 = $"../Dovednosti/VBoxContainer/HBoxContainer7/Stat"
@onready var skill8 = $"../Dovednosti/VBoxContainer/HBoxContainer8/Stat"
@onready var skill9 = $"../Dovednosti/VBoxContainer/HBoxContainer9/Stat"
@onready var skill10 = $"../Dovednosti/VBoxContainer/HBoxContainer10/Stat"
@onready var skill11 = $"../Dovednosti/VBoxContainer/HBoxContainer11/Stat"
@onready var skill12 = $"../Dovednosti/VBoxContainer/HBoxContainer12/Stat"

@onready var current_node = $"../Dovednosti/VBoxContainer/HBoxContainer/Current"
@onready var current2_node = $"../Dovednosti/VBoxContainer/HBoxContainer2/Current"
@onready var current3_node = $"../Dovednosti/VBoxContainer/HBoxContainer3/Current"
@onready var current4_node = $"../Dovednosti/VBoxContainer/HBoxContainer4/Current"
@onready var current5_node = $"../Dovednosti/VBoxContainer/HBoxContainer5/Current"
@onready var current6_node = $"../Dovednosti/VBoxContainer/HBoxContainer6/Current"
@onready var current7_node = $"../Dovednosti/VBoxContainer/HBoxContainer7/Current"
@onready var current8_node = $"../Dovednosti/VBoxContainer/HBoxContainer8/Current"
@onready var current9_node = $"../Dovednosti/VBoxContainer/HBoxContainer9/Current"
@onready var current10_node = $"../Dovednosti/VBoxContainer/HBoxContainer10/Current"
@onready var current11_node = $"../Dovednosti/VBoxContainer/HBoxContainer11/Current"
@onready var current12_node = $"../Dovednosti/VBoxContainer/HBoxContainer12/Current"

@onready var stat = %poskozeni_zbrane
@onready var stat2 = %HP
@onready var stat3 = %MP
@onready var stat4 = %stamina
@onready var stat5 = %brneni
@onready var stat6 = %magicka_odolnost
@onready var stat7 = %rychlost
@onready var stat8 = %presnost
@onready var stat9 = %uhyb
@onready var stat10 = %CC_odolnost


func done_check():
	var atributes = int(atributy_points_left.text)
	var weapons = int(zbrane_points_left.text)
	var skills = int(dovednosti_points_left.text)
	
#	if atributes+weapons+skills == 0 and character_name.text != "" and skillcheck() == true:
#		disabled = false
#		done.self_modulate.a = 1
	#removed for Dave
	
	if skillcheck() == true and character_name.text != "" and statcheck() == true:
		disabled = false
		done.self_modulate.a = 1
	else:
		disabled = true
		done.self_modulate.a = 0.5

func skillcheck():
	var currtester = [current_node,current2_node,current3_node,current4_node,
	current5_node,current6_node,current7_node,current8_node,
	current9_node,current10_node,current11_node,current12_node]
	
	var skilltester = [skill,skill2,skill3,skill4,skill5,skill6,
	skill7,skill8,skill9,skill10,skill11,skill12]
	
	for i in 12:
		if int(currtester[i].text) > 0 and skilltester[i].text == "":
			return false
	return true
	
func statcheck():
	var stat_arr = [stat,stat2,stat3,stat4,stat5,stat6,stat7,stat8,stat9,stat10]
	for i in 10:
		print("curr text: " + stat_arr[i].text)
		if stat_arr[i].text == "":
			return false
	return true
			

func create_character():

	var character_save:Character_save = Character_save.new()
	
	character_save.character_name = %Character_name.text

	#STATY
	character_save.poskozeni_zbrane = %poskozeni_zbrane.text
	character_save.HP = %HP.text
	character_save.MP = %MP.text
	character_save.stamina = %stamina.text
	character_save.brneni = %brneni.text
	character_save.magicka_odolnost = %magicka_odolnost.text
	character_save.rychlost = %rychlost.text
	character_save.presnost = %presnost.text
	character_save.uhyb = %uhyb.text
	character_save.CC_odolnost = %CC_odolnost.text

	#ATRIBUTY
	character_save.sila = sila.text
	character_save.obratnost = obratnost.text
	character_save.inteligence = inteligence.text
	character_save.charisma = charisma.text
	character_save.vydrz = vydrz.text
	character_save.stesti = stesti.text
	character_save.krasa = krasa.text
	character_save.magie = magie.text

	#ZBRANE
	character_save.jednorucni = jednorucni.text
	character_save.obourucni = obourucni.text
	character_save.tycove = tycove.text
	character_save.luky = luky.text
	character_save.kuse = kuse.text
	character_save.vrhaci = vrhaci.text

	var currtester = [current_node,current2_node,current3_node,current4_node,
	current5_node,current6_node,current7_node,current8_node,
	current9_node,current10_node,current11_node,current12_node]
	
	var skilltester = [skill,skill2,skill3,skill4,skill5,skill6,
	skill7,skill8,skill9,skill10,skill11,skill12]
	
	var saving_string = ""
	for i in 12:
		if int(currtester[i].text) > 0:
			if len(saving_string)<1:
				saving_string = skilltester[i].text + " (" +currtester[i].text + ")"
			else: saving_string = saving_string + ", " +skilltester[i].text + " (" +currtester[i].text + ")"
			
	character_save.dovednosti = saving_string
	
	ResourceSaver.save(character_save, "user://characters//" + character_name.text + ".tres")


func _on_pressed():
	var another = around_warning.instantiate()
	character_creator.add_child(another)



func _on_character_name_text_changed(new_text):
	done_check()


func _on_stat_text_changed(new_text):
	done_check()


func _on_stat_value_text_changed(new_text):
	done_check()


func _on_quit_button_pressed():
	character_creator.queue_free()
