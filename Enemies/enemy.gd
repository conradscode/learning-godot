extends CharacterBody2D

signal player_hit

const PLAYER_PATH = "../../Player"

var chase_player = false
var player
var animation

const ENEMY_SPEED = 40

func _physics_process(delta):
	if (chase_player):
		player = get_node(PLAYER_PATH)
		var enemy_direction = (player.position - self.position).normalized()
		velocity = enemy_direction * ENEMY_SPEED
		if (abs(velocity.y) > abs(velocity.x)):
			animation = "walk_up" if velocity.y < 0 else "walk_down"
			$AnimatedSprite2D.play(animation)
		else:
			animation = "walk_left" if velocity.x < 0 else "walk_right"
			$AnimatedSprite2D.play(animation)
	else:
		$AnimatedSprite2D.play("idle")
		set_velocity(Vector2(0,0))
	move_and_slide()
	
func _on_player_chase_body_entered(body):
	if (body.name == "Player"):
		chase_player = true

func _on_player_chase_body_exited(body):
	if (body.name == "Player"):
		chase_player = false

func _on_player_collision_body_entered(body):
	if (body.name == "Player"):
		player_hit.emit()
		queue_free()
