extends State

class_name Player_walk_state

@export var jump_velocity : float = -450.0
@export var jump_in_water : float = -250.0
@export var walk_animation_name : String = "Walk"
@export var falling_animation : String = "Falling"
@export var air_state : State
@export var jump_animation : String = "Jump"
@export var attack_state : State
@export var attack_node : String = "Attack"

func on_enter():
	playback.travel(walk_animation_name)

func state_process(_delta):
	if not character.is_on_floor():
		playback.travel(falling_animation)
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()
		
func jump():
	if not character.is_in_water :
		character.velocity.y = jump_velocity
	else:
		character.velocity.y = jump_in_water
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_node)
