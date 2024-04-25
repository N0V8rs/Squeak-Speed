extends Node2D
class_name HealthComponent

@export var max_health = 1
var current_health

func _ready():
	current_health = max_health

func damage(amount):
	current_health -= amount
	if current_health <= 0:
		die()

func die():
	#AnimatedSprite2D
	get_parent().queue_free()
