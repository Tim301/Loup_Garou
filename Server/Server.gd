extends Node

signal do_update_ui

# The port we will listen to.
const PORT = 9080
# Our WebSocketServer instance.
var _server = WebSocketServer.new()
#var _clients = {}
func _ready():
	# Connect base signals to get notified of new client connections,
	# disconnections, and disconnect requests.
	_server.connect("client_connected", self, "_connected")
	_server.connect("client_disconnected", self, "_disconnected")
	_server.connect("client_close_request", self, "_close_request")
	# This signal is emitted when not using the Multiplayer API every time a
	# full packet is received.
	# Alternatively, you could check get_peer(PEER_ID).get_available_packets()
	# in a loop for each connected peer.
	_server.connect("data_received", self, "_on_data")
	# Start listening on the given port.
	var err = _server.listen(PORT)
	if err != OK:
		print("Unable to start server")
		set_process(false)


func _connected(id, proto):
	# This is called when a new peer connects, "id" will be the assigned peer id,
	# "proto" will be the selected WebSocket sub-protocol (which is optional)
	#_clients[id] = _server.get_peer(id)
	Global.clients[id] = _server.get_peer(id)
	print("Client %d connected with protocol: %s" % [id, proto])

func _close_request(id, code, reason):
	# This is called when a client notifies that it wishes to close the connection,
	# providing a reason string and close code.
	if Global.clients.has(id):
		Global.clients.erase(id)
	print("Client %d disconnecting with code: %d, reason: %s" % [id, code, reason])
	emit_signal("do_update_ui")

func _disconnected(id, was_clean = false):
	# This is called when a client disconnects, "id" will be the one of the
	# disconnecting client, "was_clean" will tell you if the disconnection
	# was correctly notified by the remote peer before closing the socket.
	print("Client %d disconnected, clean: %s" % [id, str(was_clean)])
	emit_signal("do_update_ui")

func _on_data(id):
	# Print the received packet, you MUST always use get_peer(id).get_packet to receive data,
	# and not get_packet directly when not using the MultiplayerAPI.
	var pkt = _server.get_peer(id).get_packet()
	#broadcast(pkt.get_string_from_utf8())
	Global.proceedMessage(pkt.get_string_from_utf8(), id, _server.get_peer(id))

func _process(_delta):
	# Call this in _process or _physics_process.
	# Data transfer, and signals emission will only happen when calling this function.
	_server.poll()

func broadcastRoom(message, Joueurs):
	for Joueur in Joueurs:
		_server.get_peer(Joueur).put_packet(message.to_utf8())

func sendMessage(message, id):
	_server.get_peer(id).put_packet(message.to_utf8())

func broadcast(message):
	for id in Global.clients:
		_server.get_peer(id).put_packet(message.to_utf8())

func _exit_tree():
	Global.clients.clear()
	_server.stop()
