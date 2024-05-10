extends Node2D

# Move this clock to the Player scene
# It will add another timer when entering the checkpoint

@export var first_check_point:bool = false
@export var check_point_timer:int = 15

func _ready():
	if first_check_point and CheckpointManager.can_restart_timer:
		(CheckpointManager.checkpoint_timer as Timer).start(check_point_timer)
		
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		# When the Player dies can't restart the timer
		#if CheckpointManager.player_last_position != null and (CheckpointManager.player_last_position as Vector2).distance_to(global_position) < 0.5:
			#return
		CheckpointManager.player_last_position = global_position
		print("Checkpoint Reached")
		(CheckpointManager.checkpoint_timer as Timer).start(check_point_timer)
		var twn:= create_tween()
		twn.tween_property(self,"scale",Vector2.ONE * 1.2,0.22).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
		twn.tween_interval(0.3)
		twn.tween_property(self,"scale",Vector2.ONE,0.3)
