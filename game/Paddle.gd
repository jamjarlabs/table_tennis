extends KinematicBody2D

export var player = ""
export var speed = 200
export var buffer = 25

var screen_size  # Size of the game window.


func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	var velocity = Vector2.ZERO  # The player's movement vector.

	if Input.is_action_pressed("%s_paddle_up" % player):
		velocity.y -= speed
	if Input.is_action_pressed("%s_paddle_down" % player):
		velocity.y += speed

	#warning-ignore:RETURN_VALUE_DISCARDED
	move_and_collide(velocity * delta)

	position.y = clamp(position.y, 0, screen_size.y)
