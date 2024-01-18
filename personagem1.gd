extends CharacterBody2D


@export var personagem1_movement_data : Personagem1MovementData

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	addGravity(delta)
	
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	handle_acceleration(direction,delta)
	handle_air_acceleration(direction,delta)
	apply_friction(direction,delta)
	apply_air_resistance(direction,delta)


	move_and_slide()
func addGravity(delta):
	if not is_on_floor():
		velocity.y += gravity * personagem1_movement_data.gravity_scale * delta
		
func handle_acceleration(direction,delta):
	if not is_on_floor(): return
	if direction:
		#velocity.x = move_toward(velocity.x,SPEED * direction, ACCELERATION * delta)  |  correr
		velocity.x = move_toward(velocity.x,personagem1_movement_data.speed * direction, personagem1_movement_data.acceleration * delta)

func handle_air_acceleration(direction,delta):
	if is_on_floor(): return
	if direction:
		#velocity.x = move_toward(velocity.x,SPEED * direction, ACCELERATION * delta)  |  correr
		velocity.x = move_toward(velocity.x,personagem1_movement_data.speed * direction, personagem1_movement_data.air_acceleration * delta)

func apply_friction(direction,delta):
	if  direction == 0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, personagem1_movement_data.friction * delta)
func apply_air_resistance(direction,delta):
	if  direction == 0 and not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, personagem1_movement_data.air_resistance * delta)
