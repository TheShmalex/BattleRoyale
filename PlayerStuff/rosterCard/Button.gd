extends Button

func _pressed():
	$"../../../../../../..".anyRosterSelected = true
	$"../../../../../../..".selectedRoster = $"..".roster
