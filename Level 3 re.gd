extends Node2D


var score = 0
var seconds = 15
var score_increment = 1

signal check

func _ready():
	$AudioStreamPlayer2.play()

	
func _on_texture_button_pressed():
	if seconds != 10:
		score += score_increment
		$Label.text = str(score)
		print(score)
		$AudioStreamPlayer.play()
		check.emit()
		
func _on_timer_timeout():
	seconds -= 1
	$Label2.text = str(seconds) +" "+"Seconds left"
	check.emit()
	
func _on_startbutton_pressed():
	score = 0
	$Label.text = "Click fast!!"
	$Timer.start()
	$startbutton.hide()
	$"hard button".hide()
	$power.visible = true
	check.emit()
	
func _on_hard_button_pressed():
	score = 0
	seconds /= 2
	$Label.text = "Click fast!!"
	$Timer.start()
	$startbutton.hide()
	$"hard button".hide()
	$power.visible = true
	check.emit()
	
func check_score():
	$Label3.hide()
	if seconds == 0 and score < 200:
		print("You Lose")
		$Label2.text = "You Lose"
		$Timer.stop()
		$AnimationPlayer.play("wait time")
		await $AnimationPlayer.animation_finished
		$transition.change_scene("res://main_screen.tscn")
		
	elif seconds > 0 and score >= 200:
		print("You Win")
		$Timer.stop()
		$Label2.text = "You Win"
		$AnimationPlayer.play("wait time")
		await $AnimationPlayer.animation_finished
		$transition.change_scene("res://level_4_re.tscn")
	else:
		pass
		
	if seconds == 0:
		$Timer.stop()
		

func _on_power_pressed():
	if $power.text == """Use PowerUp""":
		score_increment = 4
		$"power timer".start()
		$power.text = "PowerUp Activated"
		

func _on_power_timer_timeout():
	score_increment = 1
	$"power timer".stop()
	$power.text = "Power Up Used Up"
	
		
	
	
