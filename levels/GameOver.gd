extends Node

signal level_changed(level_name)

onready var score_text


func init(text):
	score_text = text


func _ready():
	$Score.text = score_text


func _on_MainMenu_pressed():
	emit_signal("level_changed", "menu", [])
