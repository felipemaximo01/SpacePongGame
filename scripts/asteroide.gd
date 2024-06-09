extends Area2D

@export var speed = 140
@export var rotation_speed = 1.3
@onready var timer_delete = $TimerDelete

var start_side

func _ready():
	if global_position.x > 540:
		start_side = "right"
	else:
		start_side = "left"
		
func _process(delta):
	if start_side == "right":
		global_position.x -= speed * delta
		rotation -= rotation_speed * delta
	elif start_side == "left":
		rotation += rotation_speed * delta
		global_position.x += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	timer_delete.start()


func _on_timer_delete_timeout():
	queue_free()


func _on_body_entered(body):
	body.pongs += 1
	queue_free()
