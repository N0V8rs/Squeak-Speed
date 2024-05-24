extends Node

var player_last_position = null
@onready var checkpoint_timer :Timer = %CheckpointTimer
@onready var fader = %Fader
@onready var gameplay_music = $AudioStreamPlayer2D
var current_scene = "."

const MAIN_MENU = preload("res://Assets/Scenes/main_menu.tscn")
const CONTROL_MENU = preload("res://Assets/Scenes/control_menu.tscn")
var can_restart_timer:bool = true

signal second_changed

func _ready():
	get_tree().change_scene_to_packed.call_deferred(MAIN_MENU)
	gameplay_music.play()
	pass

func fade_out_in():
	var tween = fader.create_tween()
	tween.tween_interval(0.15)
	tween.tween_property(fader,"modulate",Color.BLACK,0.5)
	tween.tween_interval(0.2)
	tween.tween_property(fader,"modulate",Color(Color.BLACK,0.0),0.3)

func timer_fader():
	var tween = fader.create_tween()
	tween.tween_property(fader,"modulate",Color.BLACK,0.5)
	tween.tween_property(fader,"modulate",Color(Color.BLACK,0.0),0.3)
	return tween

func _on_checkpoint_timer_timeout():
	CheckpointManager.can_restart_timer = true
	var tween = timer_fader()
	get_tree().reload_current_scene.call_deferred()

func _process(delta):
	if not checkpoint_timer.is_stopped():
		print(checkpoint_timer.time_left)
	pass

func _on_second_counter_timer_timeout():
	second_changed.emit()
