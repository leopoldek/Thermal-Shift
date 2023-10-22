extends Node2D

func _ready():
	pass

func _draw():
	draw_circle(Vector2(0, 0), 2.0, Color(get_parent().master_node.heat, 0.0, 0.0))
	#draw_circle(Vector2(0, 0), 10, Color(0.0, 0.1, 0.1))
