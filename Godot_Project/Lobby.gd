extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Pseudo_text_changed():
	Global.Pseudo = get_node("Pseudo").text

func _on_Validate_button_down():
	Global.List_Joueurs.append(Global.Pseudo)
	get_tree().change_scene("res://Bin/Scenes/Partie.tscn")
