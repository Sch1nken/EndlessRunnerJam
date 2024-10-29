extends TileMapLayer

func _process(delta: float) -> void:
	position.x -= delta * GameData.level_speed
	if position.x < - 16.0:
		position.x += 16.0
