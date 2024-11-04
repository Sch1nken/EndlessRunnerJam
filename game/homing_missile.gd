extends Bullet

@export var target: Node2D
@onready var life_timer: Timer = $LifeTimer
@onready var sprite_2d: Sprite2D = $Sprite2D

var blink_started: bool = false

const BLINK_START_THRESHOLD: float = 0.8
const MIN_FREQUENCY: float = 1.5 * PI
const MAX_FREQUENCY: float = 4.0 * PI
const BASE_SPEED: float = 350.0
const SLOW_SPEED: float = 150.0

func _process(delta: float) -> void:
	#var velocity: Vector2 = Vector2(1.0, 0.0)
	if not is_instance_valid(target):
		queue_free()
		return

	var dir = global_position.direction_to(target.global_position).angle()
	global_rotation = rotate_toward(rotation, dir, delta)
	var time_progress: float = 1 - (life_timer.time_left / life_timer.wait_time)

	var speed = BASE_SPEED

	if not blink_started:
		if time_progress >= BLINK_START_THRESHOLD:
			print("start blinking")
			blink_started = true			
	else:
		speed = remap(time_progress, BLINK_START_THRESHOLD, 1.0, BASE_SPEED, SLOW_SPEED)
		
		var frequency: float = remap(time_progress, BLINK_START_THRESHOLD, 0.95, MIN_FREQUENCY, MAX_FREQUENCY)
		
		var alpha: float = abs(sin(frequency))
		
		#print("time_progress: ", time_progress, ", frequency: ", frequency, ", alpha:" , alpha)
		# einfach ausfaden
		#var alpha: float = 1.0 - 
		sprite_2d.modulate = Color(1.0, 1.0, 1.0, alpha)
	
	position += transform.x * delta * speed

func _on_life_timer_timeout() -> void:
	queue_free()
