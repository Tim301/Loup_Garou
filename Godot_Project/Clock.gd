extends Node2D

var rot = 0
var rot1 = 0
var time = 60000 *3
var startTime

# Called when the node enters the scene tree for the first time.
func _ready():
	startTime = OS.get_ticks_msec()

func _process(_delta):
	get_node("Petit_Eguille").rotation_degrees = (float(OS.get_ticks_msec() - startTime)/time) *360
	get_node("Grand_Eguille").rotation_degrees = (float(OS.get_ticks_msec() - startTime)/time) *360*60
	
	
