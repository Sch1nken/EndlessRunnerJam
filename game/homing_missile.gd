extends Bullet

@export var target: Node2D
@onready var life_timer: Timer = $LifeTimer
@onready var sprite_2d: Sprite2D = $Sprite2D

var blink_started: bool = false

func _process(delta: float) -> void:
	#var velocity: Vector2 = Vector2(1.0, 0.0)
	if not is_instance_valid(target):
		queue_free()
		return

	var dir = global_position.direction_to(target.global_position).angle()
	global_rotation = rotate_toward(rotation, dir, delta)

	position += transform.x * delta * 350.0
	
	if not blink_started:
		if life_timer.time_left < 3.5:
			print("now")
			blink_started = true
	else:
		sprite_2d.modulate = Color(1.0, 1.0, 1.0, life_timer.time_left / life_timer.wait_time)
	
func _on_life_timer_timeout() -> void:
	queue_free()
