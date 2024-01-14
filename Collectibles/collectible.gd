extends Area2D

signal player_ate

var is_overlapping

func _ready():
	set_random_position()
	
func _process(delta):
	if (is_overlapping):
		set_random_position()
		
func _on_body_entered(body):
	if (body.name == "Player"):
		player_ate.emit()
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.5)		
		tween.tween_callback(queue_free)
	else:
		is_overlapping = true
		
func _on_body_exited(body):
	is_overlapping = false	
		
func set_random_position():
	self.position = Vector2(randi_range(20,1139), randi_range(16, 648))


