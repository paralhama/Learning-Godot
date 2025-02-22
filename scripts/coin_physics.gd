extends RigidBody2D

# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready():
	var drop = self

	# Determina a direção horizontal aleatoriamente (-1 ou 1)
	var horizontal_direction = randf_range(-1.0, 1.0)
	var horizontal_impulse = randf_range(1.0, 3.0) * horizontal_direction
	var vertical_impulse = randf_range(3.5, 5.5)

	# Aplica o impulso central com componente vertical
	drop.apply_central_impulse(Vector2(horizontal_impulse, -vertical_impulse))

	# Adiciona um impulso adicional para cima
	drop.apply_impulse(Vector2.ZERO, Vector2(0.0, -vertical_impulse / 2.0))
