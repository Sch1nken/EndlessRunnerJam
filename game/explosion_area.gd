class_name ExplosionArea
extends Area2D


const EXPLOSION: PackedScene = preload("res://game/explosion.tscn")

func _on_body_entered(body: Node2D) -> void:
	_spawn_explosion(body.global_position)
	body.queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	_spawn_explosion(area.global_position)
	area.queue_free()

func _spawn_explosion(pos: Vector2) -> void:
	var particles: GPUParticles2D = EXPLOSION.instantiate() as GPUParticles2D
	particles.global_position = pos
	add_child(particles)
	particles.emitting = true
	particles.finished.connect(func() -> void: particles.queue_free())
