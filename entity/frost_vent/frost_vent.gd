extends Node2D
export(float, 0.0, 1.0) var frost = 0.06

func _ready():
	Field.add(self, $Mask)
