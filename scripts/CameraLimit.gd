extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	if self.name == "LeftCameraLimit":
		Global.LeftCameraLimitPosition = self.global_position[0] + 8
	elif self.name == "RightCameraLimit":
		Global.RightCameraLimitPosition = self.global_position[0] - 8
	elif self.name == "DownCameraLimit":
		Global.DownCameraLimitPosition = self.global_position[1] - 8

