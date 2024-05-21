extends Area2D

@export var rich_text = RichTextLabel
@export var death_timer_show : bool

@onready var player = %Player
var character_movement = Player
@onready var timer = $Timer
@onready var timer_label = %TimerLabel

func _on_body_entered(body):
	if body is Player:
		rich_text.visible = true
		timer.start()
		if death_timer_show == true:
			var death_timer_tween = timer_label.create_tween()
			death_timer_tween.tween_property(timer_label,"scale",Vector2.ONE * 3.0,0.22).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
			death_timer_tween.tween_interval(1)
			death_timer_tween.tween_property(timer_label,"scale",Vector2.ONE,0.3)

func _on_timer_timeout():
	self.monitoring = false
	rich_text.visible = false
