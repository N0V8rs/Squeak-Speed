extends MarginContainer

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_packed(MAIN_MENU)
