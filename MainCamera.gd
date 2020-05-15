extends Camera2D



func _on_Player_laser_shoot() -> void:
	$ScreenShake.start(0.1, 15, 4, 0)

func asteroid_exploded():
	$ScreenShake.start(0.1, 15, 12, 2)

func asteroid_small_exploded():
	$ScreenShake.start(0.1, 15, 8, 1)
