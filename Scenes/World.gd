extends Node2D

func _ready():
	pass
	
func _process(delta):
	pass
	if Input.is_action_just_pressed("reset"):
		GameStats.reset()
	print(GameStats.get_time())
	$CanvasLayer/Control/Label.text = GameStats.get_time()
