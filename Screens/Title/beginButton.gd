extends Button
var selected
func _on_pressed():
	$"../AnimationPlayer".play("exit")
	selected = true

func exit():
	if selected:
		$"../..".switchScene("RosterSelect")
