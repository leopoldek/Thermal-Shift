extends RigidBody2D

export(float, 0.0, 1.0) var heat = 0.042

var start

var restart = false

func _ready():
	Field.add(self, $Mask)
	start = global_position

func reset():
	restart = true

func _integrate_forces(state):
	if restart:
		state.transform.origin = start
		state.linear_velocity = Vector2()
		restart = false