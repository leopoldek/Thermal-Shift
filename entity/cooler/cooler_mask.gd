extends Node2D

func _ready():
	pass

func _draw():
	draw_circle(Vector2(0, 0), 2, Color(get_parent().master_node.cool, 0.0, 0.0))