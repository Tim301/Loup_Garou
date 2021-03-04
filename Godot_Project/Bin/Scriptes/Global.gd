extends Node

signal massage(username,message,group)

var Pseudo = "Tribwyn"
var Is_Alive = true
var List_Joueurs = ["Scharpnel","Tabouret","Saxoalex","Oxie","Snakex62","Drizzik","Tatate78","Ludwig++", "Kingsthen", "JeSuisPinPin",Pseudo]
var role = "chaman"
#var role = "villagoies"

func _ready():
	yield(get_tree().create_timer(10.0), "timeout")
	print("testready")
	emit_signal("massage","Scharpnel","Ludwig est la petit fille.",1)
	yield(get_tree().create_timer(6.0), "timeout")
	emit_signal("massage",Global.Pseudo,"Je vote contre Tatate78.",0)
	yield(get_tree().create_timer(7.0), "timeout")
	emit_signal("massage",Global.Pseudo,"Ce message est destiné aux morts.",2)
