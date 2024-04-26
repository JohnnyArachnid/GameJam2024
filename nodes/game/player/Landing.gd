extends State

class_name PlayerLandingState

@export var landing_animation_name : String = "Landing"
@export var ground_state : State

func on_enter():
	await playback.is_playing()
	next_state = ground_state

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_animation_name):
		next_state = ground_state
