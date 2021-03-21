extends Node

# The URL we will connect to.
export var websocket_url = "ws://localhost:9080"

# Our WebSocketClient instance.
var _client = WebSocketClient.new()
var is_server_available = false

func _ready():
	print("start")
	# Connect base signals to get notified of connection open, close, and errors.
	_client.connect("connection_closed", self, "_closed")
	_client.connect("connection_error", self, "_closed")
	_client.connect("connection_established", self, "_connected")
	# This signal is emitted when not using the Multiplayer API every time
	# a full packet is received.
	# Alternatively, you could check get_peer(1).get_available_packets() in a loop.
	_client.connect("data_received", self, "_on_data")

	# Initiate connection to the given URL.
	var err = _client.connect_to_url(websocket_url)
	#var err = _client.connect_to_url("123")

	print(err)
	if err != OK:
		set_process(false)
	yield(get_tree().create_timer(0.5), "timeout")
	sendMessage(JSON.print({"Type": "Check", "Room":"", "Message" : Global.version}))
	yield(get_tree().create_timer(1.0), "timeout")
	if is_server_available == false:
		get_tree().change_scene("res://Bin/Scenes/Error_Server.tscn")
	
func sendMessage(message):
	print(message)
	_client.get_peer(1).put_packet(message.to_utf8())

func _closed(was_clean = false):
	# was_clean will tell you if the disconnection was correctly notified
	# by the remote peer before closing the socket.
	print("Closed, clean: ", was_clean)
	set_process(false)

func _connected(proto = ""):
	# This is called on connection, "proto" will be the selected WebSocket
	# sub-protocol (which is optional)
	print("Connected with protocol: ", proto)
	# You MUST always use get_peer(1).put_packet to send data to server,
	# and not put_packet directly when not using the MultiplayerAPI.
	#_client.get_peer(1).put_packet("yahoooooo".to_utf8())

func _on_data():
	# Print the received packet, you MUST always use get_peer(1).get_packet
	# to receive data from server, and not get_packet directly when not
	# using the MultiplayerAPI.
	var message =  _client.get_peer(1).get_packet().get_string_from_utf8()
	print("Got data from server: ", message)
	Global.gotMessage(message)
	is_server_available = true

func _process(_delta):
	# Call this in _process or _physics_process. Data transfer, and signals
	# emission will only happen when calling this function.
	_client.poll()

func _exit_tree():
	_client.disconnect_from_host()
