extends Node

var player_last_position = null
@onready var checkpoint_timer :Timer = %CheckpointTimer
@onready var fader = %Fader

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")

var can_restart_timer:bool = true

signal second_changed

func _ready():
	get_tree().change_scene_to_packed.call_deferred(MAIN_MENU)

func fade_out_in():
	var tween = fader.create_tween()
	tween.tween_interval(0.15)
	tween.tween_property(fader,"modulate",Color.BLACK,0.6)
	tween.tween_interval(0.4)
	tween.tween_property(fader,"modulate",Color(Color.BLACK,0.0),0.3)

func _on_checkpoint_timer_timeout():
	CheckpointManager.can_restart_timer = true
	fade_out_in()
	get_tree().reload_current_scene.call_deferred()

func _process(delta):
	if not checkpoint_timer.is_stopped():
		print(checkpoint_timer.time_left)
	pass


func _on_second_counter_timer_timeout():
	second_changed.emit()
