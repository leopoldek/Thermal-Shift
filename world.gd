extends Node

# Later merge this with temperature.gd and make this scene a singleton

var level

func _enter_tree():
	Field.world = self
	Field.field = $Field
	Field.conduction_field = $ConductionField
	$TemperatureView.scale = Vector2(Field.FIELD_TO_WORLD, Field.FIELD_TO_WORLD)
	$ConductionView.scale = Vector2(Field.FIELD_TO_WORLD, Field.FIELD_TO_WORLD)

func _ready():
	new_level(preload("res://level/tutorial/tutorial.tscn").instance())

func new_level(scene):
	if level != null: level.queue_free()
	level = scene
	var size = Vector2(level.width, level.height) * 32.0 * Field.WORLD_TO_FIELD
	
	$Field.size = size
	$Field.render_target_clear_mode = Viewport.CLEAR_MODE_ONLY_NEXT_FRAME
	
	$ConductionField.size = size
	$ConductionField.render_target_clear_mode = Viewport.CLEAR_MODE_ONLY_NEXT_FRAME
	add_child(level)
	move_child(level, 0)