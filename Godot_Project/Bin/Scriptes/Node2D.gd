extends Node2D


var voyante = load("res://Bin/Scriptes/role.gd").new()
var villageois = load("res://Bin/Scriptes/role.gd").new()
var loupGarou = load("res://Bin/Scriptes/role.gd").new()
var chrono :Chronometer

func _ready():
	voyante.edit_illustration("res://Bin/Images/Voyante.png")
	villageois.edit_illustration("res://Bin/Images/Villageois.png")
	loupGarou.edit_illustration("res://Bin/Images/Loup_garou.png")
	chrono = Chronometer.new(60000)
	#pass

func _process(_delta):
	chrono.update()
	get_node("Duree").text = chrono.format()

func _on_Button_button_down():
	get_node("Bouton").set_button_icon(villageois.get_texture())

func _on_Button_button_up():
	get_node("Bouton").set_button_icon(loupGarou.get_texture())
