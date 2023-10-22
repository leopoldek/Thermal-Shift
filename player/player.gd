extends RigidBody2D

const SPEED = 200.0
const MAX_HEALTH = 100.0

var health = MAX_HEALTH
var start
var restart = false

func _ready():
	start = global_position

func _physics_process(delta):
	if restart:
		global_position = start
		health = MAX_HEALTH
		restart = false
	
	var move = Vector2()
	if Input.is_key_pressed(KEY_W):
		move.y -= SPEED
	if Input.is_key_pressed(KEY_A):
		move.x -= SPEED
	if Input.is_key_pressed(KEY_S):
		move.y += SPEED
	if Input.is_key_pressed(KEY_D):
		move.x += SPEED
	
	var temperature = Field.get_temperature(global_position)
	if temperature >= 0.95:
		move *= 0.65
	
	linear_velocity = move
	
	if move != Vector2():
		$Sprite.rotation = move.angle()
	
	if Input.is_key_pressed(KEY_SHIFT):
		for body in $GrabArea.get_overlapping_bodies():
			#var force = global_position - body.global_position
			#force *= 5.0
			#force *= force
			#body.add_force(Vector2(), force)
			body.linear_velocity = linear_velocity

func _process(delta):
	if Input.is_key_pressed(KEY_R):
		Field.reset()
	
	#if Input.is_key_pressed(KEY_TAB):
	#	$CollisionShape2D.disabled = not $CollisionShape2D.disabled
	
	var temperature = Field.get_temperature(global_position)
	if temperature >= 0.95:
		health -= 50 * ((temperature - 0.95) * 20.0) * delta
	else:
		health += 50 * delta
	
	if health > MAX_HEALTH:
		health = MAX_HEALTH
	elif health <= 0:
		Field.reset()
	
	Gui.set_health(health, MAX_HEALTH)

func reset():
	restart = true