extends Node2D

func _ready():
	pass

func _draw():
	var direction = Vector2(0.3, 0).rotated(-get_parent().master_node.global_rotation)
	draw_rect(Rect2(-1, -3, 30, 6), Color(0, direction.x, direction.y))
	#draw_rect(Rect2(-1, -3, 30, 6), Color(0, 0, 1))
	#draw_circle(Vector2(0, 0), 2, Color(1, 0.5, 0.0))