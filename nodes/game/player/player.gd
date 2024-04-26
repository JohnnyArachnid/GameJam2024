extends CharacterBody2D

class_name Player

signal die

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var character_state_machine : CSM
@export var to_be_flipped : Node2D

# DEBUG WYJEB KIEDYŚ
@onready var debug_state_label : Label = $DEBUG_STATE_LABEL

var is_dead : bool = false
var is_in_water : bool = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not is_dead :
		var direction = Input.get_axis("move_left", "move_right")
		if direction and character_state_machine.check_if_can_move():
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if direction != 0:
			to_be_flipped.set_scale(Vector2(abs(scale.x) * direction, scale.y))

	move_and_slide()
	
	# DEBUG WYJEB KIEDYŚ
	debug_state_label.text = character_state_machine.current_state.name

func kill():
	emit_signal("die")

