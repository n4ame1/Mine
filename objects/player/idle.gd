extends PlayerState

func enter():
	player.animation_tree.set("parameters/idle/blend_position", player.last_non_zero_vector)
	player.animation_state.travel("idle")


func update(delta: float) -> void:
	if player.get_vector() != Vector2.ZERO:
		state_machine.transition_to("Move")
