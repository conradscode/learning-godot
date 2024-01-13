extends Node2D

signal player_hit

func _ready():
	for child in get_children():
		child.connect("player_hit", _on_player_hit)
		
func _on_player_hit():
	player_hit.emit()
