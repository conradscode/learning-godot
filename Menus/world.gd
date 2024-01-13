extends Node2D

const MESSAGE_SCREEN_PATH = "res://Menus/message_screen.tscn"

var towers_destroyed
var player_health
var total_towers

func _ready():
	set_player_statistics()	
		
func _on_towers_tower_destroyed():
	update_towers_destroyed()
	if (towers_destroyed == total_towers):
		show_game_over_screen("CONGRATS! You destroyed all the towers.")
	
func _on_spiders_player_hit():
	update_player_health(-25)
	if (player_health <= 0):
		show_game_over_screen("LOSER! You died.")		
	
func set_player_statistics():
	total_towers = $Towers.get_child_count(false)	
	towers_destroyed = 0
	$HUD.update_towers_destroyed(towers_destroyed, total_towers)
	
	player_health = 100
	$HUD.update_player_health(player_health)
	
func update_player_health(amount):
	player_health += amount
	$HUD.update_player_health(player_health)	
	
func update_towers_destroyed():
	towers_destroyed += 1
	$HUD.update_towers_destroyed(towers_destroyed, total_towers)

func show_game_over_screen(label_text):
	var next_scene = preload(MESSAGE_SCREEN_PATH).instantiate()
	next_scene.get_node("Outcome").text = (label_text)
	get_tree().get_root().add_child(next_scene)
	queue_free()
