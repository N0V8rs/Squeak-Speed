extends Node2D

@export var ENEMY_SPEED = 60
var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

# Change to a aniamted sprite after the assets on in the folder
# Delete this
@onready var sprite_2d = $Sprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		sprite_2d.flip_h = false
	position.x += direction * ENEMY_SPEED * delta
