extends Node

@onready var player = %Player
@onready var position_2d = $"../../../Level 5/Traps/Teleport/Position2D"

func _on_area_2d_body_entered(body):
	if body is Player:
		player.position = position_2d.get_global_transform().origin
