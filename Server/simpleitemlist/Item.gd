extends HBoxContainer

var Json = ""

func _on_item_amount_pressed():
	get_tree().get_current_scene().showRoomDetail(Json)
