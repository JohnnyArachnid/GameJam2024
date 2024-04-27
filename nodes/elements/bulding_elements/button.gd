extends Node2D

@export var interactive: Interactive

func _on_area_2d_body_entered(body):
	if (body.name == "player"):
		if not interactive:
			return
		
		if interactive.has_method("activate"):
			interactive.activate()
		if (interactive.is_active == false):
			interactive.is_active = true
			var anim_player = interactive.find_child("AnimationPlayer")
			if anim_player:
				anim_player.play("default")

	pass
		
