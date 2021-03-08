extends Node2D

onready var role = get_node("OptionButton")
var selected_role = "loupgarou"
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Version").text = "Version: " + str(Global.version)
	print(OS.get_unique_id())
	role.add_item("loupgarou")
	role.add_item("chaman")
	role.add_item("villagoies")

func _on_Pseudo_text_changed():
	Global.Pseudo = get_node("Pseudo").text

func _on_Validate_button_down():
	Global.role = selected_role
	Global.List_Joueurs.append(Global.Pseudo)
	get_tree().change_scene("res://Bin/Scenes/Partie.tscn")


func _role_selected(index):
	print(role.get_item_text(index))
	selected_role = role.get_item_text(index)
