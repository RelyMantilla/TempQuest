extends KinematicBody2D

var velocidad = Vector2()
var gravedad = 10
var velocidad_lateral=200
var velocidad_salto = 200
var grupo = 0
export(int, FLAGS, "player1", "player2") var jugador = 0
func _ready():
	velocidad.x = 0
	velocidad.y = 0
	
func _physics_process(delta):
	
	velocidad.y += gravedad	
	if (Input.is_action_pressed(str("player",str(jugador) ,"_der"))):
		velocidad.x = velocidad_lateral
		$Sprite.flip_h = true
		if !$Sprite.is_playing():
			$Sprite.play(str("Walk",str(jugador)))
	elif (Input.is_action_pressed(str("player",str(jugador) ,"_izq"))):
		velocidad.x = -velocidad_lateral
		$Sprite.flip_h = false
		if !$Sprite.is_playing():
			$Sprite.play(str("Walk",str(jugador)))
	else:
		velocidad.x = 0 
	if (Input.is_action_pressed(str("player",str(jugador) ,"_up"))):
		velocidad.y = -velocidad_salto
		$Sprite.play(str("Volar",str(jugador)))


	velocidad = move_and_slide(velocidad) 
