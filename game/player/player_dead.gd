extends CPUParticles2D


func _ready() -> void:
	one_shot = true
	restart()
	

func _on_finished() -> void:
	queue_free()
