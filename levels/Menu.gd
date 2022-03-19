extends Node

signal level_changed(level_name)


func _on_Singleplayer_pressed():
	emit_signal("level_changed", "play_singleplayer", [])


func _on_Multiplayer_pressed():
	emit_signal("level_changed", "play_multiplayer", [])
