extends Resource
class_name RosterResource

@export var rosterName : String
@export var players := [PlayerResource]
var size := players.size()

func addPlayer(p : PlayerResource):
	players.append(p)
