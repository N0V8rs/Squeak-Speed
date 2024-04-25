extends Area2D

@export var damage_amount = 1

func _on_Area2D_body_entered(body):
	if body is HealthComponent:
		body.damage(damage_amount)
		print(damage_amount)
