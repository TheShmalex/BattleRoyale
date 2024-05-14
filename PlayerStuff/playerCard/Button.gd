extends Button

func _process(delta):
	tooltip_text = $"..".player.weapon.resource_path.get_file().trim_suffix('.tres')
