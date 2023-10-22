extends StaticBody2D

const MAX_HEALTH = 50.0

var health = MAX_HEALTH

func _ready():
	pass

func _process(delta):
	var temperature = Field.get_temperature(global_position)
	if temperature >= 0.6:
		health -= 50 * delta
	else:
		health += 50 * delta
	
	if health > MAX_HEALTH:
		health = MAX_HEALTH
	elif health <= 0 and not $CollisionShape.disabled:
		$CollisionShape.disabled = true
		$Sprite.hide()
		$SizzleAudio.play()
		$SizzleParticles.emitting = true

func reset():
	health = MAX_HEALTH
	$CollisionShape.disabled = false
	$Sprite.show()