extends Area2D

@onready var player = $".."



func _on_body_entered(body):
	if body.name == "TileMap":
		Global.jump = false




func _on_body_exited(body):
	if body.name == "TileMap":
		Global.jump = true
