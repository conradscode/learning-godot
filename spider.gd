extends CharacterBody2D

signal player_hit

var chase_player = false
var player

const SPIDER_SPEED = 25

func _physics_process(delta):
	if (chase_player):
		player = $"../../Player"
		var spider_direction = (player.position - self.position).normalized()
		velocity = spider_direction * SPIDER_SPEED
	else:
		set_velocity(Vector2(0,0))
	move_and_slide()
	
func _on_player_chase_body_entered(body):
	if (body.name == 'Player'):
		chase_player = true

func _on_player_chase_body_exited(body):
	if (body.name == 'Player'):
		chase_player = false

func _on_player_collision_body_entered(body):
	if (body.name == 'Player'):
		player_hit.emit()
		queue_free()
