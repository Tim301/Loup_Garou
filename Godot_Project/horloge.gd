extends Node

class_name Horloge

var _dayLength = 3 setget set_day_length
var _nightLength = 3 setget set_night_length
var img = Image.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func Start():
	get_node("Horloge").set_wait_time(60)
	get_node("Horloge").start()
	
func Hello():
	print("HelloWorld")

func set_day_length(minutes):
	_dayLength = minutes

func set_night_length(minutes):
	_nightLength = minutes

func _on_Timer_timeout():
	get_node("Label").text = str(get_node("Horloge").get_time_left())
	print(str(get_node("Horloge").get_time_left()))
