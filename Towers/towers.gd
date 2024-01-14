extends Node2D

signal tower_destroyed

func _ready():
	for child in get_children():
		child.tower_destroyed.connect(_on_tower_destroyed)
		
func _on_tower_destroyed():
	tower_destroyed.emit()

