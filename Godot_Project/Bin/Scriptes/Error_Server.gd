extends Control

func _ready():
	get_node("Version").text = "Version: " + str(Global.version)
	#yield(get_tree().create_timer(10), "timeout")
	#get_tree().change_scene("res://Bin/Scenes/Intro.tscn")
