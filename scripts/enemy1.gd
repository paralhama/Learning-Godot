extends CharacterBody2D

@onready var enemy_1 = $"."
@onready var ray_cast = $RayCast2D
@onready var area_2d = $Area2D
@onready var player_collision = $PlayerCollision


var direction = 1
var speed = 60
var gravity = 650


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.x = direction * speed
	
	if ray_cast.is_colliding() and direction == 1:
		direction = -1
		enemy_1.transform.x.x = direction
	else:
		if ray_cast.is_colliding() and direction == -1:
			direction = 1
			enemy_1.transform.x.x = direction

	


	move_and_slide()
	


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.health.Updatehealth(-10)
