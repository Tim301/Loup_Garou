extends Node

class_name Room

var Name:String
var Joueurs = {}
var CreatedBy = {}
var NbPLayer:int
var MaxPlayer:int
var IsPlaying = false
var Private = false
var Password = "" 

func _init(Room_Name,id, joueur):
	Name = Room_Name
	add_player(id, joueur)

func add_player(id, joueur):
	Joueurs[id] = joueur

func exportInfo():
	var info = {"Name":Name,"NbP":NbPLayer,"MaxP":MaxPlayer,"Prvt":Private,"Pwd":Password}
	return JSON.print(info)
