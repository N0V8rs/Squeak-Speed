extends Node2D

@export var animation_time_scale:int = 1
@onready var swinging_animation = $AnimationPlayer

func _ready():
	update_animation_speed()

func set_animation_time_scale(value):
	animation_time_scale = value
	update_animation_speed()

func update_animation_speed():
	swinging_animation.speed_scale = animation_time_scale
