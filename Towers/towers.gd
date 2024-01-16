extends Node2D

signal tower_destroyed

const TOWER_SCENE = preload("res://Towers/tower.tscn")
const MAX_TOWERS = 15

func _ready():
	for n in MAX_TOWERS:
		var tower = TOWER_SCENE.instantiate()
		tower.tower_destroyed.connect(_on_tower_destroyed)
		self.add_child(tower)
		
func _on_tower_destroyed():
	tower_destroyed.emit()

