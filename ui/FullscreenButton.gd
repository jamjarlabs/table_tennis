extends TextureButton


func _ready():
	if OS.window_fullscreen:
		set_pressed_no_signal(true)


func _on_FullscreenButton_toggled(_button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
