extends Position2D


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	print(body.jugador)
	pass # replace with function body
