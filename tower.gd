extends StaticBody2D

var tower_health = 10

func _on_break_tower_pressed():
	tower_health -= 1
	if (tower_health == 0):
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.5)		
		tween.tween_callback(queue_free)