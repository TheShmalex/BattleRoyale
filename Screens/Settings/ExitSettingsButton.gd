extends Button

func _pressed():
	$"../../AnimationPlayer".play("exit")

func exit():
	$"../..".queue_free()
