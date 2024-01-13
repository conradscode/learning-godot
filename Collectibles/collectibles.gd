extends Node2D
	
var collectible = preload("res://Collectibles/collectible.tscn")

func _on_spawn_timer_timeout():
	var collectible_temp = collectible.instantiate()
	collectible_temp.position = Vector2(randi_range(50,1152), randi_range(50, 656))
	self.add_child(collectible_temp)
