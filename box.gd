extends CharacterBody2D

enum TYPE {
	NORMAL,
	EXPLOSION
}

@export var type: TYPE = TYPE.NORMAL

# TODO: Bitte woanders hin packen, danke
var speed: float = 64.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * speed
	if position.x < -64:
		queue_free()
