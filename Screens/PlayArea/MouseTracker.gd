extends Area2D

var areaMouseIn
var smokePoof = preload("res://Effects/smoke_poof.tscn")
signal clickedArea

func _process(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("Click"):
		var sp = smokePoof.instantiate()
		add_child(sp)
	if get_overlapping_areas().size()>0:
		areaMouseIn = get_overlapping_areas()[0]

func _input(event):
	if event.is_action_pressed("Click"):
		emit_signal("clickedArea", areaMouseIn)





