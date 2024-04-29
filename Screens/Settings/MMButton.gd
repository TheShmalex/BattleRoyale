extends Button
var selected

func _ready():
	visible = false
	if $"../../../../..".get_children()[0].name != "Title":
		visible = true

func _pressed():
	$"../../../../AnimationPlayer".play("exit")
	selected = true

func exit():
	if selected:
		$"../../../../..".switchScene("Title")
