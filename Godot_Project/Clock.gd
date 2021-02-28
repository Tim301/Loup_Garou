extends Node

signal finish

var rot = 0
var rot1 = 0
var time = 60000 *3
var startTime

# Called when the node enters the scene tree for the first time.
func _ready():
	startTime = OS.get_ticks_msec()

func _process(_delta):
	var left = OS.get_ticks_msec() - startTime
	if left <= 0:
		emit_signal("finish")
	else:
		get_node("Petit_Eguille").rotation_degrees = (float(OS.get_ticks_msec() - startTime)/time) *360
		get_node("Grand_Eguille").rotation_degrees = (float(OS.get_ticks_msec() - startTime)/time) *360*60
