extends CanvasLayer

export var left_controls = true
export var right_controls = true


func _ready():
	if !left_controls:
		$LeftControls.hide()
	if !right_controls:
		$RightControls.hide()


func _on_score_updated(score):
	$Score.text = "%d:%d" % score
