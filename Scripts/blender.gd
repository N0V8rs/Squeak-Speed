extends Node2D

@export var animation_time_scale:int = 1
@onready var blender_animation = $AnimationPlayer
@onready var kill_collision = $Sprite2D/KillCollision
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	update_animation_speed()

func set_animation_time_scale(value):
	animation_time_scale = value
	update_animation_speed()

func update_animation_speed():
	blender_animation.speed_scale = animation_time_scale

func _on_kill_collision_body_entered(body):
	if body is Player:
		audio_stream_player_2d.play()
