extends Button

func _pressed():
	#for n in $"../../../..".selectedRoster.players:
		#print(n.fName)
	$"../../../../..".startGame($"../../../..".selectedRoster)

func _process(delta):
	disabled = !$"../../../..".anyRosterSelected
