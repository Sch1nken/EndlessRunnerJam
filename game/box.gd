extends CharacterBody2D

enum TYPE {
	NORMAL,
	EXPLOSION
}

@export var type: TYPE = TYPE.NORMAL

func _process(delta: float) -> void:
	position.x -= delta * GameData.level_speed
	if position.x < -64:
		queue_free()
