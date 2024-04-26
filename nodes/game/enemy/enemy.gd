extends CharacterBody2D

signal die

const WALK_SPEED = 100.0
const FOLLOW_SPEED = 200.0
const ATTACK_MIN_DISTANCE = 50
const FOLLOW_MAX_DISTANCE = 300
const FOLLOW_OFFSET = 20

@export var character_state_machine : CSM
@export var floorDetect: RayCast2D
@export var wallDetect : RayCast2D
@export var to_be_flipped : Node2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction : int = 1

var is_dead = false
var rand : RandomNumberGenerator = RandomNumberGenerator.new()

# DEBUG WYJEB KIEDYŚ
@onready var debug_state_label : Label = $DEBUG_STATE_LABEL

func _ready():
	rand.randomize()

func _physics_process(delta):
	#if character_state_machine.current_state is EnemyWalk and (not floorDetect.is_colliding() or wallDetect.is_colliding()):
		#direction *= -1
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
	
	# DEBUG WYJEB KIEDYŚ
	debug_state_label.text = character_state_machine.current_state.name

func kill():
	emit_signal("die")
