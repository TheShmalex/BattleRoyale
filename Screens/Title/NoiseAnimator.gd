extends TextureRect
func _process(delta):
	texture.noise.set_offset(Vector3(texture.noise.get_offset().x+.1,0,0))
