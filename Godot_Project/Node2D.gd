extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Button_button_down():
	get_node("Label").text = "Hello"


func _on_Button_button_up():
	get_node("Label").text = ""
