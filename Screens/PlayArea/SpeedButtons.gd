extends HBoxContainer

const speedBase := 1
const spawnBase := 3

func _ready():
	gameSpeed = speedBase



var gameSpeed := 1.0

#func _process(delta):
	#%Glogic.addToDebugLog(str($"../../PlayerSpawner".time_left))

var spawnRates = {
	"Pause" : 0,
	"X0_5" : 0.5,
	"X1" : 1,
	"X3" : 3,
	"X5" : 5
}

func pause():
	setSpeed(0)
	%Glogic.addToDebugLog("Paused")
func X0_5():
	setSpeed(0.5)
	%Glogic.addToDebugLog("X0.5")
func X1():
	setSpeed(1)
	%Glogic.addToDebugLog("X1")
func X3():
	setSpeed(3)
	%Glogic.addToDebugLog("X3")
func X5():
	setSpeed(5)
	%Glogic.addToDebugLog("X5")



func setSpeed(speed : float):
	gameSpeed = speedBase * speed

