extends Node
var players
var numOfPlayers

func _process(delta):
	players = get_children()
	numOfPlayers = get_child_count()
