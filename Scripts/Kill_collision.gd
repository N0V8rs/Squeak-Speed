extends Area2D

@onready var kill_timer = $Timer

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_body_entered(body):
	print("The Player has die")
	#body.get_node("CollisionShape2D").queue_free()
	kill_timer.start()
