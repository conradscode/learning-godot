extends Node2D

signal player_hit
		
const ENEMY_SCENE = preload("res://Enemies/enemy.tscn")
const MAX_ENEMIES = 12
const INITIAL_CHILD_NODE_COUNT = 1

var enemy_count

func _on_spawn_timer_timeout():
	enemy_count = self.get_child_count() - INITIAL_CHILD_NODE_COUNT
	if (!enemy_count >= MAX_ENEMIES):
		var enemy = ENEMY_SCENE.instantiate()
		enemy.player_hit.connect(_on_player_hit)
		self.add_child(enemy)
		
func _on_player_hit():
	player_hit.emit()
