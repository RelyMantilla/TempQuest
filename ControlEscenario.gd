extends Node

var pos = Vector2()
var archivo_escena = load("res://HealBonus.tscn")

func _on_Timer_timeout():

	var node_heal = archivo_escena.instance()
	pos.x = randi() % 875+ 74
	pos.y = randi() % 559 + 10
	node_heal.position = pos
#	print(node_heal.position)
	add_child(node_heal)
	