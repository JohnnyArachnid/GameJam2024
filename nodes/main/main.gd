extends Node2D

@onready var menu : Control = $MainMenu
@export var game : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.connect("play",startGame)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func startGame():
	get_tree().change_scene_to_packed(game)
	pass
