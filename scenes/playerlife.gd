extends ColorRect
@onready var health = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_player_health_changed(var player):
	health.size.x = 100 * player
