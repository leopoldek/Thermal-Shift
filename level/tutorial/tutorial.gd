extends Node

const width = 33
const height = 31

func _ready():
	Gui.message(
			"Welcome!",
			"Movement: Use 'WASD'\nGrab objects: Hold 'Shift'\nRestart: Press 'R'\n\n" +
			"Move and use objects to get them to interact with each other, " +
			"AND the temperature.\n\nWatch out though, standing in hot areas " +
			"can kill you! You can see you health in the top-left corner.\n\nGood luck!"
	)
