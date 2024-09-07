extends StaticBody2D

var target
const bullet = preload("res://bullet.tscn")

func _on_area_2d_body_exited(body):
	
	if body.name == "Plane":
		target = null

func _physics_process(delta):
	
	if target:
		$Node2D.look_at(target.global_position)

func _on_area_2d_body_entered(body):
	
	if body.name == "Plane":
		target = body





func _on_timer_timeout():
	
	if target:
		
		var b = bullet.instantiate()
		
		b.global_position = $Node2D/Marker2D.global_position
		b.rotation_degrees = $Node2D.rotation_degrees
		
		get_parent().add_child(b)
		
