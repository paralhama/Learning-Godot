extends Area2D

@onready var timer = $Timer
var player

func _on_body_entered(body):
	if body.name == "Player":
		Global.in_killzone = true
		player = body
		print("You Died!")
		timer.start()

func _on_timer_timeout():
	Global.in_killzone = false
	player.global_position = Global.last_position_before_jump
