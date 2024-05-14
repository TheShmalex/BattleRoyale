extends Label

func _process(delta):
	text = str(%Glogic.roster.players.size()) + " Students Remain"
