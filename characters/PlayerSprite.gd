extends Sprite

var default_ship = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/ships/playerShip2_blue.png")
var shield_ship = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/ships/playerShip2_green.png")

func _on_Player_player_add_shield():
	set_texture(shield_ship)

func _on_Player_player_remove_shield():
	set_texture(default_ship)
