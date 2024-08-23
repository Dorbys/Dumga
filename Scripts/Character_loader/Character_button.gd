extends TextureButton

@onready var label = $Label
@onready var ui_layer = $"../../../../../../UI_Layer"

@export var saved_character: Resource
@export var character_sheet: PackedScene


func _ready():
#	loaded_resource = load(saved_character)
	#no loading required if the resource is exported to here
	label.text = saved_character.character_name
	
	
	
	




func _on_pressed():
	var another = character_sheet.instantiate()
		
	another.character_name = saved_character.character_name

	#STATY
	another.poskozeni_zbrane = saved_character.poskozeni_zbrane
	another.HP = saved_character.HP
	another.MP = saved_character.MP
	another.stamina = saved_character.stamina
	another.brneni = saved_character.brneni
	another.magicka_odolnost = saved_character.magicka_odolnost
	another.rychlost = saved_character.rychlost
	another.presnost = saved_character.presnost
	another.uhyb = saved_character.uhyb
	another.CC_odolnost = saved_character.CC_odolnost
		
	#ATRIBUTY
	another.sila  = saved_character.sila
	another.obratnost = saved_character.obratnost
	another.inteligence = saved_character.inteligence
	another.charisma = saved_character.charisma
	another.vydrz = saved_character.vydrz
	another.stesti = saved_character.stesti
	another.krasa = saved_character.krasa
	another.magie = saved_character.magie

	#ZBRANE
	another.jednorucni = saved_character.jednorucni
	another.obourucni = saved_character.obourucni
	another.tycove = saved_character.tycove
	another.luky = saved_character.luky
	another.kuse = saved_character.kuse
	another.vrhaci = saved_character.vrhaci

	another.dovednosti = saved_character.dovednosti
	
	ui_layer.add_child(another)
