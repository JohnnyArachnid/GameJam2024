extends Control

@export var game_manager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_game_manager_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()
	
func _on_button_2_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	game_manager.game_paused = false
	pass
	
func _on_exit_button_pressed():
	get_tree().quit()
	pass
