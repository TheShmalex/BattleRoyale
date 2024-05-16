extends PathFollow2D

func _ready():
	progress_ratio = randf_range(0,1)

func _process(delta):
	progress += .5 * %SpeedController.gameSpeed
	$"../../route2/PathFollow2D/GPUParticles2D".speed_scale = .5 * %SpeedController.gameSpeed
	$"../../route1/PathFollow2D/GPUParticles2D".speed_scale = .5 * %SpeedController.gameSpeed
