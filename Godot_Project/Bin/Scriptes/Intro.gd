extends Control

var v
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Version").text = "Version: " + str(Global.version)
	Global.connect("massage", self, "_on_PseudoChecked")

func _on_Pseudo_text_changed():
	get_node("HBoxContainer2/Pseudo").text

func _on_Validate_button_down():
	if get_node("Validation/CheckBox").is_pressed() == true && get_node("HBoxContainer2/Pseudo").text != "":
		Global.Pseudo = get_node("HBoxContainer2/Pseudo").text
		v = Villager.new(get_node("HBoxContainer2/Pseudo").text)
		

func _on_PseudoChecked(status):
	if status == "Accepted":
		get_tree().change_scene("res://Bin/Scenes/Room_creation.tscn")
	if status == "Refused":
		pass
