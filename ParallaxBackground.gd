extends ParallaxBackground

@export var speed = 150.0
@export var direction = Vector2.LEFT

func _process(delta):
	scroll_base_offset += (speed * 2*direction) * delta
