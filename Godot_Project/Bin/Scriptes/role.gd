extends Node

"""La classe Role définit les différents rôles du joueur."""

class_name Role

var nom = "nom" 
var illustration = Image.new()
var texture = ImageTexture.new()

func get_nom():
	return(nom)
func edit_nom(nouveauNom):
	nom = nouveauNom

func get_texture():
	texture.create_from_image(illustration)
	return(texture)
func edit_illustration(chemin):
	illustration.load(chemin)

func Hello():
	print("HelloWorld")
