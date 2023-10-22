extends Node2D

func _ready():
	pass

func _process(delta):
	var temperature = Field.get_temperature(global_position)
	if temperature < 0.4:
		$IceSprite.show()
		$WaterSprite.hide()
		$Body/CollisionShape.disabled = true
	else:
		$IceSprite.hide()
		$WaterSprite.show()
		$Body/CollisionShape.disabled = false