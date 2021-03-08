extends Control

var Name:String
var NbPLayer:int
var MaxPlayer:int
var Private = false
var Password = "" 

func initialize(json):
	var dict = JSON.parse(json).result
	Name = dict["Name"]
	get_node("Room_Name").text = Name
	NbPLayer = dict["NbP"]
	MaxPlayer = dict["MaxP"]
	Private = dict["Prvt"]
	Password = dict["Pwd"]
	if Private == false:
		get_node("Pwd_Label").hide()
		get_node("Password").hide()

func _on_Entrer_pressed():
	if Private == true && Password == get_node("Password").text:
		print("Password correct")
	if Private == true && Password != get_node("Password").text:
		print("Password wrong")
	else:
		print("Entrer dans la chambre")
