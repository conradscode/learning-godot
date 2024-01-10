extends CanvasLayer

func update_towers_destroyed(towers_destroyed):
	$TowersDestroyed.text = "Towers Destroyed: "  + str(towers_destroyed)

func update_player_health(player_health):	
	$Health.text = "Health: " + str(player_health)
