extends Node2D

@onready var oven_off_sprite = $OvenOffSprite
@onready var oven_warn_sprite = $OvenWarnSprite
@onready var oven_hot_sprite = $OvenHotSprite
@onready var oven_timer = $OvenTimer

var current_oven_sprite = 1

# IMPORTANT
# Actually doesn't work with hitboxes

# Called when the node enters the scene tree for the first time.
func _ready():
	oven_off_sprite.visible = true
	oven_off_sprite.is_processing()
	oven_warn_sprite.hide()
	oven_hot_sprite.hide() 
	#oven_timer.start()
	print("OFF Oven spawned")

func _on_oven_timer_timeout():
	if current_oven_sprite == 1:
		oven_off_sprite.is_processing()
		#oven_warn_sprite.set_process()
		current_oven_sprite = 2
	elif current_oven_sprite == 2:
		oven_warn_sprite.visible = false
		oven_hot_sprite.visible = true
		current_oven_sprite = 3
	elif current_oven_sprite == 3:
		oven_hot_sprite.visible = false
		oven_warn_sprite.visible = true
		current_oven_sprite = 4
	elif current_oven_sprite == 4:
		oven_warn_sprite.visible = false
		oven_off_sprite.visible = true
		current_oven_sprite = 1
	oven_timer.start()
