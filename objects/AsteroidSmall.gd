extends "res://objects/Asteroid.gd"

var shield_scene := load("res://objects/Shield.tscn")

func _ready() -> void:
	var main_camera = get_node("/root/Game/MainCamera")
	self.connect("explode", main_camera, "asteroid_small_exploded")
	score_value = 250

func explode():
	if is_exploded:
		return
	
	is_exploded = true
	
	_explosion_particles()
	_play_explosion_sound()
	
	emit_signal("explode")
	emit_signal("score_changed", score_value)
	
	rng.randomize()
	var random = rng.randi_range(0, 15)
	if (random == 1):
		_spawn_shield_small()
	
	_spawn_score()
	
	get_parent().remove_child(self)
	queue_free()

func _spawn_score():
	var points_scored = points_scored_scene.instance()
	points_scored.get_node("Label").text = str(score_value)
	points_scored.position = self.position
	
	get_parent().add_child(points_scored)

func _play_explosion_sound():
	var explosion_sound = AudioStreamPlayer2D.new()
	explosion_sound.stream = load("res://assets/SpaceAsteroidArcadeShooterAssets/assets/audio/sfx/AsteroidExplosion.wav")
	explosion_sound.pitch_scale = 1.2
	explosion_sound.position = self.position
	get_parent().add_child(explosion_sound)
	explosion_sound.play(0)

func _spawn_shield_small():
	var shield = shield_scene.instance()
	shield.position = self.position
	_randomize_trajectory(shield)
	get_parent().add_child(shield)
