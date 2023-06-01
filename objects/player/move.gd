extends PlayerState

func enter():
	player.animation_state.travel("move")


func update(_delta: float) -> void:
	var vector = player.get_vector()
	player.animation_tree.set("parameters/move/blend_position", vector)
	player.velocity = vector * player.move_speed
	player.move_and_slide()
	
	if vector == Vector2.ZERO:
		state_machine.transition_to("Idle")
	else:
		player.last_non_zero_vector = vector
