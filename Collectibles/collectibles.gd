extends Node2D
	
signal player_ate

const COLLECTIBLE_SCENE = preload("res://Collectibles/collectible.tscn")
const MAX_COLLECTIBLES = 10
const INITIAL_CHILD_NODE_COUNT = 1

var collectible_count

func _on_spawn_timer_timeout():
	collectible_count = self.get_child_count() - INITIAL_CHILD_NODE_COUNT
	if (!collectible_count >= MAX_COLLECTIBLES):
		var collectible = COLLECTIBLE_SCENE.instantiate()
		collectible.player_ate.connect(_on_player_ate)
		self.add_child(collectible)
	
func _on_player_ate():
	player_ate.emit()
