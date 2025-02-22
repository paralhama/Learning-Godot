extends Node2D

@onready var health_bar_1 = $Health_bar1
@onready var health_bar_2 = $Health_bar2


func Updatehealth(NewHealth):
	var OldHealth = health_bar_2.value
	var styleBox : StyleBox = health_bar_1.get_theme_stylebox("fill")
	
	if NewHealth > 0:
		health_bar_1.value = OldHealth + NewHealth
		styleBox.bg_color = Color("1a340b")
		_catch_up_change(health_bar_2, NewHealth)
	elif NewHealth < 0:
		health_bar_2.value = OldHealth + NewHealth
		styleBox.bg_color = Color("ca0020")
		_catch_up_change(health_bar_1, NewHealth)
	
	health_bar_1.add_theme_stylebox_override("fill", styleBox)
		

func _catch_up_change(healthbar, NewHealth):
	for i in abs(NewHealth):
		await get_tree().create_timer(0.07).timeout
		
		if NewHealth < 0: healthbar.value -= 1
		elif NewHealth > 0: healthbar.value += 1

