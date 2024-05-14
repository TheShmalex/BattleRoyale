extends Node

var roster
var players
var cards := []
@export var weapons := []

func _ready():
	roster = $"..".roster
	players = roster.players
	addCards()


func addCards():
	for p in players:
		for i in 4:
			var num = randi_range(0,1)
			if num == 1:
				p.meleeLvl += 1
			else:
				p.rangedLvl += 1
		var playerCard = preload("res://PlayerStuff/playerCard/PlayerCard.tscn")
		var newPlayerCard = playerCard.instantiate()
		newPlayerCard.player = p
		cards.append(newPlayerCard)
		p.weapon = weapons.pick_random()
		$"../UI/ScrollContainer/VBoxContainer".add_child(newPlayerCard)
