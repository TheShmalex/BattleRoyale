extends Area2D
var mouseStart
var areaMouseIn
var mouseNewPos
var smokePoof = preload("res://Effects/smoke_poof.tscn")
signal clickedArea

func _process(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("Click"):
		var sp = smokePoof.instantiate()
		add_child(sp)
		print(areaMouseIn)
	if get_overlapping_areas().size()>0:
		areaMouseIn = get_overlapping_areas()[0]
	else:
		areaMouseIn = null
	#print(overlaps_area($"/PlayerIcon/newDestArea"))
	#print("Mouse:" + str(has_overlapping_areas()))
