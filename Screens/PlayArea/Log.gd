extends RichTextLabel

func add(newLog : String):
	text += newLog
	text += "\n\n"

func addDeathMessage(w : WeaponResource, killer : PlayerResource, killed : PlayerResource):
	var message : String = w.killMessages.pick_random()
	message = message.replace("1","[wave][color=#7fb069]%s[/color][/wave]" %killer.fName)
	message = message.replace("2","[shake][color=#CA3C25]%s[/color][/shake]" %killed.fName)
	add(message)
