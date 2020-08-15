extends Node2D


var voyante = load("role.gd").new()
var villageois = load("role.gd").new()
var loupGarou = load("role.gd").new()
var horloge = load("horloge.gd").new()

func _ready():
	voyante.edit_illustration("res://Images de test/Voyante.png")
	villageois.edit_illustration("res://Images de test/Villageois.png")
	loupGarou.edit_illustration("res://Images de test/Loup_garou.png")
	horloge.set_day_length(3)
	get_node("Timer2").set_wait_time(60)
	get_node("Timer2").start()
	#pass

func _on_Button_button_down():
	get_node("Bouton").set_button_icon(villageois.get_texture())

func _on_Button_button_up():
	get_node("Bouton").set_button_icon(loupGarou.get_texture())
	#get_node("Bouton").set_button_icon(InputDefault)

func _on_Timer_timeout():
	get_node("Duree").text = str(int(get_node("Timer2").get_time_left()))
	print(int(get_node("Timer2").get_time_left()))
