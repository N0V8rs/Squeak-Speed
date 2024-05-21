class_name Player
extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@onready var jumping_particles = $"Jumping Particles"
@onready var sprite_2d = $Sprite2D

@export var max_health = 1
var current_health
var last_position = 1
var is_dying:bool = false

func _ready():
	pass

func _physics_process(delta):
	# Makes the Player jump
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000

	if is_dying:
		#move_and_slide()
		return
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
		if (velocity.y < -1):
			sprite_2d.animation = "jumping"

	if Input.is_action_pressed("movement_down"):
		set_collision_mask_value(3, false)
	else:
		set_collision_mask_value(3, true)

	if Input.is_action_pressed("Debug"):
		CheckpointManager.checkpoint_timer.stop()

	var horizontal_direction = Input.get_axis("movement_left", "movement_right")
	if horizontal_direction != 0:
		last_position = horizontal_direction
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	# Sprite animations for left and right movement, fliping the Player
	#var isLeft = velocity.x < 0
	sprite_2d.flip_h = last_position < 0
	
	# Aniamtions for the Player Movement
	if is_on_floor():
		if horizontal_direction == 0:
			sprite_2d.play("Idle") # Idle string for the Idle animations
		else :
			sprite_2d.play("running") # Running string for the running animations
