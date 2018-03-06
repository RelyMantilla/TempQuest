extends KinematicBody2D

var velocidad = Vector2()
var gravedad = 10
var velocidad_lateral=200
var velocidad_salto = 200
var grupo = 0
var volando = false
export(int, FLAGS, "player1", "player2") var jugador = 0
func _ready():
	velocidad.x = 0
	velocidad.y = 0
	
	
func _physics_process(delta):
	
	velocidad.y += gravedad	
	if (Input.is_action_pressed(str("player",str(jugador) ,"_der"))):
		velocidad.x = velocidad_lateral
		$Sprite.flip_h = true
	elif (Input.is_action_pressed(str("player",str(jugador) ,"_izq"))):
		velocidad.x = -velocidad_lateral
		$Sprite.flip_h = false
	else:
		velocidad.x = 0
	if (Input.is_action_pressed(str("player",str(jugador) ,"_up"))):
		velocidad.y = -velocidad_salto
		volando=true

	#animaciones
	if volando: #esta volando 
		$Sprite.play(str("Volar",str(jugador)))
	elif velocidad.x != 0: #esta moviendo izquierda
		$Sprite.play(str("Walk",str(jugador)))
	else: #esta detenido
		$Sprite.stop()
	
	#Se restablece la variable al tocar el piso para cambiar la animacion
	if is_on_floor():
		volando = false
	
	velocidad = move_and_slide(velocidad, Vector2(0,-1)) 
