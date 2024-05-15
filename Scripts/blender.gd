extends Node2D

@onready var animation_player = $AnimationPlayer
@export var play_animation: bool

func set_play_animation():
	if play_animation == true:
		animation_player.play("Blender Shake") 
	else:
		animation_player.stop()
