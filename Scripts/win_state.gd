extends MarginContainer
@onready var win_scene = $"Win Scene"

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _ready():
	CheckpointManager.gameplay.stop()
	win_scene.play()

func _on_quit_pressed():
	get_tree().change_scene_to_packed.call_deferred(MAIN_MENU)

func audio_win_state():
	CheckpointManager.gameplay.stop()
	win_scene.play()
