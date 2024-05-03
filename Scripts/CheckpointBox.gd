extends Area2D

# Checkpoint animation if there is one goes in this func
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	Checkpoint.player_last_position = global_position
	print("Checkpoint Reached")
