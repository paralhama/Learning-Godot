extends ColorRect
 
# Cache progress bar nodes
@onready var damage_bar = $damage_bar
@onready var health_bar = $health_bar
 
# Set maximum value for the progress bars
var max_val = 100
 
 
# Initialize progress bars with the maximum value
func _ready():
	damage_bar.value = max_val
	damage_bar.max_value = max_val
	health_bar.value = max_val
	health_bar.max_value = max_val



# Update progress bars when the front progress bar's value changes
func _on_health_bar_value_changed(value):
	if value >= 100:
		# Clamp the value to the maximum value (100)
		health_bar.value = 100
		damage_bar.value = 100
		return
	
	health_bar.value = value
	
	# Update the back progress bar value if front is greatere
	if health_bar.value > damage_bar.value:
		damage_bar.value = health_bar.value
		return
	
	# Set the front progress bar value to 0 if it's less than or equal to 0
	if health_bar.value <= 0: health_bar.value = 0
	
	# Animate the back progress bar value to match the front progress bar value
	if health_bar.value != damage_bar.value:
		var damage_bar_tween = get_tree().create_tween()
		damage_bar_tween.tween_property(damage_bar, "value", health_bar.value, 0.5)

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		_on_health_bar_value_changed(health_bar.value - 10)
		
	if Input.is_action_just_pressed("ui_left"):
		_on_health_bar_value_changed(health_bar.value + 10)
