extends Area2D

func _ready():
	connect("body_entered", self, "_player_entered")

func _player_entered(object):
	Gui.message("You finished!",
			"You finished the game! Sorry there aren't more levels, " +
			"I didn't have enough time to make more. :(")
	Field.reset()