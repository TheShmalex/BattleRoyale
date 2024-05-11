extends Node

var roster
var players

func _ready():
	roster = $"..".roster
	players = roster.players
	addCards()
	
	

func _process(delta):
	pass

func addCards():
	for p in players:
		var playerCard = preload("res://PlayerStuff/playerCard/PlayerCard.tscn")
		var newPlayerCard = playerCard.instantiate()
		newPlayerCard.player = p
		$"../UI/ScrollContainer/VBoxContainer".add_child(newPlayerCard)

func addToLog(newLog : String):
	%Log.text += newLog
	%Log.text += "\n\n"
