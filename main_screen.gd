extends Node2D

func _ready():
	pass
	#$AudioStreamPlayer.play()
	

func _process(delta):
	pass
	
func _on_texture_button_pressed():
	$tut.open_tut("res://level_1.tscn")
	
func _on_texture_button_2_pressed():
	get_tree().quit()
	
func _on_texture_button_3_pressed():
	$transition.change_scene("res://credits.tscn")
