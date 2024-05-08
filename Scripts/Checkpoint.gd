extends Node

var player_last_position = null
var timer_time = 10

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _ready():
	get_tree().change_scene_to_packed(MAIN_MENU)
