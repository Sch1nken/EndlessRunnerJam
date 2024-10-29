extends Node2D

@onready var obstacle_spawn: Marker2D = $ObstacleSpawn
@onready var obstacles: Node2D = $Obstacles

const BOX: PackedScene = preload("res://game/box.tscn")

var shapes: Array[Array] = [
	[
		Vector2i(0, 0),
		Vector2i(0, -1)
	],
	[
		Vector2i(0, 0),
		Vector2i(1, 0)
	],
	[
		Vector2i(0, 0),
		Vector2i(1, -1)
	],
	[
		Vector2i(0, -1)
	]
]

func _on_obstacle_timer_timeout() -> void:
	var shape: Array[Vector2i] = []
	shape.assign(shapes.pick_random())
		
	for pos in shape:
		var box: CharacterBody2D = BOX.instantiate()
		obstacles.add_child(box)
		
		box.position = obstacle_spawn.position + Vector2(pos * 32)
