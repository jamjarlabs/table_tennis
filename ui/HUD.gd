extends CanvasLayer

export var left_controls = true
export var right_controls = true


func _ready():
	var touch_enabled = OS.has_touchscreen_ui_hint()

	if left_controls:
		if touch_enabled:
			$LeftTouchControls.show()
		else:
			$LeftControls.show()

	if right_controls:
		if touch_enabled:
			$RightTouchControls.show()
		else:
			$RightControls.show()


func _on_score_updated(score):
	$Score.text = "%d:%d" % score
