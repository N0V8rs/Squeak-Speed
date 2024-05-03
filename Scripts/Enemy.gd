extends Node2D

@export var ENEMY_SPEED = 60
var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_down = $RayCastDown

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding() or not ray_cast_down.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding() or not ray_cast_down.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	position.x += direction * ENEMY_SPEED * delta

	if position.x > 1:
		animated_sprite.play("Walking")
