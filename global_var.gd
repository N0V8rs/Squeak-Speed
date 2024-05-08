extends Node

var timer_time = 10
@onready var death_timer = %"Death Timer"
const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

func _ready():
	get_tree().change_scene_to_packed(MAIN_MENU)
