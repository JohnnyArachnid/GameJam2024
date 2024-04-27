extends Control

@onready var start_button : Button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton
@onready var exit_button : Button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton
@onready var start_level : PackedScene = preload("res://nodes/game/game.tscn")
@onready var timer : Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	self.queue_free()
	pass
	
	
func on_exit_pressed() -> void:
	get_tree().quit() 
	
