extends Control
var lastSceneSwitchedTo : String

const sceneLib = {
	"Title" : "res://Screens/Title/title.tscn",
	"Settings" : "res://Screens/Settings/settings.tscn",
	"PlayArea" : "res://Screens/PlayArea/PlayArea.tscn",
	"RosterView" : "res://Screens/RosterView/RosterView.tscn",
	"RosterSelect" : "res://Screens/RosterSelect/RosterSelect.tscn"
}

func _ready():
	switchScene("Title")


func switchScene(sceneString : String):
	var scene = load(sceneLib[sceneString])
	var children = get_children(true)
	var sceneInst = scene.instantiate()
	if children.size() != 0:
		lastSceneSwitchedTo = children[0].name
		children[0].queue_free()
	add_child(sceneInst)

func settingsPopup(mmbut : bool):
	var scene = load(sceneLib["Settings"])
	var sceneInst = scene.instantiate()
	add_child(sceneInst)

func prevScene():
	switchScene(lastSceneSwitchedTo)
