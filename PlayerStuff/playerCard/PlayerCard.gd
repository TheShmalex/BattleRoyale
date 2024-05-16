extends Control
@export var player : PlayerResource

var cards
@export var dislevel : float = 1.0

func _ready():
	
	$SubViewportContainer/SubViewport/card.self_modulate = player.color
	$SubViewportContainer/SubViewport/card/MeleeBar.frame = player.meleeLvl
	$SubViewportContainer/SubViewport/card/ShootingBar.frame = player.rangedLvl

func _process(delta):
	cards = $"../%Glogic".cards

func _on_button_pressed():
	var c = cards.pick_random()
	while c == self:
		c = cards.pick_random()
	if cards.find(c) != -1:
		$"../%Glogic".fight(player, c.player)

func disentigrate():
	player.alive = false
	$Button.disabled = true
	$"../%Glogic".roster.players.erase(player)
	cards.erase(self)
	$AnimationPlayer.play("dis") 
	player.icon.queue_free()

