extends Control

var rosters := [load("res://PlayerStuff/rosters/HP2/HP2.tres")]
var rosterCard := preload("res://PlayerStuff/rosterCard/RosterCard.tscn")
var anyRosterSelected := false
var selectedRoster

func _ready():
	for r in rosters:
		var newRosterCard = rosterCard.instantiate()
		newRosterCard.roster = r
		$Panel/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer.add_child(newRosterCard)
