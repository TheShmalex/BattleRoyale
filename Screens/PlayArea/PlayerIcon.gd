extends Node2D
@export var player : PlayerResource
var destination : Vector2
@onready var landArea = $"../%Land"

func _ready():
	$Inner.modulate = player.color
	$Border.modulate = player.color - Color(.2,.2,.2,0)
	global_position = $"../%School".position
	newDestination()

func newDestination():
	$NewDest.global_position = Vector2(randi_range(100,1000),randi_range(100,1000))
	print(str(Geometry2D.is_point_in_polygon(Vector2(408, 574), $Range/CollisionShape2D.polygon)))
	#print($NewDest.global_position)
#func _process(delta):
	#print(Vector2(randi_range(100,1000),randi_range(100,1000)))
