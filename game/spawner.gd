class_name Spawner
extends Node2D

@export var item_to_spawn: PackedScene
@export var target_parent: Node2D

var spawners: Array[Marker2D]

func _ready() -> void:
	spawners.assign(find_children("", "Marker2D", false))
		

func _on_timer_timeout() -> void:
	var item: Node2D = item_to_spawn.instantiate()
	item.global_position = spawners.pick_random().global_position
	target_parent.add_child(item)
