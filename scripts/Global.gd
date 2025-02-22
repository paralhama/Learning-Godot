extends Node


# PLAYER VARIABLES
var player
var last_position_before_jump = Vector2.ZERO
var jump = true
var in_killzone = false


# LEFT AND RIGHT CAMERA LIMIT VARIABLES
var LeftCameraLimitPosition = -10000000
var RightCameraLimitPosition = 10000000
# UP AND DOWN CAMERA LIMIT VARIABLES
var UpCameraLimitPosition = -10000000 #not used yet
var DownCameraLimitPosition = 10000000
