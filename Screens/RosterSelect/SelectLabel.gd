extends Label


func _process(delta):
	visible = !$"../../..".anyRosterSelected
