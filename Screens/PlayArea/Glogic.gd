extends Node

var roster
var players
var cards := []
@export var weapons := []
var colorNames = [
	"FFC2D1",
	"FB6F92",
	"CF3483",
	"D90429",
	"840006",
	"FF684D",
	"E07A5F",
	"FF8E00",
	"F6AA1C",
	"F2CC8F",
	"EDF67D",
	"F0EBD8",
	"BEEE62",
	"8FB20F",
	"5C8001",
	"A4C3B2",
	"8AC1DD",
	"778DA9",
	"006D77",
	"045DAF",
	"CBC5EA",
	"94009F",
	"B67299",
	"735D78",
	"936639",
	"BF9F8B"
]

func _ready():
	$"../PlayerSpawner".wait_time = %SpeedController.spawnBase
	roster = $"..".roster
	players = roster.players
	await get_tree().create_timer(2).timeout
	$"../PlayerSpawner".start()
	spawnPlayer(players[0])

func addCard(p : PlayerResource):
	for i in 4:
		var num = randi_range(0,1)
		if num == 1:
			p.meleeLvl += 1
		else:
			p.rangedLvl += 1
	var playerCard = preload("res://PlayerStuff/playerCard/PlayerCard.tscn")
	var newPlayerCard = playerCard.instantiate()
	newPlayerCard.player = p
	cards.append(newPlayerCard)
	p.weapon = weapons.pick_random()
	weapons.erase(p.weapon)
	var col = randi_range(0,colorNames.size()-1)
	p.color = Color(colorNames[col])
	colorNames.remove_at(col)
	p.card = newPlayerCard
	$"../UI/ScrollContainer/VBoxContainer".add_child(newPlayerCard)

func fight(p1 : PlayerResource ,  p2 : PlayerResource): 
	var p1r = rollForCombat(p1)
	var p2r = rollForCombat(p2)
	if p1r < p2r:
		%Log.addDeathMessage(p2.weapon, p2, p1)
		p1.card.disentigrate()
	elif p1r > p2r:
		%Log.addDeathMessage(p1.weapon, p1, p2)
		p2.card.disentigrate()
	else:
		var n = randi_range(0,1)
		if n == 0:
			%Log.addDeathMessage(p2.weapon, p2, p1)
			p1.card.disentigrate()
		else:
			%Log.addDeathMessage(p1.weapon, p1, p2)
			p2.card.disentigrate()

	#print(p1.fName + " - " + str(p1r))
	#print(p2.fName + " - " + str(p2r))

func rollForCombat(p : PlayerResource):
	var weapon = p.weapon
	var die = max(p.meleeLvl,p.rangedLvl)
	if p.meleeLvl>p.rangedLvl:
		die += weapon.meleeLvl 
	elif p.meleeLvl<p.rangedLvl:
		die += weapon.rangedLvl
	else :
		die += [p.meleeLvl,p.rangedLvl].pick_random()
	var ans : int
	for i in die:
		ans += randi_range(0,2)
	return ans


func spawnPlayer(p : PlayerResource):
	addCard(p)
	var playerIconScene = preload("res://Screens/PlayArea/PlayerIcon.tscn")
	var newPlayerIcon = playerIconScene.instantiate()
	newPlayerIcon.player = p
	$"../mapGrid/Grid".add_child(newPlayerIcon)
	
	

func _on_player_spawner_timeout():
	for i in players:
		if i.icon == null:
			spawnPlayer(i)
			break

func addToDebugLog(s: String):
	$"../mapGrid/Panel/DebugLog".add_text(s)
	$"../mapGrid/Panel/DebugLog".add_text("\n")

