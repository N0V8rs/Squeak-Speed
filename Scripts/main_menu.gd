extends MarginContainer

const MAIN_LEVEL = preload("res://Assets/Scenes/Main Level.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_packed(MAIN_LEVEL)

func _on_quit_pressed():
	get_tree().quit()
