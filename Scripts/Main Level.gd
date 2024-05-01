extends Node2D

func _enter_tree():
	if Checkpoint.player_last_position:
		$Player.global_position = Checkpoint.player_last_position
