extends Node

var score1
var score2
enum { ESTADO_NEUTRAL, ESTADO_PLAYER1, ESTADO_PLAYER2 }
enum { PLAYER_1, PLAYER_2 }
var VIDA1 = 5
var VIDA2 = 5
var TIEMPO=30

var vacio = load("res://Imagenes/heart_void.png")
var hot = load("res://Imagenes/heart_hot.png")
var cold = load("res://Imagenes/heart_cold.png")

func _incrementa_Vida(jugador):
	if jugador == 1 and VIDA1 < 5:
		VIDA1 += 1
	elif jugador == 2 and VIDA2 < 5:
		VIDA2 +=1


func _ready():
	# puntajes iniciales
	score1 = 0
	score2 = 0