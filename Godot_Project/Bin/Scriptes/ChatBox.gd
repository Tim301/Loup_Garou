extends Control

# Ces variables permettent de changer le chemin des input, 
# log, etc de la chat box
onready var chatlog = get_node("VBoxContainer/RichTextLabel") # Permet l'affichage de la chat box
onready var inputLabel = get_node("VBoxContainer/HBoxContainer/Label") # Permet l'affichage du label du groupe
onready var inputfield = get_node("VBoxContainer/HBoxContainer/LineEdit") # permet la saisie dns le champs de texte

# Création des différent channel de chat
# nom du channel + sa couleur
var channels = [
	{'nom':'global','color':'#ffffff'},
	{'nom':'loupgarou','color':'#ff0000'},
	{'nom':'mort','color':'#a8a8a8'},
]

var channel_index = 0 # Variable qui permetera de changer de channel
var user_name = Global.Pseudo # Variable qui définie le nom de l'utilisateur

# Fonction qui initie le chat au channel 0, le channel Global
func _ready():
	inputfield.connect("text_entered",self,"text_entered")
	add_message('Godot','Souhaitons le bienvenu à ' + Global.Pseudo + '!!!')
	change_channel(0)
	Global.connect("massage", self, "_on_Timer_timeout")

# Fonction qui permet de saisir un texte dans le chat, ou de sortir du chat
# ou bien de changer de channel 
func _input(event):
	if event is InputEventKey :
		if event.pressed and event.scancode == KEY_ENTER:
			inputfield.grab_focus()
		if event.pressed and event.scancode == KEY_ESCAPE:
			inputfield.release_focus()
		if event.pressed and event.scancode == KEY_TAB:
			change_channel(1)

# Fonction qui ajoute un message au chat
func add_message(username,text,group = 0):
	chatlog.bbcode_text += '\n' 
	chatlog.bbcode_text += '[color=' + channels[group]['color'] + ']'
	chatlog.bbcode_text += ' [' + username + ']: '
	chatlog.bbcode_text += text
	chatlog.bbcode_text += '[/color]'


# Fonction qui notifie à l'utilisateur quel channel il a choisit
func change_channel(value):
	if Global.Is_Alive:
		channel_index += value
		if channel_index > (channels.size() - 1):
			channel_index = 0
	else:
		channel_index = 2
	inputLabel.text = '[' + channels[channel_index]['nom'] + ']'
	inputLabel.set('custom_colors/font_color', Color(channels[channel_index]['color']))
# Fonction qui permet de ne pas ajouter de message si l'utilisateur n'a pas entré
# de caractères, ou qui ajoute un message quand il demande de l'aide
func text_entered(text):
	if text == '/help':
		add_message('help',"Il ny a pas d'aide encore écrite",0)
		inputfield.text=''
		return
	if text != '':
		print(text)
		add_message(user_name,text,channel_index)
		inputfield.text=''

func _on_Timer_timeout(username,message,group):
	print(username)
	print(message)
	print(group)
	if group == 1 && Global.role == "loupgarou":
		add_message(username,message,group)
	if group == 2 && Global.role == "chaman":
		username = "Esprit"
		add_message(username,message,group)
	if group != 1 && group != 2:
		add_message(username,message,group)
