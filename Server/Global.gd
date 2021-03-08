extends Node

var version = 0.1
var clients = {}
var list_room = []
var thread = Thread.new()
var threadRefreshRoom = Thread.new()

signal do_update_ui

func _ready():
	# Third argument is optional userdata, it can be any variable.
	thread.start(self, "_routine")
	threadRefreshRoom.start(self, "_roomAvailable")
	print("Start threads")

func create_room(room_name,id,joueur):
	Global.list_room.append(Room.new(room_name,id,joueur))
	print("Room created: " + room_name)
	var resp =  { "Type": "CreateRoom", "Room":room_name, "Message" : "Accepted"}
	Server.sendMessage(JSON.print(resp), id)
	emit_signal("do_update_ui")

func proceedMessage(message, id, joueur):
	print(message)
	var msg = JSON.parse(message).result
	if msg["Type"] == "CreateRoom":
		var IsRoomNameExist = false
		for room in list_room:
			if room.Name == msg["Room"]:
				IsRoomNameExist = true
				break
		if IsRoomNameExist == true:
			print("The room already exist!")
			var resp =  { "Type": "CreateRoom", "Room":msg["Room"], "Message" : "Refused"}
			Server.sendMessage(JSON.print(resp), id)
		else:
			create_room(msg["Room"],id,joueur)
	if msg["Type"] == "Chat":
		print("Room name: " + msg["Room"])
		var i:=0
		for room in list_room:
			if room.Name == msg["Room"]:
				break
			else:
				i +=1
		print("index: " + str(i))
		Server.broadcastRoom(message,list_room[i].Joueurs)
	
	if msg["Type"] == "RoomInfo":
		var AvailableRoom = []
		for room in list_room:
			if room.IsPlaying == false:
				AvailableRoom.append(room.exportInfo())
		print(AvailableRoom)

func _roomAvailable(userdata):
	print("Send Rooms")
	while true:
		var AvailableRoom = []
		for room in Global.list_room:
			if room.IsPlaying == false:
				AvailableRoom.append(room.exportInfo())
		var resp =  { "Type": "InfoRoom", "Room":"All", "Message" : AvailableRoom}
		Server.broadcast(JSON.print(resp))
		yield(get_tree().create_timer(10.0), "timeout")

func _routine(userdata):
	print("Start thread")
	while true:
		yield(get_tree().create_timer(60.0), "timeout")
		if  len(Global.clients) == 0:
				list_room = []
		print("Server cleaned")
		emit_signal("do_update_ui")
