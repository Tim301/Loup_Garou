extends Node2D

var test = load("horloge.gd").new()

func _ready():
	print(test._dayLength)

func _on_Button_button_down():
	get_node("Label").text = "Hello"


func _on_Button_button_up():
	get_node("Label").text = ""


func _on_Timer_timeout():
	get_node("Label").text = str(get_node("Horloge").get_time_left())
	print(str(get_node("Horloge").get_time_left()))
