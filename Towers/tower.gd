extends StaticBody2D

signal tower_destroyed

var tower_health = 10
var player_within_range

func _ready():
	set_random_position()	
		
func _on_break_tower_pressed():
	if player_within_range:
		tower_health -= 1
		if (tower_health == 0):
			tower_destroyed.emit()
			var tween = get_tree().create_tween()
			tween.tween_property(self, "modulate:a", 0, 0.5)		
			tween.tween_callback(queue_free)


func _on_player_interaction_body_entered(body):
	if (body.name == "Player"):
		player_within_range = true

func _on_player_interaction_body_exited(body):
	if (body.name == "Player"):
		player_within_range = false
		
func set_random_position():
	self.position = Vector2(randi_range(20,1000), randi_range(100, 550))
