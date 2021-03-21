extends Node

class_name Villager

var Pseudo
var UniqueID
var isPlaying
var isInARoom
var insideARoom:Room

func _init(pseudo):
	Pseudo = pseudo
	UniqueID = OS.get_unique_id()
	isPlaying = false

func to_JSON():
	var msg = { "Pseudo": Pseudo, "UniqueID" : UniqueID}
	return(JSON.print(msg))
	
func joinARoom(selectedRoom):
	insideARoom = selectedRoom
	isInARoom = true

func leaveARoom():
	insideARoom = null
	isPlaying = false
	isInARoom = false

func startPlaying():
	isPlaying = true

func stopPlaying():
	isPlaying = false
