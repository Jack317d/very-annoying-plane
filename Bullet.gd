extends CharacterBody2D

var speed = 400

func _ready():
	velocity = speed * Vector2.RIGHT
	velocity = velocity.rotated(rotation)

func _physics_process(delta):
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	
	if body.name == "Plane":
		body.kaboom()
		body.global_position = body.get_parent().startPos
		body.velocity = Vector2(0, 0)
		body.rotateVelocity = 0
		body.rotation_degrees = 0
		queue_free()
	if body.name == "StaticBody2D":
		queue_free()
