extends Control

const main_menu = preload("res://Assets/Scenes/main_menu.tscn")

func _ready():
	(CheckpointManager.checkpoint_timer as Timer).stop()
	#CheckpointManager.main_menu_music.play()

func _on_menu_pressed():
	CheckpointManager.player_last_position = null
	get_tree().change_scene_to_packed(main_menu)
