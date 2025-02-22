extends ProgressBar

@onready var health_bar = $"."
@onready var damage_bar = $damage_bar
@onready var timer = $Timer_damage_bar

func set_health(maxhealth, valuehealth, sizebar):
	health_bar.max_value = maxhealth
	health_bar.value = valuehealth
	health_bar.size.x = sizebar
	
	damage_bar.max_value = maxhealth
	damage_bar.value = valuehealth
	damage_bar.size.x = sizebar
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		self.value -= 10
	
	if Input.is_action_just_pressed("ui_left"):
		damage_bar.value -= 10
	
	if Input.is_action_just_pressed("ui_right"):
		self.value = 100
		damage_bar.value = 100
	
	if damage_bar.value > health_bar.value:
		if timer.is_stopped():
			timer.start()


func _on_timer_timeout():
	damage_bar.value = health_bar.value
