extends CharacterBody2D

@onready var player = $"."
@onready var sprite = $AnimatedSprite2D
@onready var camera = $Camera2D
@onready var PlayerCollision = $PlayerCollision
@onready var health = $health/health_bar3


########################################
# List of actions buttons

# 1) WALK: Walk left or right
#    Controller: LEFT ANALOG STICK
#    Keyboard: ARROW DOWN KEY

# 2) DUCK: Hold down to crouch
#    Controller: LEFT ANALOG STICK DOWN
#    Keyboard: ARROW DOWN KEY

# 3) JUMP: Tap short for a short jump or Hold for a higher jump
#    Controller: A BUTTON
#    Keyboard: Z KEY

# 4) DASH: Quick evade on ground or air
#    Controller: Y BUTTON
#    Keyboard: SHIFT KEY

# 5) DESCEND: Drop down from certain platforms
#    Controller: LEFT ANALOG STICK DOWN + A BUTTON
#    Keyboard: ARROW DOWN KEY + Z KEY

# 6) ATTACK: Attack enemies
#    Controller: X BUTTON
#    Keyboard: X KEY

# 7) USE SHILED: Hold to Use shield to block attacks enemies
#    Controller: LT BUTTON
#    Keyboard: C KEY

# 8) AIM BOW: Hold to aim bow
#    Controller: RB BUTTON
#    Keyboard: C KEY
#    Use the LEFT ANALOG STICK to change the aiming direction
#    and then press button ATTACK(X BUTTON to shoot the arrow

# 9) PARRY: ????
#    Ainda definindo como vai ser o parry
#    Se vai ser como Cuphead ou como Zelda botw ou totk

# 10) SPECIAL ATTACK: Use a special
#    Controller: B BUTTON
#    Keyboard: V KEY
#    Any attack made on enemies with a sword or bow will
#    increase the special attack bar, when this bar is full
#    the special attack will be available.
#######################################

# variables of moviments of player
var direction = 0
var speed = 100.0
var jump_velocity = -180.0
var gravity = 650
var double_jump_used = false

func _ready():
	
	print(Global.DownCameraLimitPosition)
	Global.player = player

	# Set the Left and Right camera limits
	camera.limit_left = Global.LeftCameraLimitPosition
	camera.limit_right = Global.RightCameraLimitPosition
	camera.limit_bottom = Global.DownCameraLimitPosition

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1
	
	if direction != 0 and !Global.in_killzone:
		player.transform.x.x = direction
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		sprite.play("idle")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		health.Updatehealth(-10)
		
	if Input.is_action_just_pressed("duck"):
		health.Updatehealth(+10)


	move_and_slide()
	
