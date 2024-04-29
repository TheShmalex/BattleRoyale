extends AnimatedSprite2D

var pos

func _ready():
	pos = global_position

func _process(delta):
	global_position = pos
	if frame == 4:
		queue_free()
