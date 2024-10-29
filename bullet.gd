class_name Bullet
extends Area2D

@export var speed: float = 128.0
@export var spread: float = 32.0


func _ready() -> void:
	position.y += randf() * spread


func _process(delta: float) -> void:
	position.x -= delta * speed
	if position.x < 32.0:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	body.die()
