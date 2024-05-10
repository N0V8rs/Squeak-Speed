extends Area2D

func _on_body_entered(body):
	if body is Player:
		CheckpointManager.checkpoint_timer.stop()
		get_tree().change_scene_to_file("res://Assets/Scenes/win_state.tscn")
