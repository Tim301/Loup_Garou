extends Node2D
class_name Chronometer

var duree = 0
var startTime = 0
var elapsedTime: Time

func _init(ms=0):
	duree = ms
	startTime = OS.get_ticks_msec()

func update():
	elapsedTime = Time.new(duree - (OS.get_ticks_msec()-startTime))

func format():
	return elapsedTime.format()
