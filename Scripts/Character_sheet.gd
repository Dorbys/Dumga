extends Control

var character_name

#STATY
var poskozeni_zbrane
var HP
var MP
var stamina
var brneni
var magicka_odolnost
var rychlost
var presnost
var uhyb
var CC_odolnost


	
#ATRIBUTY
var sila
var obratnost
var inteligence
var charisma
var vydrz
var stesti
var krasa
var magie

#ZBRANE
var jednorucni
var obourucni
var tycove
var luky
var kuse
var vrhaci

var dovednosti = ""

func _ready():
	%character_name.text = character_name

	%HP.text = HP + "/" + HP
	%MP.text = MP + "/" + MP
	%stamina.text = stamina + "/" + stamina
	
	%poskozeni_zbrane.text = poskozeni_zbrane
	%brneni.text = brneni
	%magicka_odolnost.text = magicka_odolnost
	%rychlost.text = rychlost
	%presnost.text = presnost
	%uhyb.text = uhyb
	%CC_odolnost.text = CC_odolnost
	
	%sila.text = sila
	%obratnost.text = obratnost
	%inteligence.text = inteligence
	%charisma.text = charisma
	%vydrz.text = vydrz
	%stesti.text = stesti
	%krasa.text = krasa
	%magie.text = magie
	
	%jednorucni.text = jednorucni
	%obourucni.text = obourucni
	%tycove.text = tycove
	%luky.text = luky
	%kuse.text = kuse
	%vrhaci.text = vrhaci

	%Dovednosti_values.text = dovednosti
	#must be prepared in the character creaor
	
	var path = "user://profile_pictures/"
	var extensions = [".jpg", ".jpeg", ".png"]
	var pfp = null
	for ext in extensions:
		var file_path = path + character_name + ext
		if FileAccess.file_exists(file_path):		
			pfp = Image.load_from_file(file_path)
			break
	if pfp:
		%PFP.texture_normal = ImageTexture.create_from_image(pfp)



func _on_quit_button_pressed():
	queue_free()
