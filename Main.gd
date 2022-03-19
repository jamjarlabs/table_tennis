extends Node

onready var current_level = $Menu


func _ready():
	_connect_change_level(current_level)


func _on_level_changed(level_name, args):
	var next_level

	match level_name:
		"play_singleplayer":
			next_level = _load_level("Singleplayer")
		"play_multiplayer":
			next_level = _load_level("Multiplayer")
		"menu":
			next_level = _load_level("Menu")
		"game_over":
			next_level = _load_level("GameOver")
			next_level.init(args[0])
		_:
			return

	add_child(next_level)
	_connect_change_level(next_level)
	current_level.queue_free()
	current_level = next_level


func _load_level(name):
	return load("res://levels/" + name + ".tscn").instance()


func _connect_change_level(level):
	level.connect("level_changed", self, "_on_level_changed")
