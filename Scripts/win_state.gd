extends MarginContainer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _ready():
	CheckpointManager.gameplay_music.stop()
	audio_stream_player_2d.play()

func _on_quit_pressed():
	get_tree().change_scene_to_packed.call_deferred(MAIN_MENU)

func audio_win_state():
	CheckpointManager.gameplay_music.stop()
	audio_stream_player_2d.play()
