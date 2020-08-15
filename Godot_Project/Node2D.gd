extends Node2D

var test = load("test.gd").new()

func _ready():
	test.Hello()
	
func _on_Button_button_down():
	get_node("Label").text = "Hello"


func _on_Button_button_up():
	get_node("Label").text = ""
