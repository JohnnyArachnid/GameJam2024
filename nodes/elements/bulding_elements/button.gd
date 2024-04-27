extends Node2D

@export var interactive: Interactive

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if (body.name == "player"):
		if (interactive.is_active == false):
			interactive.is_active = true
			interactive.find_child("AnimationPlayer").play("default")
	pass
		
