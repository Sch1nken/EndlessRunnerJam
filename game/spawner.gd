class_name Spawner
extends Node2D

@export var item_to_spawn: PackedScene
@export var target_parent: Node2D

const HOMING_MISSILE = preload("res://game/homing_missile.tscn")

@onready var player: Player = $"../Player"

var spawners: Array[Marker2D]

func _ready() -> void:
	spawners.assign(find_children("", "Marker2D", false))
		

func _on_timer_timeout() -> void:
	if randi_range(0, 10) != 0:
		var item: Node2D = HOMING_MISSILE.instantiate()
		item.global_position = spawners.pick_random().global_position
		item.target = player
		target_parent.add_child(item)
	else:
		var item: Node2D = item_to_spawn.instantiate()
		item.global_position = spawners.pick_random().global_position
		target_parent.add_child(item)
