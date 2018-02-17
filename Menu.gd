extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _on_Button_pressed():
	get_tree().change_scene("res://Escenario1.tscn")

#func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	if get_node("Button").ACTION_MODE_BUTTON_PRESS():
#		pass
#	pass
