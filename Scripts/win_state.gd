extends MarginContainer

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _on_quit_pressed():
	get_tree().change_scene_to_packed.call_deferred(MAIN_MENU)
