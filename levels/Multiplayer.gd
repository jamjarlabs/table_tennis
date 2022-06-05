extends Node

signal score_updated(score)
signal level_changed(level_name)

export var target_score = 5

var score = [0, 0]


func _on_score(side):
	if side == "left":
		score[0] += 1
	else:
		score[1] += 1

	if score[0] >= target_score:
		emit_signal(
			"level_changed", "game_over", ["Left paddle wins!\n Final score: %d:%d" % score]
		)
		return

	if score[1] >= target_score:
		emit_signal(
			"level_changed", "game_over", ["Right paddle wins!\n Final score: %d:%d" % score]
		)
		return

	emit_signal("score_updated", score)
