extends Area2D

@onready var kill_timer = $Timer

func _on_timer_timeout():
	CheckpointManager.can_restart_timer = false
	get_tree().reload_current_scene()

func _on_body_entered(body):
	if body is Player:
		print("The Player has die")
		body.sprite_2d.play("Hit")
		body.is_dying = true
		var player_twee := create_tween()
		player_twee.tween_property(body,"scale",Vector2.ONE * 0.001, 0.45).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
		CheckpointManager.fade_out_in()
		#body.get_node("CollisionShape2D").queue_free()
		kill_timer.start()
