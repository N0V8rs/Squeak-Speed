extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@onready var sprite_2d = $Sprite2D

@export var max_health = 1
var current_health

func _physics_process(delta):
	# Makes the Player jump
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
		if (velocity.y < -1):
			sprite_2d.animation = "jumping"
	
	var horizontal_direction = Input.get_axis("movement_left", "movement_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	# Sprite animations for left and right movement, fliping the Player
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
	# Aniamtions for the Player Movement
	if horizontal_direction == 0:
		sprite_2d.play("Idle")
	else :
		sprite_2d.play("running")
