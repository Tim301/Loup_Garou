extends Node

# Declare the class name here
class_name test

var dayLength = 3 setget set_day_length
var nightLength = 3 setget set_night_length

func Hello():
	print("HelloWorld")

func set_day_length(minutes):
	dayLength = minutes

func set_night_length(minutes):
	nightLength = minutes
