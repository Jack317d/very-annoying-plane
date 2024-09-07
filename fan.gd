extends StaticBody2D

var target = []
@export var direction = Vector2.RIGHT
@export var distance = 1

func _ready():
	print(rotation_degrees)
	if round(rotation_degrees) == 90:
		direction = Vector2.DOWN
	if round(rotation_degrees) == 180:
		direction = Vector2.LEFT
	if round(rotation_degrees) == 270:
		direction = Vector2.UP
	
	$Area2D.scale.x = distance / 1.042
	$ColorRect.size.x = distance * 64 - 16

func _physics_process(delta):
	
	for t in target:
		
		if t.name == "Plane":
			t.velocity += 12 * direction
		elif "Bullet" in t.name:
			t.velocity += 20 * direction

func _on_area_2d_body_entered(body):
	
	
	if "Fannable" in body.get_groups():
		target.append(body)
		print(target)


func _on_area_2d_body_exited(body):
	
	if "Fannable" in body.get_groups():
		target.erase(body)
