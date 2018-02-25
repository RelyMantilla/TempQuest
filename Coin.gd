extends Area2D

func _on_Area2D_body_entered( body ):
	if body.jugador == 1:
		$Sprite.frame = 2
	else:
		$Sprite.frame = 1
