extends Area2D

signal trap_triggered

@export var damage = 1

func _on_Trap_body_entered(body):
	if (body.name == "Player"):
		emit_signal("trap_triggered", body)
