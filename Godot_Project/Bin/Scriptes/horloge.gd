extends Node

class_name Horloge

var _dayLength = 1 setget set_day_length
var _nightLength = 1setget set_night_length
var img = Image.new()


# Called when the node enters the scene tree for the first time.

func start():
	print("coucou")
	get_node("Timer2").set_wait_time(60)
	get_node("Timer2").start()
	
func Hello():
	print("HelloWorld")

func set_day_length(minutes):
	_dayLength = minutes

func set_night_length(minutes):
	_nightLength = minutes

