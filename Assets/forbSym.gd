extends Sprite2D
var pos = position
var ofat = Vector2(40,40)
# Called when the node enters the scene tree for the first time.
func _ready():
	pos += ofat
	position = pos
	self_modulate = Color(255,0,0)



func _process(delta):
	position = pos
