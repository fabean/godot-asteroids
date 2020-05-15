extends Sprite

var asteroid_sprite1 = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/asteroids/meteorGrey_big1.png")
var asteroid_sprite2 = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/asteroids/meteorGrey_big2.png")
var asteroid_sprite3 = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/asteroids/meteorGrey_big3.png")
var asteroid_sprite4 = preload("res://assets/SpaceAsteroidArcadeShooterAssets/assets/images/asteroids/meteorGrey_big4.png")
var rng = RandomNumberGenerator.new()

func _ready():
	random_asteroid()

func random_asteroid():
	rng.randomize()
	var sprite_id = rng.randi_range(1, 4)
	if (sprite_id == 1):
		set_texture(asteroid_sprite1)
	if (sprite_id == 2):
		set_texture(asteroid_sprite2)
	if (sprite_id == 3):
		set_texture(asteroid_sprite3)
	if (sprite_id == 4):
		set_texture(asteroid_sprite4)
