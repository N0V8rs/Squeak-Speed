extends Node2D

@export var launch_force = 1000
@onready var bounce_sprite_2d = $AnimatedSprite2D

# crashes because of the audio player
func _on_area_2d_body_entered(body):
	if body is Player:
		body.velocity.y =- launch_force
		$AudioStreamPlayer2D.play()
		bounce_sprite_2d.play("Active")
	else:
		bounce_sprite_2d.play("Idle")
		
