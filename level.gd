extends TileMapLayer

@export var speed: float = 64.0

func _process(delta: float) -> void:
	position.x -= delta * speed
	if position.x < - 16.0:
		position.x += 16.0
