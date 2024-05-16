extends Node2D
@export var player : PlayerResource
var destination : Vector2
@onready var landArea = $"../%Land"
var moving

func _ready():
	player.icon = self
	$Inner.modulate = player.color
	$Border.modulate = player.color - Color(.2,.2,.2,0)
	global_position = $"../%School".position
	destination = Vector2(0,0)
	newDestination()
	await get_tree().create_timer(1).timeout
	moving = true


func newDestination():
	%newDestArea.global_position = Vector2(randi_range(100,1000),randi_range(100,1000))
	await get_tree().create_timer(.1).timeout
	while !(%newDestArea.has_overlapping_areas()):
		%newDestArea.global_position = Vector2(randi_range(100,1000),randi_range(100,1000))
		await get_tree().create_timer(.1).timeout
	destination = %newDestArea.global_position


func _process(delta):
	if global_position != destination and moving:
		global_position = global_position.move_toward(destination,$"../%SpeedController".gameSpeed)

