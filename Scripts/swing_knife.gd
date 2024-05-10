extends Node2D

@export var aniamtion_time_scale:int = 1
@onready var swinging_animation = $AnimationPlayer

func animation_time():
	swinging_animation.speed_scale(aniamtion_time_scale)
