extends CharacterBody2D
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump

var has_key: bool = false
const SPEED = 100.0
const JUMP_VELOCITY = -325.0
const ACCELERATION = 800.0
const FRICTION = 1000.0
const COYOTE_TIME: float = 0.15
var coyote_timer: float = 0.0
var was_on_floor: bool = false


@export var push_force: float = 5000.0

 # Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		coyote_timer = COYOTE_TIME
	else:
		coyote_timer -= delta
	
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("restart"):
		get_tree().call_deferred("reload_current_scene")
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and coyote_timer > 0.0:
		sfx_jump.play()
		velocity.y = JUMP_VELOCITY
		coyote_timer = 0.0

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#Play animations !!!
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	move_and_slide()
	
	
	#Apply movement

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider is RigidBody2D:
			var push_dir = -collision.get_normal()
			if abs(push_dir.x) > 0.5 and abs(push_dir.y) < 0.5:
				collider.apply_central_impulse(Vector2(push_dir.x, 0) * push_force * delta)
			
	
	
	
	
