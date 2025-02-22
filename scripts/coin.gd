extends Area2D

@onready var coin = $"../.."

func _on_body_entered(_body):
	print("coin +1")
	coin.queue_free()
