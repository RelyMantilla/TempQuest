extends KinematicBody2D
<<<<<<< HEAD
=======

var velocidad = Vector2()
var gravedad = 500
var velocidad_lateral=200
var velocidad_salto = 200
var grupo = 0
>>>>>>> 334242db8fa7a679e7077af63388e09023f57256

var acceleration = 1000
var top_move_speed = 200
var top_jump_speed = 400
var life=5
var gravedad = 500
var movimiento = Vector2()


var directional_force = Vector2()

var PLAYER_ORIGEN

const DIRECTION = {
	ZERO=Vector2(0,0),
	LEFT=Vector2(-1,0),
	RIGHT=Vector2(1,0),
	UP=Vector2(0,-1),
	DOWN=Vector2(0,1)
}

func _ready():
	# para activar detección de colisiones
	#set_contact_monitor( true )
	#set_max_contacts_reported( 5 )
	#connect("body_enter",self,"collision_now")
	velocidad.x = 0
	velocidad.y = 0
	life=5
	
#Lectura calculo de la gravedad y fuerza
func _physics_process(delta):
	velocidad.x = 0 #Inicializo variable para limpiar el movimiento
	velocidad.y += gravedad * delta
	#grupo = get_parent().get_node("Player").is_in_group()
	
	if (get_parent().get_node("Player").is_in_group("Player1")):
		if (Input.is_action_pressed("player1_der")):
			velocidad.x = velocidad_lateral
		if (Input.is_action_pressed("player1_izq")):
			velocidad.x = -velocidad_lateral
		if (Input.is_action_pressed("player1_up")):
			velocidad.y = -velocidad_salto
	elif (get_parent().get_node("Player").is_in_group("Player2")):
		if (Input.is_action_pressed("player2_der")):
			velocidad.x = velocidad_lateral
		if (Input.is_action_pressed("player2_izq")):
			velocidad.x = -velocidad_lateral
		if (Input.is_action_pressed("player2_up")):
			velocidad.y = -velocidad_salto

	move_and_slide(velocidad)
	

"""# detección de colisiones"""
func collision_now(who):
	print(who)
	if (who.get_name().substr(0,8) == "BolaNodo"):
		who.cambiar_estado(PLAYER_ORIGEN)
	if (who.get_name().substr(0,7) == "Enemigo"):
		self.AjustaVida_2(PLAYER_ORIGEN)
	if who.get_name().substr(0,6) == "Player":
		# cuando dos jugadores chocan le restamos la vida a ambos
		# solo hay una llamada xq este método se llama por cada jugador
		self.AjustaVida_2(PLAYER_ORIGEN)

func AjustaVida_2(Personaje_Origen):
	# FIXME: el problema es en la clase personaje.gd, 
	# el valor inicial de PLAYER_ORIGEN
	get_parent().get_node("SamplePlayer2D 2").play("hurt04")
	Personaje_Origen -= 1 
	if Personaje_Origen == global.PLAYER_1:
		print("player1")
		global.VIDA2 -=1
		if global.VIDA2 == 0:
#			get_tree().change_scene("res://resultados.tscn")
			pass
	else:
		print("player2")
		global.VIDA1 -=1
		if global.VIDA1 == 0:
#			get_tree().change_scene("res://resultados.tscn")
			pass
