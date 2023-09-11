extends CanvasLayer

@onready var player = $AnimationPlayer

func open_tut(target :String):
	player.play("Tutuorial")
	await player.animation_finished
	get_tree().change_scene_to_file(target)
	

	
	
	
