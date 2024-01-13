extends Node2D

signal tower_destroyed

func _ready():
	for child in get_children():
		child.connect("tower_destroyed", _on_tower_destroyed)
		
func _on_tower_destroyed():
	tower_destroyed.emit()

