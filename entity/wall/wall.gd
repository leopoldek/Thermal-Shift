extends StaticBody2D

func _ready():
	Field.add(self, $Mask, true)
