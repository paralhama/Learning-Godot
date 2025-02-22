extends Area2D

@onready var player = $".."


func _on_body_exited(body):
	if body.name == "TileMap":
		var tile = body.local_to_map(player.global_position)
		var PositionTile = body.map_to_local(tile)
		Global.last_position_before_jump = PositionTile
