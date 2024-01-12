extends CanvasLayer

func update_towers_destroyed(towers_destroyed, total_towers):
	$TowersDestroyed.text = "Towers Destroyed: "  + str(towers_destroyed) + "/" + str(total_towers)

func update_player_health(player_health):	
	$Health.text = "Health: " + str(player_health)
