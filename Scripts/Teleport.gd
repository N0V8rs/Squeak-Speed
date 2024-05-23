extends Area2D

@onready var player = %Player
@onready var position_2d = $Position2D

func _on_body_entered(body):
	if body is Player:
		player.position = position_2d.global_position
