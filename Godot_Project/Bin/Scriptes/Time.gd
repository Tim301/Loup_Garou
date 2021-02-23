extends Node2D
class_name Time

var raw: int
var minute setget set_minute, get_minute
var second: int
var milisecond: int
var _formated_time: String 

func _init(ms = 0):
	raw = ms
	minute = 0
	second = 0
	milisecond = 0
	while ms > 59999:
		minute += 1
		ms -= 60000
	while ms > 999:
		second += 1
		ms -= 1000
	while ms > 0:
		milisecond += 1
		ms -= 1

func set_minute(mm):
	minute = mm

func get_minute():
	return minute

func set_second(ss):
	second = ss

func get_second():
	return second

func set_milisecond(ms):
	milisecond = ms

func get_milisecond():
	return milisecond

func format():
	var formated_time =""
	if minute < 10:
		formated_time = formated_time + "0" +str(minute)+":"
	else:
		formated_time = formated_time +str(minute)+":"
	if second < 10:
		formated_time = formated_time + "0" +str(second)+":"
	else:
		formated_time = formated_time +str(second)+":"
	return formated_time + str(milisecond)
