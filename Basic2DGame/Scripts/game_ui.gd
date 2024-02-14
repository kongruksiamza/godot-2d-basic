extends CanvasLayer

signal start_game
#แสดงผลคะแนน
func display_score(score):
	$ScoreLabel.text = str(score)

func display_status(message):
	$StatusLabel.text=message
	$StatusLabel.show()
	$StatusTimer.start()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_status_timer_timeout():
	$StatusLabel.hide()
	
func display_gameover():
	display_status("Game Over :(")
	await $StatusTimer.timeout
	$StatusLabel.text="My Game 2D"
	$StatusLabel.show()
	$StartButton.show()
