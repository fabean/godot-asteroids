extends RigidBody2D

signal explode
signal score_changed

var score_value := 500
var is_exploded := false
var points_scored_scene = load("res://ui/PointsScored.tscn")

func _ready() -> void:
	var label = get_tree().get_root().get_node("Game/GUI/MarginContainer/HBoxContainer/VBoxContainer/Score")
	self.connect("score_changed", label, "update_score")
	var player = get_tree().get_root().get_node("Game/Player")
	self.connect("explode", player, "add_player_shield")

func explode():
	if is_exploded:
		return
		
	emit_signal("explode")
	emit_signal("score_changed", score_value)
	
	_spawn_score()
	is_exploded = true
	queue_free()

func _spawn_score():
	var points_scored = points_scored_scene.instance()
	points_scored.get_node("Label").text = str(score_value)
	points_scored.position = self.position
	
	get_parent().add_child(points_scored)

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
