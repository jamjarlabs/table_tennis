extends KinematicBody2D

export(NodePath) var target_path

export var speed = 150
export var movement_difference_range = 10


func _physics_process(delta):
	var velocity = Vector2.ZERO  # The player's movement vector.
	var target = get_node(target_path)
	var target_position = target.global_position

	if abs(target_position.y - position.y) > movement_difference_range:
		if target_position.y < position.y:
			velocity.y -= speed
		else:
			velocity.y += speed

	#warning-ignore:RETURN_VALUE_DISCARDED
	move_and_collide(velocity * delta)
