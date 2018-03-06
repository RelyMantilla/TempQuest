extends KinematicBody2D
var direccion = 1
var rebotar = false
func _process(delta):
	
	position.x += 150 * delta * direccion
	position.y += 150 * delta * direccion
	pass

func _on_Area2D_body_entered(body):
	print(body.name)
	var numrandom = randi() % 2 
	print(numrandom)
	if body.name == 'TileMap' or body.name == 'StaticBody2D':
		if rebotar == false:
			direccion *= -1
			rebotar = true
		else:
			if  numrandom== 0 :
				direccion = -1
	
	if body.is_in_group("Player"):
		global._incrementa_Vida(body.jugador)
		self.queue_free()
	pass # replace with function body
