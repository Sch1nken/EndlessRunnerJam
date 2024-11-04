class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var death_scene: PackedScene

func _ready() -> void:
	assert(death_scene != null)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		GameData.level_speed = GameData.level_speed + delta * 5
		GameData.bullet_speed = GameData.bullet_speed + delta * 2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die() -> void:
	var death: Node2D = death_scene.instantiate()
	add_sibling(death)
	death.global_position = global_position
	queue_free()
	get_tree().create_timer(3.0).timeout.connect(get_tree().quit)
