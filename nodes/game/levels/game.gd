extends GameManager

@export var next_lvn : PackedScene
@onready var timer : Timer = $Area2D/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(3.0,3.0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body.name == "player"):
		transitioner.animation_player.play("fade_out")
		timer.start()
		pass

func _on_timer_timeout():
	get_tree().change_scene_to_packed(next_lvn)
	pass
