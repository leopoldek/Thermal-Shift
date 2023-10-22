extends Node2D

func _ready():
	pass

func _draw():
	var direction = Vector2(0.3, 0).rotated(-get_parent().get_parent().master_node.global_rotation)
	direction.x = min(0, direction.x)
	direction.y = min(0, direction.y)
	draw_rect(Rect2(-1, -3, 30, 6), Color(0, -direction.x, -direction.y))