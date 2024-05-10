extends Node2D

@export var ENEMY_SPEED = 60
@export var direction = -1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_down_right = $RayCastDownRight
@onready var ray_cast_down_left = $RayCastDownLeft
@onready var animated_sprite = $AnimatedSprite2D

var raycasts_array:Array[RayCast2D] = []

func _ready():
	animated_sprite.flip_h = direction == 1
	raycasts_array = [ray_cast_left,ray_cast_right,ray_cast_down_left,ray_cast_down_right]

#func _draw():
	#for raycast in raycasts_array:
		#draw_line(raycast.position,raycast.position + raycast.target_position, Color.RED if raycast.is_colliding() else Color.GREEN,5.0)

func _process(delta):
	#queue_redraw()
	if ray_cast_right.is_colliding() or not ray_cast_down_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding() or not ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	position.x += direction * ENEMY_SPEED * delta

	if ENEMY_SPEED != 0:
		animated_sprite.play("Walking")
