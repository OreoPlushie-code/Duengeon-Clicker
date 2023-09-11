extends CanvasLayer
@onready var player =  $AnimationPlayer

func change_scene(target :String):
	player.play("scene change")
	await player.animation_finished
	get_tree().change_scene_to_file(target)
	player.play_backwards("scene change")
	
	
