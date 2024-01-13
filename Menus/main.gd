extends Node2D

const WORLD_SCENE_PATH = "res://Menus/world.tscn"

func _on_play_pressed():
	get_tree().change_scene_to_file(WORLD_SCENE_PATH)

func _on_quit_pressed():
	get_tree().quit()
