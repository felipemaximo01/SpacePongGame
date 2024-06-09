extends CharacterBody2D

var started = false
var start_speed = 500

func _physics_process(delta):
	if Input.is_action_pressed("Start") and started == false:
		start_game()
		
	move_and_collide(velocity*delta)
	
func start_game():
	started = true
	velocity.y = -start_speed
