extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("do_update_ui", self, "update_ui")

func update_ui():
	var array = Global.list_room
	print(array)
	var VListRoom = get_node("ScrollContainer/VBoxContainer")
	if VListRoom.get_child_count() > 0:
		var childrens = VListRoom.get_children()
		for children in childrens:
			VListRoom.remove_child(children)
			children.queue_free()
	for room in array:
		if room.IsPlaying == false:
			var item = load("res://simpleitemlist/Item.tscn").instance()
			item.Json = room.exportInfo()
			item.name = room.Name
			get_node("ScrollContainer/VBoxContainer").add_child(item, true)
			get_node("ScrollContainer/VBoxContainer/" + room.Name +"/item_label").text = room.Name
	print("List count: " + str(VListRoom.get_child_count()))
