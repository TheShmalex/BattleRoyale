extends Area2D
var player
var Rang
func _ready():
	player = $"..".player
	await get_tree().create_timer(.1).timeout
	$"../../%Glogic".addToDebugLog(player.fName)

func getPlayer():
	return player
