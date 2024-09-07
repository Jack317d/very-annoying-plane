extends Area2D



func _on_body_entered(body):
	
	if body.name == "Plane":
		body.kaboom()
		body.global_position = body.get_parent().startPos
		body.velocity = Vector2(0, 0)
		body.rotateVelocity = 0
		body.rotation_degrees = 0
		
