extends Control


var array = ["Scharpnel","Tabouret","Saxoalex","Oxie","Snakex62","Drizzik","Tatate78","Ludwig++",Global.Pseudo]

# Called when the node enters the scene tree for the first time.
func _ready():
	var i=1
	for name in array:
		var item = load("res://Bin/Scenes/simpleitemlist/Item.tscn").instance()
		get_node("ScrollContainer/VBoxContainer").add_child(item, true)
		if i != 1:
			get_node("ScrollContainer/VBoxContainer/item" + str(i)+"/item_label").text = name
		else:
			get_node("ScrollContainer/VBoxContainer/item/item_label").text = name
		i += 1
		#get_node("ScrollContainer/VBoxContainer").get_child($Parent.get_child_count()-1).get_node("item_label").text = name

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
