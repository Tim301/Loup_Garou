extends Node2D

var rot = 0
var rot1 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Petit_Eguille").rotation_degrees
	pass

func _process(_delta):
	rot += 1
	rot1 += 6
	get_node("Petit_Eguille").rotation_degrees = rot
	get_node("Grand_Eguille").rotation_degrees = rot1
	
	
