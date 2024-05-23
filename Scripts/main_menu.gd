extends MarginContainer

const MAIN_LEVEL = preload("res://Assets/Scenes/Main Level.tscn")
const control_menu = preload ("res://Assets/Scenes/control_menu.tscn")
@onready var main_menu_music = $"Main Menu Music"

func _ready():
	(CheckpointManager.checkpoint_timer as Timer).stop()
	CheckpointManager.gameplay_music.stop()
	main_menu_music.play()

func _on_play_pressed():
	CheckpointManager.player_last_position = null
	get_tree().change_scene_to_packed(MAIN_LEVEL)

func _on_quit_pressed():
	get_tree().quit()

func _on_controls_pressed():
	CheckpointManager.player_last_position = null
	get_tree().change_scene_to_packed(control_menu)
