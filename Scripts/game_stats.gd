extends Node

func _ready():
	$AnimationPlayer.play("Checkpoint")
	
func _process(delta):
	if GameStats.get_spawn() != self:
		$AnimationPlayer.play("Checkpoint")
		


