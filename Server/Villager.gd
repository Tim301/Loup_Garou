extends Node

class_name Villager

var Pseudo
var ID
var UniqueID
var isPlaying
var isInARoom
var insideARoom:Room

func _init(pseudo,id, unique):
	Pseudo = pseudo
	ID = id
	UniqueID = unique
	isPlaying = false

func to_JSON():
	var msg = { "Pseudo": Pseudo, "ID": ID, "UniqueID" : UniqueID}
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
