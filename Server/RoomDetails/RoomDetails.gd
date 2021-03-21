extends Control

var Name:String
var NbPLayer:int
var MaxPlayer:int
var Private = false
var Password = "" 

func initialize(json):
	var dict = JSON.parse(json).result
	Name = dict["Name"]
	get_node("Panel/Room_Name").text = Name
	NbPLayer = dict["NbP"]
	MaxPlayer = dict["MaxP"]
	Private = dict["Prvt"]
	Password = dict["Pwd"]
	get_node("Panel/Nb_Player").text = str(NbPLayer) + " / " + str(MaxPlayer) + " Joueurs"
	if Private == false:
		get_node("Panel/Pwd_Label").hide()
		get_node("Panel/Password").hide()

func _ready():
	get_node("Panel").popup()
	
func _on_Entrer_pressed():
	if Private == true && Password == get_node("Panel/Password").text:
		print("Password correct")
	if Private == true && Password != get_node("Panel/Password").text:
		print("Password wrong")
	else:
		print("Entrer dans la chambre")

func _on_Panel_popup_hide():
	queue_free()
