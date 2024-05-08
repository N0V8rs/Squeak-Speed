extends Area2D

func _on_body_entered(CharacterBody2D):
	get_tree().change_scene_to_file("res://Assets/Scenes/win_state.tscn")
