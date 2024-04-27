extends CharacterBody2D

const MAX_SPEED : float = 100
var speed: float = MAX_SPEED
const DIRECTION_X : float = -1.0

@export var animation_player : AnimationPlayer
@export var move_animation_name : String = "MoveForward"
@export var fireball : PackedScene
@export var fireballSpawner : Marker2D

func _process(delta):
	velocity.x = speed * DIRECTION_X
	move_and_slide()

func _on_move_timer_timeout():
	speed = 0 if speed == MAX_SPEED else MAX_SPEED
	
	if speed == 0:
		print("fireball tu tutututu")
		spawn_fireball()

func spawn_fireball():
	var fb = fireball.instantiate()
	fb.global_position = fireballSpawner.global_position
	get_parent().add_child(fb)

func kill_them_all():
	# TODO kill all fireballs
	pass
