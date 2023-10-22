extends CanvasLayer

func _ready():
	pass

func set_health(health, max_health):
	$Health.margin_right = $Health.margin_left + health * 2.0
	$Health.color = Color(1, 0, 0).linear_interpolate(Color(0, 1, 0), health / max_health)

func message(title, msg):
	$Message.window_title = title
	$Message/VBoxContainer/Label.text = msg
	$Message.popup_centered()