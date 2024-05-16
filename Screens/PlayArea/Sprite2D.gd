extends Sprite2D

func _process(delta):
	global_position = $"..".destination
	if global_position == $"..".global_position:
		$"..".moving = false
		$"..".newDestination()
		$"../NewDestTimer".wait_time = randi_range(1,5)
		$"../NewDestTimer".start()
		await $"../NewDestTimer".timeout
		$"..".moving = true

