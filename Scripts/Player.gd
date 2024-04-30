extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@onready var sprite_2d = $Sprite2D

@export var max_health = 1
var current_health

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "Idle"
	
	# Makes the Player jump
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("movement_left", "movement_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	# Sprite animations for left and right movement, fliping the Player
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
func damage(amount):
	current_health -= amount
	if current_health <= 0:
		die()

func die():
	#AnimatedSprite2D
	get_parent().queue_free()


func _on_saw_trap_trap_triggered():
	die()
