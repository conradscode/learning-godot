extends CharacterBody2D

const PLAYER_SPEED = 50

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	set_motion_mode(CharacterBody2D.MOTION_MODE_FLOATING)

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * PLAYER_SPEED
	else:
		$AnimatedSprite2D.play("idle")
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if velocity.y != 0:
		var animation = "walk_up" if velocity.y < 0 else "walk_down"
		$AnimatedSprite2D.play(animation)
	elif velocity.x != 0:
		$AnimatedSprite2D.play("walk_side")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	move_and_slide()
