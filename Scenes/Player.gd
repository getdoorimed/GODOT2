extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400

var velocity = Vector2.ZERO 

export (float) var friction = 10
export (float) var acceleration = 25

enum state {IDLE, RUNNING, PUSHING, ROLLING, JUMP, STARTJUMP, FALL, ATTACK}

onready var player_state = state.IDLE

func _ready():
	$AnimationPlayer.play("IdlePlayer")
	pass

func update_animation(anim):
	if velocity.x < 0:
		$Sprite.flip_h = true
	elif velocity.x > 0:
		$Sprite.flip_h = false
		
	match(anim):
		state.FALL:
			$AnimationPlayer.play("FallPlayer")
		state.ATTACK:
			$AnimationPlayer.play("AttackPlayer")
		state.IDLE:
			$AnimationPlayer.play("IdlePlayer")
		state.JUMP:
			$AnimationPlayer.play("JumpPlayer")
		state.PUSHING:
			$AnimationPlayer.play("PushingPlayer")
		state.RUNNING:
			$AnimationPlayer.play("RunningPlayer")
		
	pass
	
func handle_state(player_state):
	match(player_state):
		state.STARTJUMP:
			velocity.y = jump_speed
	pass
	
func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)
	
func _physics_process(delta):
	get_input()
	
	if velocity == Vector2.ZERO:
		player_state = state.IDLE
	if Input.is_action_just_pressed("jump") and is_on_floor():
		player_state = state.STARTJUMP
	elif velocity.x != 0:
		player_state = state.RUNNING

	if not is_on_floor():
		if velocity.y < 0:
			player_state = state.JUMP
		if velocity.y > 0:
			player_state = state.FALL
	
	handle_state(player_state)
	update_animation(player_state)	
	#setgraivty
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
