extends Node

@onready var teleport = $Position2D
@onready var player = %Player

func _on_area_2d_body_entered(body):
	if body is Player:
		player.position = teleport.get_global_transform().origin
