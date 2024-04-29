extends SubViewportContainer

@export var disVal: float

func _process(delta):
	material.set_shader_parameter("dissolve_value", disVal)
