extends Node

signal massage(username,message,group)
signal createvillage(status)

var version = 0.2
var Pseudo = "Tribwyn"
var Is_Alive = true
var Room = ""

var List_Joueurs = ["Scharpnel","Tabouret","Saxoalex","Oxie","Snakex62","Drizzik","Tatate78","Ludwig++", "Kingsthen", "JeSuisPinPin",Pseudo]
var role = "chaman"
#var role = "villagoies"

func _ready():
	yield(get_tree().create_timer(10.0), "timeout")
	emit_signal("massage","Scharpnel","Ludwig est la petit fille.",1)
	yield(get_tree().create_timer(6.0), "timeout")
	emit_signal("massage",Global.Pseudo,"Je vote contre Tatate78.",0)
	yield(get_tree().create_timer(7.0), "timeout")
	emit_signal("massage",Global.Pseudo,"Ce message est destiné aux morts.",2)

func gotMessage(message):
	print("gotMessage " + message)
	var msg = JSON.parse(message).result
	if msg["Type"] == "CreateVillager":
		emit_signal("createvillage",msg["Message"])
	if msg["Type"] == "Check":
		if msg["Message"] == "Refused":
			print("Old Version")
			get_tree().change_scene("res://Bin/Scenes/Error_Version.tscn")
	if msg["Type"] == "CreateRoom" && get_tree().get_current_scene().name == "Select_Room":
		if msg["Message"] == "Accepted":
			Room = msg["Room"]
			get_tree().change_scene("res://Bin/Scenes/Lobby.tscn")
	if msg["Type"] == "Chat":
		var msgChat = JSON.parse( msg["Message"]).result
		msgChat["Pseudo"]
		emit_signal("massage",msgChat["Pseudo"],msgChat["Text"],msgChat["Channel"])
