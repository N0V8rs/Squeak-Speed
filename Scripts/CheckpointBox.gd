extends Area2D

# Move this clock to the Player scene
# It will add another timer when entering the checkpoint
var current_timer = null
@export var timer_time = 10
@onready var clock_timer = $"../Clock Timer"

# Checkpoint animation if there is one goes in this func
func _ready():
	clock_timer.start(timer_time)
	pass
	
func _process(delta):
	print(clock_timer.time_left)
	pass

func _on_body_entered(body):
	if body.name == "Player":
		clock_timer.stop()
		clock_timer.start(timer_time)
		Checkpoint.player_last_position = global_position
		print("Checkpoint Reached")

func _on_clock_timer_timeout():
	get_tree().reload_current_scene()
