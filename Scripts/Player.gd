class_name Player
extends CharacterBody2D

@export var speed = 300
@export var gravity = 30 
@export var jump_force = 300
@onready var jumping_particles = $"Jumping Particles"
@onready var sprite_2d = $Sprite2D
@onready var jump_audio = $AudioStreamPlayer

@export var max_health = 1
var current_health
var last_position = 1
var is_dying: bool = false
var was_in_air = false

func _ready():
	pass

func _physics_process(delta):
	# Apply gravity when the player is not on the floor
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000

	if is_dying:
		return

	# Jump logic
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		jump_audio.play()
		sprite_2d.play("jumping")

	# Check for movement down action
	if Input.is_action_pressed("movement_down"):
		set_collision_mask_value(3, false)
	else:
		set_collision_mask_value(3, true)

	if Input.is_action_pressed("Debug"):
		CheckpointManager.checkpoint_timer.stop()

	# Handle horizontal movement
	var horizontal_direction = Input.get_axis("movement_left", "movement_right")
	if horizontal_direction != 0:
		last_position = horizontal_direction
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	# Flip sprite based on movement direction
	sprite_2d.flip_h = last_position < 0
	
	# Animations for the Player Movement
	if is_on_floor():
		if was_in_air:
			play_landing_particles()
			was_in_air = false
		if horizontal_direction == 0:
			sprite_2d.play("Idle") # Idle string for the Idle animations
		else:
			sprite_2d.play("running") # Running string for the running animations
	else:
		was_in_air = true
		if velocity.y < 0:
			sprite_2d.play("Rising") # Rising string for the rising animations
		elif velocity.y > 0:
			sprite_2d.play("Falling") # Falling string for the falling animations

func play_landing_particles():
	if jumping_particles:
		jumping_particles.restart()
