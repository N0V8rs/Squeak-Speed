extends Area2D

@export var rich_text = RichTextLabel

@onready var player = %Player
var character_movement = Player
@onready var timer = $Timer

func _on_body_entered(body):
	if body is Player:
		rich_text.visible = true
		timer.start()

func _on_timer_timeout():
	self.monitoring = false
	rich_text.visible = false
