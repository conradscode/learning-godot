extends Node2D
	
signal player_ate

const COLLECTIBLE = preload("res://Collectibles/collectible.tscn")
const MAX_COLLECTIBLES = 10000
const EXISTING_CHILD_NODE_COUNT = 1

var collectibles_count

func _on_spawn_timer_timeout():
	collectibles_count = self.get_child_count() - EXISTING_CHILD_NODE_COUNT
	print(collectibles_count)
	if (!collectibles_count >= MAX_COLLECTIBLES):
		var collectible = COLLECTIBLE.instantiate()
		collectible.player_ate.connect(_on_player_ate)
		if (!collectible.is_overlapping):
			self.add_child(collectible)
	
func _on_player_ate():
	player_ate.emit()
