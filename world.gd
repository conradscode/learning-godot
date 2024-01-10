extends Node2D

var towers_destroyed = 0
var player_health = 100

func _ready():
	$HUD.update_player_health(player_health)
	$HUD.update_towers_destroyed(towers_destroyed)
	
func _process(delta):
	pass


func _on_towers_child_exiting_tree(node):
	towers_destroyed += 1
	$HUD.update_towers_destroyed(towers_destroyed)
		
func _on_spider_player_hit():
	player_health -= 25
	$HUD.update_player_health(player_health)	
