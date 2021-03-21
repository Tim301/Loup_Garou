extends Control

var Room_name = ""

func _onready():
	print("namechanged")

func _on_Room_name_text_changed():
	Room_name = get_node("Room_name").text
	print("namechanged")

func _on_Button_pressed():
	var msg = { "Type": "CreateRoom", "Room":Room_name, "Message" : Global.Pseudo}
	print(JSON.print(msg))
	Client.sendMessage(JSON.print(msg)) 
