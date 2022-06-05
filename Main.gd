extends Node

# Only used in HTML5 mode
var _on_window_resize_callback_ref = null

onready var current_level = $Menu


func _ready():
	if OS.get_name() == "HTML5":
		_on_window_resize_callback_ref = JavaScript.create_callback(self, "_on_window_resize")
		var window = JavaScript.get_interface("window")
		window.onresize = _on_window_resize_callback_ref

		_web_resize_window()
	_connect_change_level(current_level)


func _on_window_resize(_args):
	_web_resize_window()


func _web_resize_window():
	if OS.window_fullscreen:
		return
	var width = JavaScript.eval(
		"""
		var wrapper = document.getElementById(window.JamJar.CanvasWrapperID);
		wrapper.clientWidth;
	"""
	)
	var height = JavaScript.eval(
		"""
		var wrapper = document.getElementById(window.JamJar.CanvasWrapperID);
		wrapper.clientHeight;
	"""
	)
	OS.set_window_size(Vector2(width, height))


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
