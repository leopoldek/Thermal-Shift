extends Node2D

func _ready():
	pass

func _draw():
	draw_circle(Vector2(0, 0), 3, Color(get_parent().master_node.frost, 0.0, 0.0))