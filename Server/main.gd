extends Node

func _ready():
	Global.connect("do_update_ui", self, "update_ui")
	Server.connect("do_update_ui", self, "update_ui")
	print("Server started: v" + str(Global.version))
	get_node("Version").text = "Version: v" + str(Global.version)
	get_node("CreatedRoom").text = "Il y a " + str(Global.list_room.size()) + " Room disponible."

func update_ui():
	get_node("OptionButton").clear()
	for room in Global.list_room:
		get_node("OptionButton").add_item(room.Name)
	get_node("CreatedRoom").text = "Il y a " + str(Global.list_room.size()) + " Room disponible."
	get_node("OnlinePlayers").text = "Il y a " + str(len(Global.clients)) + " joueurs connectés."
	get_node("RamUsage").text = str(OS.get_static_memory_usage()/(1024*1024)) + " MB of ram used"

func showRoomDetail(Json):
	var popup = load("res://RoomDetails/RoomDetails.tscn").instance()
	popup.initialize(Json)
	get_parent().add_child(popup)
