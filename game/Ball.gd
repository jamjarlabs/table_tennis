extends KinematicBody2D

signal score(side)

export var start_speed = 200
export var speed_increment = 20
export var angle_boundary_degrees = 30
export var spin_modifier = 3

var start_position
var screen_size
var speed
var velocity
var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	start_position = Vector2(position.x, position.y)
	screen_size = get_viewport_rect().size
	_reset()


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision:
		var offset = collision.position - collision.collider.global_position
		velocity = velocity.bounce(collision.normal)
		velocity.y += spin_modifier * offset.y
		speed += speed_increment
		velocity = velocity.normalized() * speed

	if position.y < 0:
		velocity.y = -velocity.y

	elif position.y > screen_size.y:
		velocity.y = -velocity.y

	if position.x < 0:
		# right score
		emit_signal("score", "right")
		_reset()
	elif position.x > screen_size.x:
		# left score
		emit_signal("score", "left")
		_reset()


func _reset():
	position.x = start_position.x
	position.y = start_position.y
	speed = start_speed
	var angle
	if rng.randi() % 2:
		# left
		angle = rng.randi_range(angle_boundary_degrees, 180 - angle_boundary_degrees)
	else:
		# right
		angle = rng.randi_range(180 + angle_boundary_degrees, 360 - angle_boundary_degrees)
	angle = deg2rad(angle)
	var direction = Vector2(0, 1).rotated(angle)
	velocity = direction * speed
