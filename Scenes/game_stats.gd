extends Node

onready var game_start_time = OS.get_ticks_msec()
var current_spawn = null

func reset():
	current_spawn = null
	get_tree().reload_current_scene()
	game_start_time = OS.get_ticks_msec()
	
func check_reset():
	if current_spawn == null:
		reset()
	else:
		return false

func set_spawn(spawn):
	current_spawn = spawn
	
func get_spawn():
	return current_spawn

func get_time():
	var current_time = OS.get_ticks_msec() - game_start_time
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var ms = current_time%1000/60
	print(str(minutes),":", str(seconds),":",str(ms))
