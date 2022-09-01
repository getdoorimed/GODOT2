extends Area2D

func _ready():
	$AnimationPlayer.play("checkpoint")
	
func _process(delta):
	if GameStats.get_spawn() != self:
		$AnimationPlayer.play("checkpoint")
	



func _on_SavePoint_body_entered(body):
	if body.is_in_group("Player"):
		GameStats.set_spawn(self)
		$AnimationPlayer.play("saved")
