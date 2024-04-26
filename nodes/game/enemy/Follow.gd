extends State

class_name EnemyFollow

@export var falling_animation : String = "Air"
@export var air_state : State
@export var ground_state : State

var target : CharacterBody2D

func state_process(_delta):
	if not character.is_on_floor():
		playback.travel(falling_animation)
		next_state = air_state
	else:
		var dire = character.global_position.direction_to(target.global_position)
		var distance = character.global_position.distance_to(target.global_position)
		if distance - character.FOLLOW_OFFSET > character.ATTACK_MIN_DISTANCE or distance + character.FOLLOW_OFFSET < character.ATTACK_MIN_DISTANCE:
			pass
		elif distance > character.FOLLOW_MAX_DISTANCE:
			next_state = ground_state
		else:
			character.velocity.x = dire.x * character.FOLLOW_SPEED
			character.to_be_flipped.scale.x = character.scale.x * sign(dire.x)

func _on_detection_body_entered(body):
	if body.name == "player":
		target = body
		emit_signal("interrupt_state", self)
