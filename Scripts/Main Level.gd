extends Node2D

func _enter_tree():
	if CheckpointManager.player_last_position:
		$Player.global_position = CheckpointManager.player_last_position
		
@onready var timer_label = %TimerLabel

func _ready():
	CheckpointManager.second_changed.connect(on_second_changed)

func on_second_changed():
	timer_label.text = "%d" % CheckpointManager.checkpoint_timer.time_left
